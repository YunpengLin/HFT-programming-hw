// HW4's dispatch benchmark with one CRTP row added under the same workload.
#include <algorithm>
#include <cstdio>
#include <vector>
#include "../hw4/tests/bench.hpp"
#include "strategies.hpp"

struct VirtualStrategy {
    virtual ~VirtualStrategy() = default;
    virtual double on_book(double bid, double ask, double obi) = 0;
};
struct VS0 final : VirtualStrategy {
    double on_book(double b, double a, double o) override { return o * (a - b); }
};
struct VS1 final : VirtualStrategy {
    double on_book(double b, double a, double o) override { return o + (a + b) / 2.0; }
};
struct VS2 final : VirtualStrategy {
    double on_book(double b, double a, double o) override { return (a - b) - o; }
};
struct VS3 final : VirtualStrategy {
    double on_book(double b, double a, double o) override {
        (void)a;
        return o * o + b;
    }
};
struct Direct {
    double on_book(double b, double a, double o) { return o * (a - b); }
};

// These external probes remain visible in -O2 -S output for dispatch inspection.
extern "C" double crtp_probe(double b, double a, double o) {
    S0 strategy;
    return strategy.on_book(b, a, o);
}
extern "C" double virtual_probe(VirtualStrategy& strategy, double b, double a, double o) {
    return strategy.on_book(b, a, o);
}

static double g_sink;
constexpr long N = 20'000'000;

template <class F>
double median_ns(F&& f, int reps = 7) {
    std::vector<double> samples;
    for (int i = 0; i < reps; ++i) samples.push_back(ns_per_op(f, N));
    std::sort(samples.begin(), samples.end());
    return samples[reps / 2];
}

int main() {
    VS0 s0;
    VS1 s1;
    VS2 s2;
    VS3 s3;
    VirtualStrategy* one = &s0;
    VirtualStrategy* four[4] = {&s0, &s1, &s2, &s3};

    std::vector<unsigned char> pattern(4096);
    unsigned x = 12345;
    for (auto& p : pattern) {
        x = x * 1664525u + 1013904223u;
        p = (x >> 24) & 3;
    }

    double bid = 100.00;
    double ask = 100.02;
    Direct direct;
    S0 crtp;
    auto run = [&](auto&& body) {
        double accumulated = 0.0;
        long i = 0;
        return median_ns([&] {
            accumulated += body((i & 7) * 0.1, i);
            ++i;
            doNotOptimize(accumulated);
            g_sink = accumulated;
        });
    };

    const double t_direct = run([&](double o, long) {
        return direct.on_book(bid, ask, o);
    });
    VirtualStrategy* volatile hide = one;
    const double t_virtual_one = run([&](double o, long) {
        return hide->on_book(bid, ask, o);
    });
    const double t_virtual_random = run([&](double o, long i) {
        return four[pattern[i & 4095]]->on_book(bid, ask, o);
    });
    const double t_virtual_repeating = run([&](double o, long i) {
        return four[i & 3]->on_book(bid, ask, o);
    });
    VS0* volatile hide0 = &s0;
    const double t_final = run([&](double o, long) {
        return hide0->on_book(bid, ask, o);
    });
    const double t_crtp = run([&](double o, long) {
        return crtp.on_book(bid, ask, o);
    });

    std::printf("direct call (no base class)    %6.2f ns/call\n", t_direct);
    std::printf("virtual, 1 target              %6.2f ns/call\n", t_virtual_one);
    std::printf("virtual, 4 targets, i&3        %6.2f ns/call\n", t_virtual_repeating);
    std::printf("virtual, 4 targets, random     %6.2f ns/call\n", t_virtual_random);
    std::printf("final class, via VS0*          %6.2f ns/call\n", t_final);
    std::printf("CRTP, known S0 type           %6.2f ns/call\n", t_crtp);
    std::printf("sink=%g\n", g_sink);
}
