# HW7 — flat order book and open-addressing symbol map

[`order_book.hpp`](order_book.hpp) defines the required `Book` and `SymMap` interfaces. `Book` uses fixed-size, contiguous price-level arrays and cached best slots; `SymMap` uses inline keys and linear probing. Source, correctness checks, before/after versions and raw measurements are included.

## Environment and method

Measured locally on **2026-10-23**, AMD Ryzen 9 9955HX (16 cores), Ubuntu under WSL2, **g++ 15.2.0, `-std=c++20 -O2`**. Machine details, timestamps and source hashes are in [before](reports/before/environment.txt) and [after](reports/after/environment.txt). Both versions were measured during the same collection session. Sanitizers were used for correctness separately, never for reported timing.

The course harness was run twice at N=64/1024/16384. Its add/cancel/BBO columns are batch means; add/cancel p50/p99 are percentiles of **32-operation batch averages**, not individual-operation tail latencies. The supplemental query harness warms up 20,000 operations, then records **31 batches of 200,000 operations**, twice. The lookup table below uses the median of all 62 samples. Each BBO op is **one bid+ask pair**. Setup is excluded; loop, pointer reload and result-barrier overhead are included. `cycles/op` means **LFENCE + `__rdtsc()` TSC ticks/op**, not dynamically clocked core cycles. Throughput is single-thread loop ops/s (`1e9 / ns/op`).

## Query results: own implementation, before/after and baselines

| Query | Before ns/op | After ns/op | Before cycles/op | After cycles/op | After M ops/s |
|---|---:|---:|---:|---:|---:|
| Book.best_bid | 0.995 | 0.995 | 2.481 | 2.482 | 1004.74 |
| map.best_bid | 2.984 | 3.117 | 7.444 | 7.775 | 320.84 |
| Book.best_ask | 0.995 | 0.996 | 2.481 | 2.483 | 1004.46 |
| map.best_ask | 0.871 | 0.996 | 2.171 | 2.484 | 1004.23 |
| Book.BBO | 1.990 | 2.083 | 4.965 | 5.195 | 480.01 |
| map.BBO | 3.076 | 3.126 | 7.672 | 7.797 | 319.92 |
| SymMap.get | 10.976 | 9.358 | 27.385 | 23.348 | 106.86 |
| unordered_map.find(string) | 10.883 | 11.083 | 27.153 | 27.651 | 90.23 |
| unordered_map.find(c_str) | 22.577 | 23.278 | 56.331 | 58.083 | 42.96 |

After optimization, best_bid is **3.13x** faster than the map baseline. Own get is **1.18x** faster than `find` with an existing string, and **2.49x** faster than the c_str-conversion baseline. These are different baseline call forms: the latter includes temporary string conversion. Symbols are the course's eight keys, cyclic queries and **100% hits**; these results do not establish performance for many-symbol or miss-heavy workloads. Map's best_ask can match or beat the flat book in this small read-only comparison.

The flat book reads a cached slot and converts it to a price, while the map reads through tree metadata and a separately allocated endpoint node. Both already have O(1) best-price access here; the difference is the amount and dependency of memory access. SymMap keeps the key, id and occupancy together in a contiguous probe table, avoiding a separate node access on a successful probe. That layout and the removed key-validation pass help on this workload. With only eight hot keys, caches are warm and library implementation details also matter: the measured gap is modest, not a general cache-miss penalty per lookup.

### Single change that helped most

The most helpful additional lookup change was removing the separate `valid_key()` scan from `SymMap::get`: insertion still validates key length, and lookup still hashes the key, checks full-key equality and handles null/missing inputs. Previously each successful query scanned the same short key once for validation and again for hashing. Removing that redundant pass reduced get from **10.976 to 9.358 ns/op**, or **1.17x**, and from **27.385 to 23.348 TSC ticks/op**. Hashing, probing, load policy and table layout stayed the same. A separate cold-path cleanup replaces `strncpy` with a validated-length `memcpy`, eliminating a compiler warning; copies occur outside the timed lookup loop. Book's implementation is unchanged, so its small before/after differences are not claimed as optimization gains. See the [exact diff](versions/optimization.diff).

## Q1 / Q2 / Q3 and memory-access tradeoffs

**Q1** locates an order by id for cancellation; **Q2** locates its price level; **Q3** reads the highest bid and lowest ask. The unsorted vector makes append cheap but scans for Q1/Q2/Q3; its contiguous elements support streaming. Sorting makes Q2 binary-searchable and Q3 a back() read, but Q1 remains a scan and insert/erase shifts elements. The list+id hash index makes Q1 and unlinking average O(1), while Q2/Q3 still scan pointer-linked nodes with dependent loads. The map+id hash separates average-O(1) id lookup from O(log L) price lookup; cached tree endpoints already make Q3 cheap. The flat book replaces tree traversal with tick-to-slot indexing and maintains best slots on updates, keeping Q2 and Q3 O(1) within its band. Cancellation can still scan O(NLEV) empty slots when the inside level empties: at N=64, the first after run measured **687.7 ns/cancel**, versus **68.1** for map. The sorted vector also has the fastest BBO in the course comparison but much slower updates at large N. These tradeoffs explain why no structure wins every column.

