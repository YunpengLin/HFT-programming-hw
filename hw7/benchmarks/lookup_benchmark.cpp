// Supplemental lookup benchmark: actual student Book/SymMap, not flat::SymMap.
// Timing includes loop, volatile pointer reload and result barrier overhead.
// All setup, allocations, checks, and output are outside the timed loops.
#include "order_book.hpp"
#include <algorithm>
#include <array>
#include <cstdint>
#include <chrono>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <map>
#include <numeric>
#include <random>
#include <stdexcept>
#include <string>
#include <unordered_map>
#include <vector>

#if defined(__x86_64__) || defined(__i386__)
#include <x86intrin.h>
#endif

template <class T> static inline void keep(T value) {
    asm volatile("" : : "g"(value) : "memory");
}

static std::uint64_t ticks() {
#if defined(__x86_64__) || defined(__i386__)
    _mm_lfence();
    const auto value = __rdtsc();
    _mm_lfence();
    return value;
#else
    return 0;
#endif
}

static double median(std::vector<double> samples) {
    std::sort(samples.begin(), samples.end());
    return samples[samples.size() / 2]; // 31 samples: odd count
}

template <class F>
static double measure(const char* name, F lookup, std::ofstream& csv) {
    constexpr std::size_t ITERS = 200000;
    constexpr int RUNS = 31;
    for (std::size_t i = 0; i < ITERS / 10; ++i) keep(lookup(i));
    std::vector<double> ns_samples, cycle_samples;
    ns_samples.reserve(RUNS);
    cycle_samples.reserve(RUNS);
    using Clock = std::chrono::steady_clock;
    for (int run = 0; run < RUNS; ++run) {
        const auto t0 = Clock::now();
        const auto c0 = ticks();
        for (std::size_t i = 0; i < ITERS; ++i) keep(lookup(i));
        const auto c1 = ticks();
        const auto t1 = Clock::now();
        const double ns = std::chrono::duration<double, std::nano>(t1 - t0).count() / ITERS;
        const double cycles = static_cast<double>(c1 - c0) / ITERS;
        ns_samples.push_back(ns);
        cycle_samples.push_back(cycles);
        if (csv.is_open()) csv << name << ',' << run + 1 << ',' << ns << ',' << cycles << '\n';
    }
    const double ns = median(ns_samples);
    std::cout << std::left << std::setw(35) << name << std::right
              << std::fixed << std::setprecision(3) << std::setw(12) << ns;
    if (ticks() == 0) std::cout << std::setw(14) << "n/a";
    else std::cout << std::setw(14) << median(cycle_samples);
    std::cout << std::setprecision(0) << std::setw(18) << 1e9 / ns << '\n';
    return ns;
}

struct TreeBook {
    std::map<int, std::uint64_t> bids, asks;
    double best_bid() const { return bids.empty() ? 0.0 : bids.rbegin()->first * 0.01; }
    double best_ask() const { return asks.empty() ? 0.0 : asks.begin()->first * 0.01; }
};

