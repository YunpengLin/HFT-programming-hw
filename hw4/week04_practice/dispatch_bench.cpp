#include <algorithm>
#include <cstdio>
#include <vector>
#include "../tests/bench.hpp"

struct Strategy {
    virtual ~Strategy() = default;
    virtual double on_book(double bid, double ask, double obi) = 0;
};
struct S0 final : Strategy {
    double on_book(double b, double a, double o) override {
        return o*(a - b);
    }
};
struct S1 final : Strategy {
    double on_book(double b, double a, double o) override {
        return  o + (a + b) / 2.0;
    }
};
struct S2 final : Strategy {
    double on_book(double b, double a, double o) override {
        return (a - b) - o;
    }
};
struct S3 final : Strategy {
    double on_book(double b, double a, double o) override {
        return  o*o + b;
    }
};
struct Direct {
    double on_book(double b, double a, double o) {
        return o*(a - b);
    }
};

static double g_sink;
constexpr long N = 20'000'000;

template <class F> double median_ns(F&& f, int reps = 7) {
    std::vector<double> v;
    for (int i = 0; i < reps; ++i) v.push_back(ns_per_op(f, N));
    std::sort(v.begin(), v.end());
    return v[reps / 2];
}

int main() {
    S0 s0; S1 s1; S2 s2; S3 s3;
    Strategy* one = &s0;
    Strategy* four[4] = {&s0, &s1, &s2, &s3};

    std::vector<unsigned char> pat(4096);
    unsigned x = 12345;
    for (auto& p : pat) {
        x = x * 1664525u + 1013904223u;
        p = (x >> 24) & 3;
    }
    double bid = 100.00, ask = 100.02;
    Direct d;
    auto run = [&](auto&& body) {
        double acc = 0.0;
        long i = 0;
        return median_ns([&] {
            acc += body((i & 7) * 0.1, i);
            ++i;
            doNotOptimize(acc);
            g_sink = acc;
        });
    };

    double t_direct = run([&](double a, long) {
        return d.on_book(bid, ask, a);
    });
    Strategy* volatile hide = one;
    double t_virt1 = run([&](double a, long) {
        return hide->on_book(bid, ask, a);
    });
    double t_virt4r = run([&](double a, long i) {
        return four[pat[i & 4095]]->on_book(bid, ask, a);
    });
    double t_virt4p = run([&](double a, long i) {
        return four[i & 3]->on_book(bid, ask, a);
    });
    S0* volatile hide0 = &s0;
    double t_final = run([&](double a, long) {
        return hide0->on_book(bid, ask, a);
    });

    std::printf("direct call (no base class)    %6.2f ns/call\n", t_direct);
    std::printf("virtual, 1 target              %6.2f ns/call\n", t_virt1);
    std::printf("virtual, 4 targets, i&3        %6.2f ns/call\n", t_virt4p);
    std::printf("virtual, 4 targets, random     %6.2f ns/call\n", t_virt4r);
    std::printf("final class, via S0*           %6.2f ns/call\n", t_final);
    std::printf("sink=%g\n", g_sink);
}
