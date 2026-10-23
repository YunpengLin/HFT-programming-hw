// Intentionally incorrect lab demonstration. Contains undefined behavior.
// Kept separate from the submitted Book, correctness tests and CI.
#include <cstdint>
#include <iostream>
#include <memory>

struct AbsoluteBook {
    static constexpr int NLEV = 1 << 16;
    std::uint32_t bids[NLEV]{};
    std::uint32_t asks[NLEV]{};

    void add_bid(int absolute_tick, std::uint32_t qty) {
        bids[absolute_tick] += qty; // BUG: absolute_tick can exceed NLEV - 1.
    }
};

int main() {
    auto b = std::make_unique<AbsoluteBook>();
    b->asks[6462] = 10;
    std::cout << "Before: ask at 64.62 = " << b->asks[6462] << '\n';
    volatile int tick = 71998;
    b->add_bid(tick, 10); // Deliberately reproduce the lab's intra-object overflow.
    std::cout << "After: ask at 64.62 = " << b->asks[6462] << '\n';
}
