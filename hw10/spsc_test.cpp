#include "spsc_ring.hpp"

#include <atomic>
#include <charconv>
#include <chrono>
#include <cstdint>
#include <cstdlib>
#include <iostream>
#include <string_view>
#include <thread>

static_assert(std::atomic<std::size_t>::is_always_lock_free);
static_assert(alignof(SPSCRing) >= 64);

static void check(bool ok, const char* message) {
    if (!ok) {
        std::cerr << message << '\n';
        std::exit(EXIT_FAILURE);
    }
}

static void check_boundaries() {
    SPSCRing single(1);
    std::uint64_t out = 99;
    check(single.empty() && !single.full(), "New ring should be empty");
    check(!single.pop(out) && out == 99, "Empty pop must preserve the output");
    check(single.push(42) && single.full() && !single.push(43), "Capacity-one full check failed");
    check(single.pop(out) && out == 42 && single.empty(), "Capacity-one pop failed");

    constexpr std::size_t capacity = 4;
    SPSCRing ring(capacity);
    for (std::uint64_t first = 0; first < 200000; first += capacity) {
        for (std::uint64_t i = 0; i < capacity; ++i) {
            check(ring.push(first + i), "Push failed before reaching capacity");
        }
        check(ring.full() && !ring.push(0), "Ring accepted a push when full");
        for (std::uint64_t i = 0; i < capacity; ++i) {
            check(ring.pop(out) && out == first + i, "FIFO order failed at wrap-around");
        }
        check(ring.empty(), "Ring should be empty after draining all items");
    }
    std::cout << "RESULT|correctness|pass|capacity, empty/full, FIFO and wrap-around\n";
}

static void stress(std::uint64_t count) {
    using Clock = std::chrono::steady_clock;
    SPSCRing ring(1u << 16);
    std::atomic<bool> failed{false};
    const auto started = Clock::now();
    const auto deadline = started + std::chrono::seconds(30);

    const auto retry = [&](auto attempt) {
        unsigned spins = 0;
        while (!attempt()) {
            if ((++spins & 4095u) == 0 && (failed.load() || Clock::now() >= deadline)) {
                failed.store(true);
                return false;
            }
        }
        return true;
    };

    std::thread producer([&] {
        for (std::uint64_t i = 0; i < count; ++i) {
            if (!retry([&] { return ring.push(i); })) {
                return;
            }
        }
    });
    std::thread consumer([&] {
        for (std::uint64_t i = 0; i < count; ++i) {
            std::uint64_t out = 0;
            if (!retry([&] { return ring.pop(out); })) {
                return;
            }
            if (out != i) {
                std::cerr << "Expected " << i << ", received " << out << '\n';
                failed.store(true);
                return;
            }
        }
    });
    producer.join();
    consumer.join();

    const double seconds = std::chrono::duration<double>(Clock::now() - started).count();
    check(!failed.load() && ring.empty(), "Concurrent FIFO failed or timed out");
    std::cout << "RESULT|concurrent|pass|" << count << " items transferred in order\n";
    std::cout << "THROUGHPUT " << static_cast<std::uint64_t>(count / seconds) << '\n';
}

int main(int argc, char* argv[]) {
    check(argc <= 2, "Usage: spsc_test [positive item count]");
    std::uint64_t count = 2000000;
    if (argc == 2) {
        const std::string_view arg(argv[1]);
        const char* end = arg.data() + arg.size();
        const auto parsed = std::from_chars(arg.data(), end, count);
        check(parsed.ec == std::errc{} && parsed.ptr == end && count > 0,
              "Item count must be a positive integer");
    }
    check_boundaries();
    stress(count);
}
