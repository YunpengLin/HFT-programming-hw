# HW11 — FIX parsing

`fix_parser.hpp` exposes `parse_new_order(const char* buf, int len, NewOrder& out)`. It scans SOH-delimited fields and extracts ClOrdID (11), Symbol (55), Side (54), OrderQty (38), and Price (44) without per-message heap allocation. The order ID points into the input buffer and stays valid while those bytes remain intact. Symbols are stored in a fixed array and truncated to 15 characters.

A TCP read can contain several messages or a partial one. `fix_frame_size` reads tag 9 (BodyLength) and locates the seven-byte `10=ddd<SOH>` trailer. The batch benchmark reuses one `NewOrder`. The partial-frame test demonstrates how a caller leaves an incomplete tail unconsumed for the next read. Framing checks the trailer's syntax. It does not calculate the checksum.

## Build and verify

From the repository root on x86-64 Linux:

```sh
g++ -std=c++17 -O2 -Wall -Wextra -Wpedantic hw11/bench.cpp -o /tmp/hw11_bench
/tmp/hw11_bench
```

The benchmark runs correctness checks before timing. The checks cover all five fields, malformed inputs, quantity overflow, 2,000 comparisons with the split parser, 256 concatenated orders, and incomplete frames. For the course's `make fix` target, place `fix_parser.hpp` in the starter repository's `include/` directory.

## Results

AMD Ryzen 9 9955HX, Windows x64, MSVC 19.51, C++17, `/O2`. Each sample parses 256 concatenated orders 64 times. Every version uses the same framing logic. The benchmark uses three warmup rounds and reports the median of 21 measured rounds. Cycles/order counts fenced `__rdtsc()` reference ticks, and throughput comes from `steady_clock`.

| Parser | ns/order | Cycles/order | Million orders/s | Speedup vs. split |
| --- | ---: | ---: | ---: | ---: |
| Split baseline | 1,942.16 | 4,846.15 | 0.51 | 1.00x |
| Before — scan with bounded `strtod` | 188.64 | 470.67 | 5.30 | 10.30x |
| After — scan with decimal conversion | 86.74 | 216.41 | 11.53 | 22.39x |

The largest gain came from scanning the original buffer instead of splitting it into a vector of strings. A single scan finds each field boundary, skips unrelated tags, and takes a pointer and length for the order ID. That reduced the cost from 4,846.15 to 470.67 cycles/order. Replacing the bounded `strtod` call with direct decimal conversion then cut the cost by another factor of 2.17.
