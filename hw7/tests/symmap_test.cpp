// Step 4.7: check the open-addressing symbol map.
// From submissions:
// g++ -std=c++20 -O2 -Wall -Wextra hw7/symmap_test.cpp -o /tmp/symmap_test
#include "order_book.hpp"

#include <iostream>
#include <stdexcept>
#include <string>

static void expect(bool condition, const char* message) {
    if (!condition) throw std::runtime_error(message);
}

// Generate collisions for the exercise's initial 64-slot FNV-1a table.
static std::uint64_t reference_hash(const std::string& key) {
    std::uint64_t h = 14695981039346656037ull;
    for (unsigned char c : key) { h ^= c; h *= 1099511628211ull; }
    return h;
}

int main() {
    try {
        constexpr auto absent = static_cast<std::uint64_t>(-1);
        SymMap m;
        expect(m.get("MISSING") == absent, "empty map miss");
        m.put("AAPL", 10);
        m.put("MSFT", 20);
        m.put("BRK.B", 99);
        expect(m.get("AAPL") == 10 && m.get("MSFT") == 20 && m.get("BRK.B") == 99, "put/get");
        m.put("AAPL", 11);
        expect(m.get("AAPL") == 11, "overwrite existing key");
        expect(m.get("TSLA") == absent, "missing symbol");
        m.put("ZERO", 0);
        m.put("BIGID", 0x8000000000000001ull);
        expect(m.get("ZERO") == 0 && m.get("BIGID") == 0x8000000000000001ull, "full uint64 id range");

        m.put("1234567890ABCDEF", 42);
        m.put("1234567890ABCDEG", 43);
        expect(m.get("1234567890ABCDEF") == 42, "16-character key");
        expect(m.get("1234567890ABCDEG") == 43, "different final character");
        m.put("1234567890ABCDEF", 44);
        expect(m.get("1234567890ABCDEF") == 44 && m.get("1234567890ABCDEG") == 43, "overwrite full-length key");

        char mutable_key[] = "OWNED";
        m.put(mutable_key, 123);
        mutable_key[0] = 'X';
        expect(m.get("OWNED") == 123 && m.get("XWNED") == absent, "map owns its key bytes");

        SymMap collisions;
        std::vector<std::string> keys;
        for (int n = 0; n < 100000 && keys.size() < 4; ++n) {
            const std::string key = "COL" + std::to_string(n);
            if ((reference_hash(key) & 63) == 63) keys.push_back(key);
        }
        expect(keys.size() == 4, "collision setup");
        // Same home slot 63: three stored keys must probe past the end to 0, 1.
        for (std::size_t i = 0; i < 3; ++i) collisions.put(keys[i].c_str(), 100 + i);
        for (std::size_t i = 0; i < 3; ++i)
            expect(collisions.get(keys[i].c_str()) == 100 + i, "collision/wraparound lookup");
        expect(collisions.get(keys[3].c_str()) == absent, "miss through occupied probe chain");
        collisions.put(keys[1].c_str(), 999);
        expect(collisions.get(keys[1].c_str()) == 999 && collisions.get(keys[2].c_str()) == 102, "overwrite inside collision chain");

        // Temporary input strings also check key ownership; >64 keys require growth.
        for (std::uint64_t i = 0; i < 10000; ++i)
            m.put(("SYM" + std::to_string(i)).c_str(), 1000 + i);
        for (std::uint64_t i = 0; i < 10000; ++i)
            expect(m.get(("SYM" + std::to_string(i)).c_str()) == 1000 + i, "lookup after growth");
        expect(m.get("SYM10001") == absent, "miss after growth");
        expect(m.get("AAPL") == 11 && m.get("1234567890ABCDEF") == 44 && m.get("OWNED") == 123, "old entries survive rehash");

        m.put("", 77); // supported by this exercise
        expect(m.get("") == 77, "empty string key");
        m.put("1234567890ABCDEFG", 555); // invalid 17-character input
        expect(m.get("1234567890ABCDEF") == 44, "long input must not overwrite prefix");
        expect(m.get("1234567890ABCDEFG") == absent, "long lookup must not match a stored prefix");
        expect(m.get(nullptr) == absent, "null pointer guard");
        std::cout << "PASS: Step 4 SymMap\n";
        return 0;
    } catch (const std::exception& e) {
        std::cerr << "FAIL: " << e.what() << '\n';
        return 1;
    }
}
