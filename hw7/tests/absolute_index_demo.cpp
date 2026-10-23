// Safe model of the lab's logical cross-side overwrite; no out-of-bounds C++ access.
#include "order_book.hpp"
#include <cmath>
#include <iostream>
#include <vector>

int main() {
    constexpr int nlev = 1 << 16;
    constexpr int wrong_tick = 71998;
    constexpr int ask_tick = wrong_tick - nlev; // 6462: $64.62
    std::vector<std::uint32_t> adjacent_sides(2 * nlev, 0);
    adjacent_sides[nlev + ask_tick] = 10;
    // Model an absolute bid index into two logical halves of one legal buffer.
    adjacent_sides[wrong_tick] += 10;
    std::cout << "Safe absolute-index model: ask at 64.62 grew from 10 to "
              << adjacent_sides[nlev + ask_tick] << '\n';
    if (adjacent_sides[nlev + ask_tick] != 20) return 1;

    Book b;
    b.add(1, 'B', 719.98, 10);
    b.add(2, 'S', 720.02, 10);
    b.add(3, 'B', 100.00, 10); // outside this symbol's initial band: rejected
    const bool ok = std::abs(b.best_bid() - 719.98) < 1e-8 &&
                    std::abs(b.best_ask() - 720.02) < 1e-8;
    std::cout << (ok ? "PASS" : "FAIL") << ": banded BBO remains 719.98 / 720.02\n";
    return ok ? 0 : 1;
}
