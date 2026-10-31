// HW9: one writer, four readers; correctness + before/after/shared_mutex timing.
#include <algorithm>
#include <atomic>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <mutex>
#include <shared_mutex>
#include <thread>
#include <type_traits>
#include <x86intrin.h> // this small benchmark targets x86-64 Linux / WSL

struct Quote { double bid, ask; std::uint32_t bq, aq; };
Quote quote(std::uint32_t n) { return {double(n), double(n)+1, n, n+1}; }
bool valid(const Quote& q) {
    return q.bid == q.bq && q.ask == q.bid+1 && q.aq == q.bq+1;
}

// Before=true changes only memory ordering to the conservative seq_cst policy.
// Shared bytes are atomic: copying an ordinary shared T would be a C++ data race.
template<class T, bool Before = false>
struct SeqLock {
    static_assert(std::is_trivially_copyable_v<T>);
    static_assert(std::atomic<unsigned char>::is_always_lock_free);
    static_assert(std::atomic<std::uint64_t>::is_always_lock_free);
    std::atomic<std::uint64_t> seq{0};
    std::atomic<unsigned char> data[sizeof(T)]{};
    static constexpr auto order = Before ? std::memory_order_seq_cst
                                         : std::memory_order_relaxed;

    explicit SeqLock(const T& initial = T{}) { write(initial); }
    void write(const T& v) { // SINGLE writer only
        const auto* bytes = reinterpret_cast<const unsigned char*>(&v);
        const auto s = seq.load(std::memory_order_relaxed);
        seq.store(s+1, order); // odd: update in progress
        if constexpr (!Before)
            std::atomic_thread_fence(std::memory_order_release); // S1
        for (std::size_t i=0; i<sizeof(T); ++i) data[i].store(bytes[i], order);
        seq.store(s+2, Before ? std::memory_order_seq_cst
                             : std::memory_order_release); // S2: publish even
    }
    bool read(T& out) const { // one attempt; caller retries false
        const auto first = seq.load(Before ? std::memory_order_seq_cst
                                          : std::memory_order_acquire); // S3
        if (first & 1U) return false; // S4
        unsigned char bytes[sizeof(T)];
        for (std::size_t i=0; i<sizeof(T); ++i) bytes[i] = data[i].load(order);
        if constexpr (!Before)
            std::atomic_thread_fence(std::memory_order_acquire); // S5
        if (first != seq.load(order)) return false; // S6
        std::memcpy(&out, bytes, sizeof(T));
        return true;
    }
};

template<class T>
struct Locked {
    mutable std::shared_mutex m;
    T data;
    explicit Locked(const T& initial) : data(initial) {}
    void write(const T& v) { std::unique_lock<std::shared_mutex> g(m); data=v; }
    bool read(T& out) const {
        std::shared_lock<std::shared_mutex> g(m); out=data; return true;
    }
};

std::uint64_t ticks() {
    unsigned aux;
    auto value = __rdtscp(&aux);
    _mm_lfence();
    return value; // invariant TSC reference ticks, not PMU core cycles
}

template<class Store>
double measure(const char* name, int count, bool& passed) {
    Store store(quote(0));
    std::atomic<int> ready{0};
    std::atomic<bool> go{false}, started{false}, stop{false};
    std::uint64_t elapsed[4]{}, errors[4]{}, retries[4]{}, checksum[4]{};
    std::uint64_t writes=0;
    std::thread readers[4];
    for (int id=0; id<4; ++id) readers[id] = std::thread([&,id] {
        ready.fetch_add(1, std::memory_order_relaxed);
        while (!go.load(std::memory_order_acquire)) {}
        while (!started.load(std::memory_order_acquire)) {}
        Quote q{};
        std::uint64_t bad=0, retry=0, sum=0;
        // Warm up while the writer is live, before starting the timer.
        for (int i=0; i<1000; ++i) while (!store.read(q)) _mm_pause();
        const auto begin=ticks();
        for (int i=0; i<count; ++i) {
            while (!store.read(q)) { ++retry; _mm_pause(); }
            bad += !valid(q); // validate EVERY accepted quote
            sum += q.bq; // consume the result
        }
        elapsed[id]=ticks()-begin;
        errors[id]=bad; retries[id]=retry; checksum[id]=sum;
    });
    std::thread writer([&] {
        ready.fetch_add(1, std::memory_order_relaxed);
        while (!go.load(std::memory_order_acquire)) {}
        store.write(quote(1)); writes=1;
        started.store(true, std::memory_order_release);
        while (!stop.load(std::memory_order_relaxed)) {
            ++writes;
            store.write(quote(static_cast<std::uint32_t>(writes % 1'000'000)));
        }
    });
    while (ready.load(std::memory_order_relaxed) != 5) {}
    go.store(true, std::memory_order_release);
    for (auto& reader: readers) reader.join();
    stop.store(true, std::memory_order_relaxed);
    writer.join();
    std::uint64_t total=0, bad=0, retry=0, sum=0;
    for (int i=0; i<4; ++i) {
        total+=elapsed[i]; bad+=errors[i]; retry+=retries[i]; sum+=checksum[i];
    }
    const double cycles=double(total)/(4.0*count);
    passed = passed && bad==0 && writes>1;
    std::printf("%s cycles/op=%.3f accepted=%d mixed=%llu retries=%llu writes=%llu checksum=%llu\n",
        name, cycles, 4*count, (unsigned long long)bad, (unsigned long long)retry,
        (unsigned long long)writes, (unsigned long long)sum);
    return cycles;
}

int main(int argc, char** argv) {
    const bool check = argc>1 && std::strcmp(argv[1], "--check")==0;
    const int rounds=check ? 1 : 5, count=check ? 200 : 200'000;
    double before[5]{}, after[5]{}, baseline[5]{};
    bool passed=true;
    for (int i=0; i<rounds; ++i) {
        before[i]=measure<SeqLock<Quote,true>>("before",count,passed);
        after[i]=measure<SeqLock<Quote>>("after",count,passed);
        baseline[i]=measure<Locked<Quote>>("shared_mutex",count,passed);
    }
    if (!check) {
        std::sort(before,before+5); std::sort(after,after+5); std::sort(baseline,baseline+5);
        std::printf("MEDIAN cycles/op: before=%.3f after=%.3f shared_mutex=%.3f\n",
                    before[2],after[2],baseline[2]);
    }
    std::puts(passed ? "PASS: no mixed quote observed" : "FAIL");
    return passed ? 0 : 1;
}
