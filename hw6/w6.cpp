// HW6: port the HW4 on_book strategy interface to static polymorphism.
#include <array>
#include <cstdint>
#include <cstdio>
#include <variant>
#include "strategies.hpp"

template <class S>
double tick(Strategy<S>& strategy) {
    return strategy.on_book(100.0, 100.02, 0.4);
}

// The table is fully built during compilation, then read by main at runtime.
struct TickTable {
    std::array<double, 256> price{};
    constexpr TickTable() {
        for (int i = 0; i < 256; ++i) price[i] = 100.0 + i * 0.01;
    }
};
constexpr TickTable kTicks{};
static_assert(kTicks.price[50] == 100.5, "tick 50 should be 100.50");

struct AggressiveFees {
    static constexpr double taker() { return 0.0015; }
};
struct RebateFees {
    static constexpr double taker() { return 0.0005; }
};
struct NoSkew {
    static constexpr double adjustment(double inventory) {
        (void)inventory;
        return 0.0;
    }
};
struct InventorySkew {
    static constexpr double adjustment(double inventory) {
        return inventory * 0.0001;
    }
};

// Policy types select fee and inventory behavior without virtual dispatch.
template <class FeePolicy, class SkewPolicy>
struct Quoter {
    double edge_needed(double spread, double inventory) const {
        return spread - FeePolicy::taker() + SkewPolicy::adjustment(inventory);
    }
};

// The visitor is an additional Week 6 lab example, independent of the benchmark.
struct BookUpdate { double mid, obi; };
struct Fill { double price; int quantity; };
struct SessionEvt { int code; };
struct Cancel { std::uint64_t id; };
using Msg = std::variant<BookUpdate, Fill, SessionEvt, Cancel>;

template <class... Fs>
struct overload : Fs... { using Fs::operator()...; };
template <class... Fs>
overload(Fs...) -> overload<Fs...>;

void handle(const Msg& message) {
    std::visit(overload{
        [](const BookUpdate& b) {
            std::printf("BookUpdate mid=%.2f obi=%.2f\n", b.mid, b.obi);
        },
        [](const Fill& f) {
            std::printf("Fill price=%.2f quantity=%d\n", f.price, f.quantity);
        },
        [](const SessionEvt& e) {
            std::printf("SessionEvt code=%d\n", e.code);
        },
        [](const Cancel& c) {
            std::printf("Cancel id=%llu\n", static_cast<unsigned long long>(c.id));
        }
    }, message);
}

int main() {
    S0 s0;
    S1 s1;
    S2 s2;
    S3 s3;
    std::printf("CRTP S0=%.4f S1=%.4f S2=%.4f S3=%.4f\n",
                tick(s0), tick(s1), tick(s2), tick(s3));
    std::printf("tick_table[50]=%.2f\n", kTicks.price[50]);

    Quoter<RebateFees, NoSkew> simple;
    Quoter<AggressiveFees, InventorySkew> inventory_aware;
    std::printf("quote edges=%.4f, %.4f\n",
                simple.edge_needed(0.01, 2.0),
                inventory_aware.edge_needed(0.01, 2.0));

    handle(Msg{BookUpdate{100.0, 0.8}});
    handle(Msg{Fill{100.1, 3}});
    handle(Msg{SessionEvt{1}});
    handle(Msg{Cancel{12345}});
}
