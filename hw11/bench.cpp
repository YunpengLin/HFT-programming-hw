#include "fix_parser.hpp"
#include <sstream>
#include <utility>
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


// Allocating split baseline; benchmark input is valid.
static NOINLINE bool split_parse(const char* buf, int len, NewOrder& out) {
    std::istringstream stream(std::string(buf, len));
    std::vector<std::string> fields;
    std::string field;
    while (std::getline(stream, field, '\x01')) fields.push_back(field);
    unsigned seen = 0;
    int offset = 0;
    for (const auto& f : fields) {
        const auto eq = f.find('=');
        if (eq == std::string::npos) return false;
        const int tag = std::stoi(f.substr(0, eq));
        const std::string value = f.substr(eq + 1);
        switch (tag) {
        case 11: out.clordid = buf + offset + eq + 1;
                 out.clordid_len = static_cast<int>(value.size()); seen |= 1; break;
        case 55: {
            const auto n = std::min<std::size_t>(15, value.size());
            std::memcpy(out.symbol, value.data(), n); out.symbol[n] = 0;
            seen |= 2; break;
        }
        case 54: out.side = value.at(0); seen |= 4; break;
        case 38: out.qty = static_cast<uint32_t>(std::stoul(value)); seen |= 8; break;
        case 44: out.price = std::stod(value); seen |= 16; break;
        }
        offset += static_cast<int>(f.size()) + 1;
    }
    return seen == 31;
}
static NOINLINE bool before(const char* b, int n, NewOrder& o) {
    return fix_detail::parse<false>(b, n, o);
}
static NOINLINE bool after(const char* b, int n, NewOrder& o) {
    return parse_new_order(b, n, o);
}
using Parser = bool (*)(const char*, int, NewOrder&);
static std::string frame(const std::string& body) {
    std::string s = "8=FIX.4.2\x01" "9=" + std::to_string(body.size()) + '\x01' + body;
    unsigned sum = 0;
    for (unsigned char c : s) sum += c;
    char checksum[8];
    std::snprintf(checksum, sizeof(checksum), "10=%03u", sum % 256);
    return s + checksum + '\x01';
}
static std::string body(unsigned i) {
    return "35=D\x01" "11=ORD" + std::to_string(i) + "\x01" "55=" +
        (i % 2 ? "MSFT" : "AAPL") + "\x01" "54=" + (i % 2 ? "2" : "1") +
        "\x01" "38=" + std::to_string(i * 13 + 1) + "\x01" "44=" +
        std::to_string(100 + i % 200) + ".25\x01";
}
static bool same(const NewOrder& a, const NewOrder& b) {
    return a.clordid_len == b.clordid_len &&
        std::memcmp(a.clordid, b.clordid, a.clordid_len) == 0 &&
        std::strcmp(a.symbol, b.symbol) == 0 && a.side == b.side &&
        a.qty == b.qty && std::abs(a.price - b.price) < 1e-9;
}
static void correctness() {
    NewOrder o{};
    const auto s = frame(body(17));
    require(parse_new_order(s.data(), static_cast<int>(s.size()), o), "valid order");
    require(o.clordid >= s.data() && o.clordid < s.data() + s.size(), "borrowed ID");
    require(o.qty == 222 && o.price == 117.25 && o.side == '2' &&
        std::strcmp(o.symbol, "MSFT") == 0, "expected fields");
    require(!parse_new_order(nullptr, 1, o) && !parse_new_order(s.data(), -1, o), "bad length");
    const std::string prefix = "11=X\x01" "55=AAPL\x01" "54=1\x01";
    for (const char* tail : {"38=1x\x01" "44=1\x01", "38=4294967296\x01" "44=1\x01",
         "38=\x01" "44=1\x01", "38=1\x01" "44=\x01", "38=1\x01" "44=1.2.3\x01",
         "38=1\x01" "44=2", "38=1\x01", "38=1\x01" "44=1\x01" "BAD\x01"}) {
        const auto bad = prefix + tail;
        require(!parse_new_order(bad.data(), static_cast<int>(bad.size()), o), "malformed accepted");
    }
    const std::string edges = "44=-0.125\x01" "38=4294967295\x01" "54=2\x01"
        "55=ABCDEFGHIJKLMNOPQRST\x01" "11=Z\x01" "999=ignored\x01";
    require(parse_new_order(edges.data(), static_cast<int>(edges.size()), o) &&
        o.qty == UINT32_MAX && o.price == -0.125 &&
        std::strcmp(o.symbol, "ABCDEFGHIJKLMNO") == 0, "boundaries/reordered tags");
    for (int n = 0; n < static_cast<int>(s.size()); ++n)
        require(fix_frame_size(s.data(), n) == 0, "partial frame");
    require(fix_frame_size(s.data(), static_cast<int>(s.size())) == static_cast<int>(s.size()), "frame size");
    auto bad = s; bad[bad.size()-7] = 'X';
    require(fix_frame_size(bad.data(), static_cast<int>(bad.size())) == -1, "checksum framing");
    bad = s; bad[12] = 'x';
    require(fix_frame_size(bad.data(), static_cast<int>(bad.size())) == -1, "bad BodyLength");
    for (unsigned i = 0; i < 2000; ++i) {
        const auto msg = frame(body(i));
        NewOrder a{}, b{}, c{};
        require(split_parse(msg.data(), static_cast<int>(msg.size()), a) &&
                before(msg.data(), static_cast<int>(msg.size()), b) &&
                after(msg.data(), static_cast<int>(msg.size()), c) &&
                same(a,b) && same(a,c), "parser comparison");
    }
    std::cout << "PASS: valid/malformed/boundaries, 2000 comparisons, every partial-frame length.\n";
}
static NOINLINE uint64_t batch_parse(const std::string& batch, Parser parse) {
    const char* p = batch.data();
    const char* end = p + batch.size();
    uint64_t sum = 0;
    NewOrder out{};
    while (p != end) {
        const int n = fix_frame_size(p, static_cast<int>(end-p));
        if (n <= 0 || !parse(p, n, out)) throw std::runtime_error("batch parse");
        sum += out.qty + static_cast<uint64_t>(out.price * 100) +
            out.clordid_len + out.symbol[0] + out.side;
        p += n;
    }
    return sum;
}
int main() {
    try {
        correctness();
        std::string batch;
        for (unsigned i = 0; i < 256; ++i) batch += frame(body(i));
        Parser parsers[] = {split_parse, before, after};
        require(batch_parse(batch, parsers[0]) == batch_parse(batch, parsers[2]), "batch comparison");
        const auto partial = batch + frame(body(1)).substr(0, 20);
        int offset = 0, count = 0;
        while (offset < static_cast<int>(partial.size())) {
            const int n = fix_frame_size(partial.data()+offset, static_cast<int>(partial.size())-offset);
            require(n >= 0, "valid partial batch");
            if (!n) break; // retain remainder for the next TCP read
            offset += n; ++count;
        }
        require(count == 256 && offset == static_cast<int>(batch.size()), "partial tail");
        std::cout << "PASS: 256 concatenated messages plus incomplete TCP tail.\n";
        environment();
        constexpr int repeats = 64;
        const auto results = measure([&](int method) {
            uint64_t sum = 0;
            for (int r = 0; r < repeats; ++r) sum += batch_parse(batch, parsers[method]);
            return sum;
        }, 3, 256 * repeats);
        const char* names[] = {"split baseline", "before: scan + strtod", "after: scan + decimal"};
        for (int i = 0; i < 3; ++i) row("FIX batch", names[i], results[i], results[0].cycles);
        std::cout << "before/after speedup: " << results[1].cycles/results[2].cycles << "x\n";
    } catch (const std::exception& e) { std::cerr << "FAIL: " << e.what() << '\n'; return 1; }
}

