// Extended flat Book correctness checks.
#include "order_book.hpp"

#include <iostream>
#include <stdexcept>

static bool near(double a, double b) { return std::abs(a - b) < 1e-8; }
static void expect(bool condition, const char* message) {
    if (!condition) throw std::runtime_error(message);
}

int main() {
    try {
        Book b;
        expect(near(b.best_bid(), 0.0) && near(b.best_ask(), 0.0), "empty book");
        b.add(1, 'B', 100.00, 5);
        b.add(2, 'B', 100.02, 3);
        b.add(3, 'S', 100.06, 4);
        b.add(4, 'S', 100.04, 2);
        b.add(5, 'B', 100.02, 7);
        b.add(6, 'S', 100.04, 6);
        expect(near(b.best_bid(), 100.02) && near(b.best_ask(), 100.04), "BBO after add");
        b.cancel(2);
        b.cancel(4);
        expect(near(b.best_bid(), 100.02) && near(b.best_ask(), 100.04), "retain occupied levels");
        b.cancel(5);
        b.cancel(6);
        expect(near(b.best_bid(), 100.00) && near(b.best_ask(), 100.06), "move best after emptied levels");
        b.cancel(999);
        b.cancel(2);
        b.cancel(1);
        b.cancel(3);
        expect(near(b.best_bid(), 0.0) && near(b.best_ask(), 0.0), "empty sides after cancel all");
        b.add(7, 'B', 109.32, 1);
        expect(near(b.best_bid(), 109.32), "rounding 109.32");
        b.add(7, 'S', 109.35, 2); // exercise policy: reuse id replaces old order
        expect(near(b.best_bid(), 0.0) && near(b.best_ask(), 109.35), "replace duplicate id");

        Book high;
        high.add(1, 'B', 719.98, 10);
        high.add(2, 'S', 720.02, 10);
        expect(near(high.best_bid(), 719.98) && near(high.best_ask(), 720.02), "high-price band");
        high.add(1, 'B', 100.00, 10); // reject before replacing the original id
        high.add(3, 'S', 2000.00, 10);
        high.cancel(3);
        expect(near(high.best_bid(), 719.98) && near(high.best_ask(), 720.02), "reject both band boundaries");
        high.cancel(1);
        high.cancel(2);
        expect(near(high.best_bid(), 0.0) && near(high.best_ask(), 0.0), "empty high-price book");

        Book low;
        low.add(1, 'B', 0.29, 1);
        low.add(2, 'S', 0.31, 1);
        expect(near(low.best_bid(), 0.29) && near(low.best_ask(), 0.31), "low-price rounding");

        Book large;
        const auto big = std::numeric_limits<std::uint32_t>::max();
        large.add(1, 'B', 20.00, big);
        large.add(2, 'B', 20.00, 1); // total 2^32: cannot use uint32_t aggregation
        large.add(3, 'B', 20.00, 1);
        large.cancel(3);
        expect(near(large.best_bid(), 20.00), "64-bit aggregate quantity");
        large.cancel(1);
        large.cancel(2);
        expect(near(large.best_bid(), 0.0), "empty after large quantities");

        std::cout << "PASS: Step 4 flat Book\n";
        return 0;
    } catch (const std::exception& e) {
        std::cerr << "FAIL: " << e.what() << '\n';
        return 1;
    }
}