## Complete course results and repeatability

The complete first after run is included below, including all structures, three sizes, p50/p99, rehash and reference-symbol blocks. [Run 2](reports/after/containers_run2.txt), [all percentage differences](reports/after/container_variation.csv) and [lookup samples](reports/after/lookup_samples_run1.csv) are preserved. Across the student's course-harness add/cancel/BBO means, the largest run-2 change was **+3.1%** (N=64, add). Across all structures the largest was **+23.2%** (N=16384, 1a vector (unsorted), bbo). This is measured run variation, not a confidence bound.

The course harness's final symbol block is its **reference `flat::SymMap`**, not the submitted map. The query table above measures the submitted map. Rehash maxima in the full logs illustrate the latency spikes avoided by reserving hash buckets; reserve does not preallocate every node or guarantee a latency bound.

Course-test output recorded with the after measurements ([raw](reports/after/course_test.txt)):

```text
RESULT|book_bbo|pass|best bid/ask + cancel correct
RESULT|symmap|pass|put/get/overwrite/absent correct
METRIC|book_bbo_ns_per_op|2.10467
METRIC|symmap_get_ns_per_op|8.58813
```

## Correctness, range and limitations

Extended checks cover same-price aggregation, full-side cancellation, missing/repeated ids, duplicate-id replacement, rounding 109.32/0.29, 64-bit aggregate quantities, 16-character symbols, collisions/wraparound, key ownership and 10,000-key growth. Empty sides return 0.0; missing symbols return `(uint64_t)-1`.

Prices use one-cent ticks and nonnegative int-range ticks. The first valid price positions a **65,536-slot band**; slot=tick-base_tick_, with both bounds checked before access. The 719.98/719.98/720.02 example stays correct and a $100 order is rejected for that same band. The [absolute-index demonstration](tests/absolute_index_demo.cpp) safely models how absolute tick 71998 overlaps logical ask offset 6462, without executing an actual out-of-bounds C++ write or claiming that every sanitizer misses one. A future Phase 2 rebase would migrate level arrays and re-key resting-order slots. Each side uses uint64_t quantities: two heap arrays total about **1 MiB**, versus the lab's uint32_t example at 512 KiB. No per-price FIFO or exchange matching is implemented.

For Step 4.9, a separate [intentionally broken absolute-index book](tests/absolute_index_bug_demo.cpp) reproduces the actual member-array overflow. The [recorded run](reports/absolute_index_bug_demo.txt) changes the \$64.62 ask from 10 to 20 after adding the \$719.98 bid. On **this g++ 15.2 build**, `-O0 -fsanitize=address,undefined` also reports `index 71998 out of bounds`: unlike the lab's example, the combined sanitizer run is not silent. The write stays inside the containing allocation, but UBSan can still diagnose the member-array bound. This program has undefined behavior, so that output is an observation for this build, not a portable guarantee. It is excluded from correctness tests and CI; the safe model and final banded Book are tested separately.

## Reproduce and CI

From the repository root:

```bash
cd hw7
make book          # unchanged course driver, C++17, -O2; validates RESULT lines
make test          # plus extended correctness and the safe range example
make sanitize      # ASan/UBSan correctness, no timing
bash run_benchmarks.sh before
bash run_benchmarks.sh after
# Compare the two printed build/performance_* directories:
python3 scripts/summarize_performance.py BEFORE_DIRECTORY AFTER_DIRECTORY
```

The reproduction script snapshots the selected version into a fresh build directory. `before` selects [versions/order_book_before.hpp](versions/order_book_before.hpp); `after` selects the submitted header. It uses exactly the included benchmark programs, runs the course harness twice at all three N values and records 62 query samples per case. Raw original measurements are in [reports/before](reports/before/) and [reports/after](reports/after/); future runs need not reproduce their exact numbers.

[HW7 GitHub Actions](../.github/workflows/hw7.yml) compiles the submitted header against the bundled course driver on each main-branch push/PR, validates both RESULT lines, runs edge cases and publishes **ns/op in the run Summary**. A separate sanitizer step checks memory behavior. CI timings are runner-specific and do not replace the local before/after numbers. To use this header in the starter layout, copy it into the starter's `include/order_book.hpp`.

