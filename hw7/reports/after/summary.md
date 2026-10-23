# Performance experiment

Header SHA-256: `86825a356f079fd75df26afcdf3b082a82a9ba57fd00cb32c9d6854e88333588`

CPU/compiler/flags: [environment.txt](environment.txt). Measured implementation: [header](../../order_book.hpp). Timing sources are in [benchmarks](../../benchmarks/).

## Correctness and course output

[Course test](course_test.txt), [container run 1](containers_run1.txt), [container run 2](containers_run2.txt).

Container logs include every structure at N=64, 1024, 16384; add/cancel/BBO means, batch p50/p99, rehash spikes and the course reference SymMap block.

Copy one full container run into your write-up and describe the difference between runs. The final SymMap block in these course logs is the reference implementation; actual student SymMap measurements follow below.

## Your queries: warmed-up medians

Each program run has 31 samples/query, 200000 ops/sample, after 20000 warm-up ops. Symbols: eight course keys, cyclic hits only. Book: 1024 resting orders after add/cancel churn.

cycles/op means invariant/virtual TSC ticks per operation, not dynamically clocked core cycles. Throughput is single-thread loop ops/s. Loop, pointer reload and result-consumption overhead are included.

| Query | Run 1 ns/op | Run 1 TSC ticks/op | Run 1 ops/s | Run 2 ns/op | ns change |
|---|---:|---:|---:|---:|---:|
| Book.best_bid | 0.995 | 2.483 | 1004585935 | 0.995 | -0.1% |
| map.best_bid | 3.120 | 7.782 | 320543128 | 3.078 | -1.3% |
| Book.best_ask | 0.995 | 2.483 | 1004535478 | 0.996 | +0.0% |
| map.best_ask | 0.996 | 2.484 | 1004232841 | 0.996 | -0.0% |
| Book.BBO | 2.114 | 5.273 | 472947408 | 1.992 | -5.8% |
| map.BBO | 3.116 | 7.771 | 320971130 | 3.128 | +0.4% |
| SymMap.get | 9.431 | 23.530 | 106032226 | 9.168 | -2.8% |
| unordered_map.find(string) | 11.161 | 27.847 | 89597586 | 10.970 | -1.7% |
| unordered_map.find(c_str) | 23.020 | 57.438 | 43440666 | 23.343 | +1.4% |

Book.best_bid and Book.best_ask are single calls. Book.BBO is one bid+ask pair: keep these op definitions separate.

unordered_map.find(string) uses an existing std::string. unordered_map.find(c_str) includes temporary string conversion, as in the course harness. Name the chosen baseline when reporting speedup.

Raw per-sample values: [run 1 CSV](lookup_samples_run1.csv), [run 2 CSV](lookup_samples_run2.csv).

## Your Book: container-run variation

| N | Metric | Run 1 ns/op | Run 2 ns/op | Change |
|---:|---|---:|---:|---:|
| 64 | add | 102.60 | 105.80 | +3.1% |
| 64 | cancel | 687.70 | 686.80 | -0.1% |
| 64 | bbo | 2.07 | 2.09 | +1.0% |
| 1024 | add | 45.00 | 44.70 | -0.7% |
| 1024 | cancel | 85.30 | 84.50 | -0.9% |
| 1024 | bbo | 2.06 | 2.08 | +1.0% |
| 16384 | add | 35.30 | 35.60 | +0.8% |
| 16384 | cancel | 70.70 | 70.40 | -0.4% |
| 16384 | bbo | 2.06 | 2.06 | +0.0% |

Largest absolute change among add/cancel/BBO means: N=16384, 1a vector (unsorted), bbo: +23.2%.

All structures and percentile variations: [container_variation.csv](container_variation.csv).

