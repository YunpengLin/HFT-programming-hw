#pragma once
#include <cstdint>
#include <cstring>
#include <cmath>
#include <cstdlib>
#include <limits>

struct NewOrder {
    const char* clordid; int clordid_len;
    char symbol[16]; char side;
    uint32_t qty; double price;
};

namespace fix_detail {
inline bool uint32(const char* p, const char* end, uint32_t& out) {
    if (p == end) return false;
    uint32_t v = 0;
    for (; p != end; ++p) {
        const unsigned d = static_cast<unsigned>(*p - '0');
        if (d > 9 || v > (UINT32_MAX - d) / 10) return false;
        v = v * 10 + d;                         // F1
    }
    out = v;
    return true;
}

// FIX decimal price: optional '-', digits, optional '.' followed by digits.
// No exponent, whitespace or locale. Every read stays inside [p, end).
inline bool decimal(const char* p, const char* end, double& out) {
    if (p == end) return false;
    const bool negative = *p == '-';
    if (negative) ++p;
    if (p == end || *p < '0' || *p > '9') return false;
    double value = 0.0;
    while (p != end && *p >= '0' && *p <= '9')
        value = value * 10.0 + (*p++ - '0');
    if (p != end && *p == '.') {
        ++p;
        if (p == end) return false;
        double fraction = 0.0, scale = 1.0;
        while (p != end && *p >= '0' && *p <= '9') {
            fraction = fraction * 10.0 + (*p++ - '0');
            scale *= 10.0;
        }
        value += fraction / scale;             // F2
    }
    if (p != end || !std::isfinite(value)) return false;
    out = negative ? -value : value;
    return true;
}

// Before/after experiment changes ONLY conversion of tag 44.
template<bool FastPrice>
inline bool parse(const char* buf, int len, NewOrder& out) {
    if (!buf || len <= 0) return false;
    const char* p = buf;
    const char* end = buf + len;
    unsigned seen = 0;
    while (p != end) {
        uint32_t tag = 0;
        const char* tag_start = p;
        while (p != end && *p != '=') {
            const unsigned d = static_cast<unsigned>(*p++ - '0');
            if (d > 9 || tag > (UINT32_MAX - d) / 10) return false;
            tag = tag * 10 + d;
        }
        if (p == end || p == tag_start) return false;
        ++p;                                   // consume '='
        const char* value = p;
        while (p != end && *p != '\x01') ++p;   // F3
        if (p == end) return false;             // truncated field
        const int n = static_cast<int>(p - value);
        switch (tag) {
        case 11:
            if (!n) return false;
            out.clordid = value;                // F4: view, NOT a copy
            out.clordid_len = n;
            seen |= 1;
            break;
        case 55: {
            if (!n) return false;
            const int count = n < 15 ? n : 15;
            std::memcpy(out.symbol, value, count);
            out.symbol[count] = '\0';          // F5
            seen |= 2;
            break;
        }
        case 54:
            if (n != 1 || (value[0] != '1' && value[0] != '2')) return false;
            out.side = value[0]; seen |= 4;
            break;
        case 38:
            if (!uint32(value, p, out.qty)) return false;
            seen |= 8;
            break;
        case 44:
            if constexpr (FastPrice) {
                if (!decimal(value, p, out.price)) return false;
            } else {
                // Bounded stack copy: strtod requires a terminated input.
                if (!n || n >= 128) return false;
                char tmp[128];
                std::memcpy(tmp, value, n); tmp[n] = '\0';
                char* stop = nullptr;
                out.price = std::strtod(tmp, &stop);
                if (stop != tmp + n || !std::isfinite(out.price)) return false;
            }
            seen |= 16;
            break;
        default: break;
        }
        ++p;                                   // consume SOH
    }
    return seen == 31;                          // F6: all five fields
}
} // namespace fix_detail

// out is usable only on success; clordid borrows buf's lifetime.
inline bool parse_new_order(const char* buf, int len, NewOrder& out) {
    return fix_detail::parse<true>(buf, len, out);
}

// Positive = first complete frame's byte count; 0 = need more; -1 = invalid.
// BodyLength counts bytes AFTER tag 9's SOH and BEFORE '10=ddd\x01'.
// Checksum syntax is checked, not its numeric sum (outside this exercise).
inline int fix_frame_size(const char* buf, int len) {
    if (!buf || len < 0) return -1;
    if (len < 6) return 0;
    if (std::memcmp(buf, "8=FIX.", 6) != 0) return -1;
    const char* end = buf + len;
    const char* p = buf;
    while (p != end && *p != '\x01') ++p;
    if (p == end) return 0;
    ++p;
    if (end - p < 2) return 0;
    if (p[0] != '9' || p[1] != '=') return -1;
    p += 2;
    const char* digits = p;
    while (p != end && *p != '\x01') {
        if (*p < '0' || *p > '9') return -1;
        ++p;
    }
    if (p == end) return 0;
    uint32_t body = 0;
    if (!fix_detail::uint32(digits, p, body)) return -1;
    ++p;
    const auto total = static_cast<uint64_t>(p - buf) + body + 7; // F7
    if (total > static_cast<uint64_t>(std::numeric_limits<int>::max())) return -1;
    if (total > static_cast<uint64_t>(len)) return 0;
    const char* checksum = p + body;
    if (checksum == p || checksum[-1] != '\x01' ||
        std::memcmp(checksum, "10=", 3) != 0 || checksum[6] != '\x01') return -1;
    for (int i = 3; i < 6; ++i)
        if (checksum[i] < '0' || checksum[i] > '9') return -1;
    return static_cast<int>(total);
}
