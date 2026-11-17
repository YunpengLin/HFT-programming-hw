#include "u64toa.hpp"
#include <limits>
#include <algorithm>
#include <array>
#include <chrono>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <iomanip>
#include <iostream>
#include <stdexcept>
#include <string>
#include <vector>
#if defined(_MSC_VER)
#include <intrin.h>
#define NOINLINE __declspec(noinline)
#else
#include <x86intrin.h>
#define NOINLINE __attribute__((noinline))
#endif

static volatile uint64_t sink = 0;
static void require(bool ok, const char* why) {
    if (!ok) throw std::runtime_error(why);
}
static uint64_t ticks() {
    _mm_lfence();
    const uint64_t t = __rdtsc();
    _mm_lfence();
    return t;
}
struct Result { double ns, cycles; };
template<class Run>
static std::array<Result, 4> measure(Run run, int methods, int operations) {
    std::array<std::vector<double>, 4> ns, cy;
    for (int round = -3; round < 21; ++round) {
        for (int k = 0; k < methods; ++k) {
            const int method = (k + round + 3) % methods; // rotate measurement order
            const auto t0 = std::chrono::steady_clock::now();
            const auto c0 = ticks();
            sink = run(method);
            const auto c1 = ticks();
            const auto t1 = std::chrono::steady_clock::now();
            if (round >= 0) {
                ns[method].push_back(std::chrono::duration<double, std::nano>(t1-t0).count() / operations);
                cy[method].push_back(static_cast<double>(c1-c0) / operations);
            }
        }
    }
    std::array<Result, 4> results{};
    for (int m = 0; m < methods; ++m) {
        std::sort(ns[m].begin(), ns[m].end());
        std::sort(cy[m].begin(), cy[m].end());
        results[m] = {ns[m][10], cy[m][10]};
    }
    return results;
}
static void row(const char* group, const char* method, Result r, double baseline) {
    std::cout << group << " | " << method << " | " << r.ns << " | " << r.cycles
              << " | " << 1000.0/r.ns << " | " << baseline/r.cycles << "\n";
}
static void environment() {
#if defined(_MSC_VER)
    std::cout << "Compiler: MSVC " << _MSC_VER << ", Windows x64\n";
#else
    std::cout << "Compiler: " << __VERSION__ << "\n";
#endif
    std::cout << "3 warmups; 21 measured rounds; median; x86 TSC ticks as cycles/op.\n"
              << "group | method | ns/op | cycles/op | million ops/s | speedup vs baseline\n";
    std::cout << std::fixed << std::setprecision(2);
}


static NOINLINE int before(uint64_t v, char* out) {
    char tmp[20]; int n = 0;
    do { tmp[n++] = static_cast<char>('0' + v % 10); v /= 10; } while (v);
    for (int i = 0; i < n; ++i) out[i] = tmp[n-1-i];
    return n;
}
static NOINLINE int after(uint64_t v, char* out) { return u64toa(v, out); }
static NOINLINE int c_format(uint64_t v, char* out) {
    return std::snprintf(out, 21, "%llu", static_cast<unsigned long long>(v));
}
static NOINLINE int cpp_format(uint64_t v, char* out) {
    const auto s = std::to_string(v);
    std::memcpy(out, s.data(), s.size());
    return static_cast<int>(s.size());
}
using Convert = int (*)(uint64_t, char*);
static uint64_t random_value(uint64_t& x) {
    x ^= x << 13; x ^= x >> 7; x ^= x << 17; return x;
}
static void check(uint64_t v) {
    char buf[22]; std::memset(buf, '#', sizeof(buf));
    const int n = u64toa(v, buf + 1);
    const auto want = std::to_string(v);
    require(n >= 1 && n <= 20 && static_cast<std::size_t>(n) == want.size() &&
        std::memcmp(buf + 1, want.data(), n) == 0 &&
        buf[0] == '#' && buf[n+1] == '#', "digits/length/buffer boundary");
    char other[21];
    for (Convert f : {before, c_format, cpp_format}) {
        const int m = f(v, other);
        require(m == n && std::memcmp(other, buf+1, n) == 0, "baseline mismatch");
    }
}
int main() {
    try {
        check(0); check(7); check(12345); check(1000000); check(9999999999ULL); check(UINT64_MAX);
        for (uint64_t p = 10;; p *= 10) {
            check(p-1); check(p); check(p+1);
            if (p > UINT64_MAX/10) break;
        }
        uint64_t seed = 88172645463325252ULL;
        for (int i = 0; i < 200000; ++i) check(random_value(seed));
        std::cout << "PASS: edges, powers of ten, 200k fuzz vs std::to_string; buffer canaries.\n";
        environment();
        Convert methods[] = {c_format, cpp_format, before, after};
        const char* names[] = {"snprintf", "std::to_string + copy", "before: /10 + reverse", "after: /100 + table"};
        const char* groups[] = {"1 digit", "10 digits", "20 digits", "mixed 1-20 digits"};
        constexpr int count = 4096, repeats = 16;
        for (int group = 0; group < 4; ++group) {
            std::array<uint64_t, count> values{};
            for (int i = 0; i < count; ++i) {
                const uint64_t x = random_value(seed);
                if (group == 0) values[i] = x % 10;
                else if (group == 1) values[i] = 1000000000ULL + x % 9000000000ULL;
                else if (group == 2) values[i] = 10000000000000000000ULL +
                    x % (UINT64_MAX - 10000000000000000000ULL + 1);
                else {
                    const int digits = i % 20 + 1;
                    uint64_t low = 1;
                    for (int k = 1; k < digits; ++k) low *= 10;
                    const uint64_t span = digits == 20 ? UINT64_MAX-low+1 : low*9;
                    values[i] = digits == 1 ? x % 10 : low + x % span;
                }
            }
            const auto results = measure([&](int method) {
                uint64_t sum = 0;
                char out[21];
                for (int r = 0; r < repeats; ++r)
                    for (uint64_t v : values) {
                        const int n = methods[method](v, out);
                        sum += n + static_cast<unsigned char>(out[0]) +
                            static_cast<unsigned char>(out[n-1]);
                    }
                return sum;
            }, 4, count * repeats);
            for (int m = 0; m < 4; ++m) row(groups[group], names[m], results[m], results[0].cycles);
            std::cout << "after speedups: before=" << results[2].cycles/results[3].cycles
                      << "x; std::to_string=" << results[1].cycles/results[3].cycles << "x\n";
        }
    } catch (const std::exception& e) { std::cerr << "FAIL: " << e.what() << '\n'; return 1; }
}

