# HW12 — Fast integer formatting

`u64toa.hpp` exposes `int u64toa(uint64_t v, char* out)`. The caller supplies at least 20 writable bytes. The function writes decimal digits, returns their count, and omits the trailing null byte. It uses a fixed stack buffer without heap allocation or locale handling.

## Build and verify

From the repository root on x86-64 Linux:

```sh
g++ -std=c++17 -O2 -Wall -Wextra -Wpedantic hw12/bench.cpp -o /tmp/hw12_bench
/tmp/hw12_bench
```

The benchmark checks 0, single digits, powers of ten and their neighbors, 10-digit inputs, and `UINT64_MAX`. It also checks 200,000 deterministic inputs against `std::to_string` and verifies that the function writes exactly the reported number of bytes. For the course's `make u64toa` target, place `u64toa.hpp` in the starter repository's `include/` directory.

## Results

AMD Ryzen 9 9955HX, Windows x64, MSVC 19.51, C++17, `/O2`. Each sample formats 4,096 inputs 16 times into a reused caller buffer. The benchmark uses three warmup rounds and reports the median of 21 measured rounds. Cycles/op counts fenced `__rdtsc()` reference ticks, and throughput comes from `steady_clock`. The `std::to_string` baseline includes copying the returned string to the caller buffer so all four methods produce output there.

| Input | Formatter | ns/op | Cycles/op | Million ops/s |
| --- | --- | ---: | ---: | ---: |
| 1 digit | `snprintf` | 59.69 | 148.94 | 16.75 |
| 1 digit | `std::to_string` + copy | 20.42 | 50.94 | 48.98 |
| 1 digit | Before — one digit per step | 5.53 | 13.81 | 180.69 |
| 1 digit | After — two-digit lookup | 8.06 | 20.10 | 124.14 |
| 10 digits | `snprintf` | 74.61 | 186.16 | 13.40 |
| 10 digits | `std::to_string` + copy | 23.06 | 57.53 | 43.37 |
| 10 digits | Before — one digit per step | 31.02 | 77.39 | 32.24 |
| 10 digits | After — two-digit lookup | 19.08 | 47.60 | 52.42 |
| 20 digits | `snprintf` | 98.58 | 245.98 | 10.14 |
| 20 digits | `std::to_string` + copy | 83.13 | 207.43 | 12.03 |
| 20 digits | Before — one digit per step | 63.50 | 158.45 | 15.75 |
| 20 digits | After — two-digit lookup | 31.80 | 79.34 | 31.45 |
| Mixed, 1–20 digits | `snprintf` | 86.63 | 216.10 | 11.54 |
| Mixed, 1–20 digits | `std::to_string` + copy | 40.22 | 100.34 | 24.87 |
| Mixed, 1–20 digits | Before — one digit per step | 33.89 | 84.55 | 29.51 |
| Mixed, 1–20 digits | After — two-digit lookup | 20.42 | 50.96 | 48.97 |

Processing two digits at a time made the biggest difference. Each step takes a remainder modulo 100, looks up the two characters, and writes them from the end of the scratch array. This reduces the number of quotient and remainder steps and avoids reversing individual characters. On mixed inputs the result was 1.66x as fast as the initial implementation, 4.24x as fast as `snprintf`, and 1.97x as fast as `std::to_string` plus copying. For single-digit inputs, the initial version was faster because there was no multi-digit loop to shorten.
