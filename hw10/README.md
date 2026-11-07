# HW10 — Lock-free SPSC ring buffer

[`spsc_ring.hpp`](spsc_ring.hpp) implements the course `SPSCRing` interface for
one producer and one consumer. Pass a nonzero power of two as the capacity.
The constructor allocates all slots. `push()` returns `false` when full, and
`pop()` returns `false` when empty and leaves its output untouched.

`tail - head` tracks occupancy, and `index & (capacity - 1)` selects the slot.
The producer release-stores `tail` after writing a value. The consumer
acquire-loads `tail` before reading the value. The consumer release-stores
`head` after reading it, and the producer acquire-loads `head` before reusing
the slot. Each thread relaxed-loads its own counter. The counters are
64-byte aligned on separate cache lines, and `push()` and `pop()` perform no
allocation or locking on the tested x86-64 target.

## Results

Measured November 6, 2026 on Ubuntu under WSL2, x86-64, AMD Ryzen 9 9955HX,
GCC 15.2.0. Normal builds used `-std=c++17 -O2 -pthread`. One producer wrote
consecutive integers into a 65,536-slot ring, and one consumer checked every
value against its expected position. Throughput is completed item transfers
per second, with one push and one pop per transfer.

| Test | Result |
| --- | --- |
| Course single-thread tests | `basic`, `empty_pop`, `full`, `fifo`, `wrap` all passed |
| Course FIFO, 2 million items | Passed, 135,875,205 transfers/s (`spsc_ops_per_sec`) |
| Course FIFO, 10 million items per run | All three runs passed, 150,027,733 / 126,298,278 / 119,840,074 transfers/s |
| Bundled FIFO, 10 million items | Passed, 137,251,491 transfers/s |
| Course and bundled ThreadSanitizer runs, 200,000 items each | Both exited 0 with no warnings |

The throughput samples are local measurements. Sanitizer timings are excluded.

## Reproduce

From the repository root, run the bundled correctness and stress driver:

```bash
cd hw10
g++ -std=c++17 -O2 -Wall -Wextra -Wpedantic -pthread spsc_test.cpp -o /tmp/hw10_spsc
/tmp/hw10_spsc 10000000

g++ -std=c++17 -O1 -g -pthread -fsanitize=thread spsc_test.cpp -o /tmp/hw10_spsc_tsan
TSAN_OPTIONS=halt_on_error=1 /tmp/hw10_spsc_tsan 200000
```

The [HW10 GitHub Actions workflow](../.github/workflows/hw10.yml) runs these
same checks on Linux. For the course starter, use this header as
`include/spsc_ring.hpp` and run `make spsc` and `make test`.
