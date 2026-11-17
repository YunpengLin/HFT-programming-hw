#pragma once
#include <cstdint>
#include <cstring>

// Caller supplies at least 20 bytes; no terminating NUL is written.
inline int u64toa(uint64_t v, char* out) {
    static constexpr char D2[] =
        "00010203040506070809101112131415161718192021222324"
        "25262728293031323334353637383940414243444546474849"
        "50515253545556575859606162636465666768697071727374"
        "75767778798081828384858687888990919293949596979899";
    char tmp[20];
    char* p = tmp + 20;                          // U1
    while (v >= 100) {                          // U2
        const unsigned r = static_cast<unsigned>(v % 100); // U3
        v /= 100;                              // U4
        p -= 2;
        p[0] = D2[2 * r];                       // U5
        p[1] = D2[2 * r + 1];                   // U6
    }
    if (v < 10) {
        *--p = static_cast<char>('0' + v);       // also writes '0' for zero
    } else {
        p -= 2;
        p[0] = D2[2 * v]; p[1] = D2[2 * v + 1];
    }
    const int n = static_cast<int>(tmp + 20 - p); // U7
    std::memcpy(out, p, n);
    return n;
}