int main(int argc, char** argv) {
    try {
        std::ofstream csv;
        if (argc > 1) {
            csv.open(argv[1]);
            if (!csv) throw std::runtime_error("cannot open sample CSV");
            csv << "query,run,ns_per_op,tsc_ticks_per_op\n" << std::setprecision(12);
        }
        Book flat;
        TreeBook tree;
        struct Input { std::uint64_t id; char side; int tick; std::uint32_t qty; };
        std::vector<Input> orders;
        constexpr std::size_t N = 1024;
        std::mt19937_64 book_rng(99);
        for (std::size_t i = 0; i < 2 * N; ++i) {
            const int k = static_cast<int>(book_rng() % 256);
            const char side = (i & 1) ? 'S' : 'B';
            const int tick = side == 'B' ? 9999 - k : 10001 + k;
            const auto qty = static_cast<std::uint32_t>(1 + book_rng() % 9);
            orders.push_back({i, side, tick, qty});
            flat.add(i, side, tick * 0.01, qty);
            (side == 'B' ? tree.bids : tree.asks)[tick] += qty;
        }
        std::vector<std::size_t> cancel_order(orders.size());
        std::iota(cancel_order.begin(), cancel_order.end(), 0);
        std::shuffle(cancel_order.begin(), cancel_order.end(), std::mt19937_64(11));
        for (std::size_t i = 0; i < N; ++i) {
            const auto& o = orders[cancel_order[i]];
            flat.cancel(o.id);
            auto& levels = o.side == 'B' ? tree.bids : tree.asks;
            auto it = levels.find(o.tick);
            it->second -= o.qty;
            if (it->second == 0) levels.erase(it);
        }
        if (std::abs(flat.best_bid() - tree.best_bid()) > 1e-8 ||
            std::abs(flat.best_ask() - tree.best_ask()) > 1e-8)
            throw std::runtime_error("Book and map baseline disagree");

        const std::array<std::string, 8> keys = {
            "AAPL", "MSFT", "NVDA", "TSLA", "AMZN", "GOOGL", "META", "SPY"
        };
        SymMap symbols;
        std::unordered_map<std::string, std::uint64_t> standard;
        standard.max_load_factor(0.7f);
        standard.reserve(keys.size());
        for (std::size_t i = 0; i < keys.size(); ++i) {
            symbols.put(keys[i].c_str(), i);
            standard.emplace(keys[i], i);
        }
        for (const auto& key : keys)
            if (symbols.get(key.c_str()) != standard.at(key))
                throw std::runtime_error("SymMap and baseline disagree");
        if (symbols.get("MISSING") != static_cast<std::uint64_t>(-1))
            throw std::runtime_error("SymMap miss check failed");

        const Book* volatile book_ptr = &flat;
        const TreeBook* volatile tree_ptr = &tree;
        const SymMap* volatile sym_ptr = &symbols;
        const std::unordered_map<std::string, std::uint64_t>* volatile std_ptr = &standard;
        std::cout << "31 samples/query; 20000 warm-up ops; 200000 timed ops/sample\n"
                  << "Book: 1024 resting orders after add/cancel churn, 256 levels/side\n"
                  << "Symbols: course's 8 keys, cyclic queries, 100% hit, setup excluded\n"
                  << "cycles/op = TSC ticks/op, not actual dynamically clocked core cycles\n"
                  << "Numbers include loop, volatile pointer reload and result barrier overhead\n"
                  << std::left << std::setw(35) << "query" << std::right
                  << std::setw(12) << "ns/op" << std::setw(14) << "cycles/op"
                  << std::setw(18) << "ops/s" << '\n';
        const double bid = measure("Book.best_bid", [&](std::size_t) { return book_ptr->best_bid(); }, csv);
        const double map_bid = measure("map.best_bid", [&](std::size_t) { return tree_ptr->best_bid(); }, csv);
        measure("Book.best_ask", [&](std::size_t) { return book_ptr->best_ask(); }, csv);
        measure("map.best_ask", [&](std::size_t) { return tree_ptr->best_ask(); }, csv);
        const double bbo = measure("Book.BBO", [&](std::size_t) {
            const auto* p = book_ptr;
            return p->best_bid() + p->best_ask();
        }, csv);
        const double map_bbo = measure("map.BBO", [&](std::size_t) {
            const auto* p = tree_ptr;
            return p->best_bid() + p->best_ask();
        }, csv);
        const double sym = measure("SymMap.get", [&](std::size_t i) {
            return sym_ptr->get(keys[i & 7].c_str());
        }, csv);
        const double umap = measure("unordered_map.find(string)", [&](std::size_t i) {
            const auto* p = std_ptr;
            return p->find(keys[i & 7])->second;
        }, csv);
        const double cstr = measure("unordered_map.find(c_str)", [&](std::size_t i) {
            const auto* p = std_ptr;
            // Includes conversion to a temporary std::string, as in the course bench.
            return p->find(keys[i & 7].c_str())->second;
        }, csv);
        std::cout << std::fixed << std::setprecision(3)
                  << "best_bid speedup (map/student): " << map_bid / bid << "x\n"
                  << "BBO speedup (map/student): " << map_bbo / bbo << "x\n"
                  << "get speedup (existing string/student): " << umap / sym << "x\n"
                  << "get speedup (c_str conversion/student): " << cstr / sym << "x\n";
        return 0;
    } catch (const std::exception& e) {
        std::cerr << "FAIL: " << e.what() << '\n';
        return 1;
    }
}
