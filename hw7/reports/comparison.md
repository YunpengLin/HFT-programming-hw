# Before/after lookup results

Same benchmark source, compiler flags and workloads. Each cell is a median over 62 per-batch samples (31 samples in each of two runs). cycles/op is TSC ticks/op.

| Query | Before ns/op | After ns/op | Before ticks/op | After ticks/op | Before/after |
|---|---:|---:|---:|---:|---:|
| Book.best_bid | 0.995 | 0.995 | 2.481 | 2.482 | 1.000x |
| map.best_bid | 2.984 | 3.117 | 7.444 | 7.775 | 0.957x |
| Book.best_ask | 0.995 | 0.996 | 2.481 | 2.483 | 0.999x |
| map.best_ask | 0.871 | 0.996 | 2.171 | 2.484 | 0.874x |
| Book.BBO | 1.990 | 2.083 | 4.965 | 5.195 | 0.955x |
| map.BBO | 3.076 | 3.126 | 7.672 | 7.797 | 0.984x |
| SymMap.get | 10.976 | 9.358 | 27.385 | 23.348 | 1.173x |
| unordered_map.find(string) | 10.883 | 11.083 | 27.153 | 27.651 | 0.982x |
| unordered_map.find(c_str) | 22.577 | 23.278 | 56.331 | 58.083 | 0.970x |

Only get() received a hot-path algorithm change. Small differences in unchanged Book and map rows are run variation/compiler-layout effects, not claimed Book optimizations.

[Source diff](../versions/optimization.diff); [before raw data](before/); [after raw data](after/).