Course sources: [Week 7 lab](https://github.com/sdonadio/hft-cpp-starter-columbia/blob/main/labs/week07.md), [test driver](https://github.com/sdonadio/hft-cpp-starter-columbia/blob/main/tests/book_test.cpp), [timing helper](https://github.com/sdonadio/hft-cpp-starter-columbia/blob/main/tests/bench.hpp), [reference container harness](https://github.com/sdonadio/hft-cpp-starter-columbia/blob/main/starters/week07/bench_containers.cpp). The course driver/timing helper/reference harness are supplied course code; the submission distinguishes their measurements from the student's implementation.

## Appendix: complete after run 1

```text
bench_containers — Session 6 / HW 7.  steady_clock resolution here: ~40 ns
columns: add/cancel = mean ns per op building from empty / cancelling all in random order;
         bbo = best_bid()+best_ask() on a churned book (ns per call);
         p50/p99 = ns/op over batches of 32 consecutive ops

N = 64 resting orders (256 price levels per side)
  structure                                  add ns  cancel ns     bbo ns        add p50/p99    cancel p50/p99
  1a vector (unsorted)                         18.7       11.8      91.54      19.7 /    26.0     16.6 /    26.9
  1b vector (sorted by price)                  14.5       15.2       0.94      14.4 /    24.7     20.3 /    38.2
  2  list + unordered_map<id,it>               62.7       51.5     207.11      63.9 /   105.8     55.1 /    78.0
  3  map<tick,Level> + umap (no reserve)       80.6       68.1       2.73      80.5 /   184.1     68.2 /   155.9
  3  map<tick,Level> + umap (reserve)          79.5       71.4       3.15      75.2 /   156.5     69.8 /   140.0
  4  flat Book (lab, banded)                   44.2      652.4       2.06      43.2 /   108.7    893.9 /  2155.3
  4  YOUR include/order_book.hpp              102.6      687.7       2.07      56.3 /   165.3   1027.6 /  2370.1

N = 1024 resting orders (256 price levels per side)
  structure                                  add ns  cancel ns     bbo ns        add p50/p99    cancel p50/p99
  1a vector (unsorted)                         18.1      173.6    1384.46      17.8 /    29.1    165.0 /   449.0
  1b vector (sorted by price)                  65.6      219.4       0.95      73.6 /   182.5    241.1 /   588.6
  2  list + unordered_map<id,it>               57.6       74.8   12267.84      47.6 /   139.0     75.1 /    96.1
  3  map<tick,Level> + umap (no reserve)      122.8       95.8       2.73     124.0 /   254.8    102.1 /   188.8
  3  map<tick,Level> + umap (reserve)         109.1       94.7       3.12     117.4 /   189.1    117.1 /   184.8
  4  flat Book (lab, banded)                   33.9       79.9       2.05      28.5 /   103.7     41.0 /  1288.7
  4  YOUR include/order_book.hpp               45.0       85.3       2.06      33.8 /   162.8     43.2 /  1249.2

N = 16384 resting orders (256 price levels per side)
  structure                                  add ns  cancel ns     bbo ns        add p50/p99    cancel p50/p99
  1a vector (unsorted)                         39.1     2569.0   53558.12      17.8 /    45.7   2524.5 /  6222.1
  1b vector (sorted by price)                1079.6     3295.4       0.94    1054.5 /  2697.3   3319.4 /  7464.4
  2  list + unordered_map<id,it>               57.6      111.4  350990.86      44.8 /   232.3    110.8 /   160.0
  3  map<tick,Level> + umap (no reserve)      124.4      173.0       2.86     113.3 /   469.0    170.3 /   236.1
  3  map<tick,Level> + umap (reserve)         120.8      174.3       3.13     113.3 /   198.8    169.1 /   223.9
  4  flat Book (lab, banded)                   30.0       70.2       2.05      24.1 /   110.5     70.1 /   107.7
  4  YOUR include/order_book.hpp               35.3       70.7       2.06      28.5 /   149.3     69.5 /    95.5

Step 2 — node sizes (64-byte cache lines)
  sizeof(Ord)                       = 32 bytes  -> 2 orders per line in a vector
  std::list<Ord> node  (Ord + 2 ptr) = 48 bytes  (+ malloc header/rounding)
  std::forward_list node (Ord + ptr) = 40 bytes
  scanning 16,384 orders: vector touches 8192 lines in order (prefetched);
  a list touches up to 16,384 lines, each address known only after the last load

Step 3 — rehash spike: 1048576 inserts into unordered_map<uint64_t, Ord>
                 p50 ns   p99 ns  p99.9 ns       max ns   total ms  rehashes
  no reserve        110     2455     10009     60122445      304.3        17
  reserve(n)         90      481      2805       255182      163.2         0

Step 4 — symbol lookup, 8 symbols (CAP 4096 -> load factor 0.20%)
  SymMap::get (open addressing)                7.35 ns/op
  unordered_map<std::string,uint64_t>::find   21.32 ns/op   (2.9x)
```
