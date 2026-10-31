// Lab 9: race -> volatile -> atomic -> publication -> mutex.
#include <algorithm>
#include <atomic>
#include <chrono>
#include <cstdio>
#include <mutex>
#include <string>
#include <thread>

using Clock = std::chrono::steady_clock;

// Two threads, one million increments each; measure observed maximum latency.
template<class Increment>
void run(Increment increment) {
    std::atomic<int> ready{0};
    std::atomic<bool> go{false};
    double maximum[2]{};
    auto work = [&](int id) {
        ready.fetch_add(1, std::memory_order_relaxed);
        while (!go.load(std::memory_order_acquire)) {}
        double local_max = 0;
        for (int i = 0; i < 1'000'000; ++i) {
            auto start = Clock::now();
            increment();
            auto end = Clock::now();
            local_max = std::max(local_max,
                std::chrono::duration<double, std::nano>(end-start).count());
        }
        maximum[id] = local_max;
    };
    std::thread a(work, 0), b(work, 1);
    while (ready.load(std::memory_order_relaxed) != 2) {}
    go.store(true, std::memory_order_release);
    a.join(); b.join();
    std::printf("max_ns=%.0f ", std::max(maximum[0], maximum[1]));
}

int main(int argc, char** argv) {
    const std::string mode = argc > 1 ? argv[1] : "atomic";
    if (mode == "publish" || mode == "relaxed") {
        int payload = 0;
        int observed = 0;
        std::atomic<bool> ready{false};
        const bool broken = mode == "relaxed";
        std::thread producer([&] {
            payload = 42;
            ready.store(true, broken ? std::memory_order_relaxed
                                     : std::memory_order_release); // L3
        });
        std::thread consumer([&] {
            while (!ready.load(broken ? std::memory_order_relaxed
                                      : std::memory_order_acquire)) {} // L4
            observed = payload;
        });
        producer.join(); consumer.join();
        // With relaxed on both sides there is no happens-before edge protecting
        // ordinary payload. Printing 42 does not make that version correct.
        std::printf("payload=%d (expected 42)\n", observed);
        return observed == 42 ? 0 : 1;
    }

    long counter = 0;
    if (mode == "race") {
        run([&] { ++counter; }); // intentionally unsafe
    } else if (mode == "volatile") {
        volatile long value = 0; // volatile does NOT fix a data race
        run([&] { ++value; });
        counter = value;
    } else if (mode == "atomic") {
        std::atomic<long> value{0}; // L1
        run([&] { value.fetch_add(1, std::memory_order_relaxed); }); // L2
        counter = value.load();
    } else if (mode == "mutex") {
        std::mutex m;
        run([&] { std::lock_guard<std::mutex> guard(m); ++counter; }); // L5
    } else {
        std::puts("Use: race | volatile | atomic | publish | relaxed | mutex");
        return 2;
    }
    std::printf("counter=%ld (expected 2000000)\n", counter);
    return counter == 2'000'000 ? 0 : 1;
}
