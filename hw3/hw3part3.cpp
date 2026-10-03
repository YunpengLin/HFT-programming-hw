#include <algorithm>
#include <array>
#include <chrono>
#include <cstdio>
#include <memory>
#include <thread>

// These two helpers are copied from the starter repository's tests/bench.hpp.
// Keeping them here makes this submission independent of additional headers.
// The inline assembly is supported by GCC and Clang on Linux/WSL.
template <class T>
inline void doNotOptimize(T&& v) {
    asm volatile("" : : "g"(v) : "memory");
}

template <class F>
double ns_per_op(F&& f, long iters) {
    for (long i = 0; i < iters / 10 + 1; ++i) f();
    auto t0 = std::chrono::steady_clock::now();
    for (long i = 0; i < iters; ++i) f();
    auto t1 = std::chrono::steady_clock::now();
    return std::chrono::duration<double, std::nano>(t1 - t0).count() / iters;
}

int main() {
    constexpr long iterations = 50'000'000;
    constexpr int rounds = 5;

    // Allocate once, outside timing. raw observes the object owned by up.
    auto up = std::make_unique<double>(101.5);
    auto sp = std::make_shared<double>(101.5);
    double* raw = up.get();

    // In glibc/libstdc++, starting a thread disables the single-thread refcount
    // fast path. Timing still uses one thread with no refcount contention.
    std::thread([] {}).join();

    std::printf("Compiler: %s\n", __VERSION__);
#if defined(_LIBCPP_VERSION)
    std::printf("Standard library: libc++ %d\n", _LIBCPP_VERSION);
#elif defined(__GLIBCXX__)
    std::printf("Standard library: libstdc++ %ld\n", static_cast<long>(__GLIBCXX__));
#endif
    std::printf("Iterations per round: %ld; rounds: %d\n", iterations, rounds);
    std::puts("Times below are ns/op; shared_ptr copy includes temporary destruction.");

    std::array<double, rounds> raw_times{};
    std::array<double, rounds> unique_times{};
    std::array<double, rounds> shared_deref_times{};
    std::array<double, rounds> shared_copy_times{};

    for (int round = 0; round < rounds; ++round) {
        // Capture by reference so the lambda itself does not copy ownership.
        raw_times[round] = ns_per_op([&] {
            double value = *raw;
            doNotOptimize(value);
        }, iterations);

        unique_times[round] = ns_per_op([&] {
            double value = *up;
            doNotOptimize(value);
        }, iterations);

        shared_deref_times[round] = ns_per_op([&] {
            double value = *sp;
            doNotOptimize(value);
        }, iterations);

        shared_copy_times[round] = ns_per_op([&] {
            auto copy = sp; // Increment the strong reference count.
            doNotOptimize(copy.get());
        }, iterations); // Destroy the temporary and decrement its count.

        // Printing is outside the measured loops.
        std::printf("Round %d: raw=%.3f unique=%.3f shared_deref=%.3f shared_copy=%.3f\n",
                    round + 1, raw_times[round], unique_times[round],
                    shared_deref_times[round], shared_copy_times[round]);
    }

    const auto median = [](std::array<double, rounds> samples) {
        std::sort(samples.begin(), samples.end());
        return samples[rounds / 2];
    };
    std::puts("\nMedian results (ns/op):");
    std::printf("raw pointer deref  : %.3f\n", median(raw_times));
    std::printf("unique_ptr deref   : %.3f\n", median(unique_times));
    std::printf("shared_ptr deref   : %.3f\n", median(shared_deref_times));
    std::printf("shared_ptr copy    : %.3f\n", median(shared_copy_times));
}
