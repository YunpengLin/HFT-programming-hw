# Performance experiment

Header SHA-256: `dd7194db8079cd67b2b0ae7d8908ff894578dbcacdf58268239fc9077b26ba5a`

CPU/compiler/flags: [environment.txt](environment.txt). Measured implementation: [header](../../versions/order_book_before.hpp). Timing sources are in [benchmarks](../../benchmarks/).

## Correctness and course output

[Course test](course_test.txt), [container run 1](containers_run1.txt), [container run 2](containers_run2.txt).

Container logs include every structure at N=64, 1024, 16384; add/cancel/BBO means, batch p50/p99, rehash spikes and the course reference SymMap block.

Copy one full container run into your write-up and describe the difference between runs. The final SymMap block in these course logs is the reference implementation; actual student SymMap measurements follow below.

## Your queries: warmed-up medians

Each program run has 31 samples/query, 200000 ops/sample, after 20000 warm-up ops. Symbols: eight course keys, cyclic hits only. Book: 1024 resting orders after add/cancel churn.

cycles/op means invariant/virtual TSC ticks per operation, not dynamically clocked core cycles. Throughput is single-thread loop ops/s. Loop, pointer reload and result-consumption overhead are included.

| Query | Run 1 ns/op | Run 1 TSC ticks/op | Run 1 ops/s | Run 2 ns/op | ns change |
|---|---:|---:|---:|---:|---:|
| Book.best_bid | 0.995 | 2.482 | 1004787814 | 0.994 | -0.1% |
| map.best_bid | 2.984 | 7.445 | 335098745 | 2.983 | -0.1% |
| Book.best_ask | 0.995 | 2.481 | 1005449536 | 0.994 | -0.0% |
| map.best_ask | 0.871 | 2.171 | 1148507801 | 0.870 | -0.0% |
| Book.BBO | 2.081 | 5.192 | 480449316 | 1.988 | -4.5% |
| map.BBO | 3.079 | 7.680 | 324772862 | 3.067 | -0.4% |
| SymMap.get | 10.859 | 27.093 | 92090868 | 11.055 | +1.8% |
| unordered_map.find(string) | 10.841 | 27.047 | 92245732 | 10.955 | +1.1% |
| unordered_map.find(c_str) | 23.070 | 57.563 | 43346713 | 22.128 | -4.1% |

Book.best_bid and Book.best_ask are single calls. Book.BBO is one bid+ask pair: keep these op definitions separate.

unordered_map.find(string) uses an existing std::string. unordered_map.find(c_str) includes temporary string conversion, as in the course harness. Name the chosen baseline when reporting speedup.

Raw per-sample values: [run 1 CSV](lookup_samples_run1.csv), [run 2 CSV](lookup_samples_run2.csv).

## Your Book: container-run variation

| N | Metric | Run 1 ns/op | Run 2 ns/op | Change |
|---:|---|---:|---:|---:|
| 64 | add | 97.50 | 94.80 | -2.8% |
| 64 | cancel | 675.40 | 659.40 | -2.4% |
| 64 | bbo | 2.06 | 2.08 | +1.0% |
| 1024 | add | 46.00 | 45.10 | -2.0% |
| 1024 | cancel | 83.80 | 86.10 | +2.7% |
| 1024 | bbo | 2.05 | 2.06 | +0.5% |
| 16384 | add | 34.10 | 34.10 | +0.0% |
| 16384 | cancel | 70.00 | 69.30 | -1.0% |
| 16384 | bbo | 2.05 | 2.06 | +0.5% |

Largest absolute change among add/cancel/BBO means: N=16384, 1a vector (unsorted), add: +38.7%.

All structures and percentile variations: [container_variation.csv](container_variation.csv).

