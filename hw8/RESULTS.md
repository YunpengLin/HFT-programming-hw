# HW8 RollingCounter results

Environment: local; measured at 2026-10-31T04:35:46.476913+00:00.

Course checks: **rc_window PASS; rc_mixed PASS**. Five additional boundary checks: **PASS**.

**Median: 2.60559 ns/op**, seven independent process runs.

One op is one interleaved **add + count** pair, including the result barrier and timestamp
increment. Each run warms up 200,001 iterations and measures 2,000,000 iterations,
with window_ns=1000 and timestamps increasing by 1 each iteration. Construction is outside
the timed interval. The course driver and bench.hpp are unmodified.

| Run | ns/op |
|---|---:|
| 1 | 2.56882 |
| 2 | 2.57619 |
| 3 | 2.64519 |
| 4 | 2.60748 |
| 5 | 2.60559 |
| 6 | 2.58469 |
| 7 | 2.92112 |

CPU: AMD Ryzen 9 9955HX 16-Core Processor. OS: Linux-6.18.33.2-microsoft-standard-WSL2-x86_64-with-glibc2.43.
Compiler: g++ (Ubuntu 15.2.0-16ubuntu1) 15.2.0. Flags: `-std=c++17 -O2 -pthread -Wall -Wextra -Wpedantic`.
These are machine-specific amortized stream timings, not worst-case count latency.
Raw output for every run and environment details are in report.json.
