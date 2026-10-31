# HW8 — Sliding-window event counter

`rolling_counter.hpp` implements the required interface:

```cpp
explicit RollingCounter(uint64_t window_ns);
void add(uint64_t ts_ns);
uint64_t count(uint64_t now_ns);
```

## Implementation and complexity

The counter stores timestamps in a preallocated ring of `2^20` entries.
`add` appends at the tail. `count` lazily removes timestamps from the head while
`ts <= now - window_ns`, then returns `tail - head`. No surviving window is rescanned.
For `now < window_ns`, expiry is skipped to avoid unsigned underflow. At equality,
timestamps equal to zero expire, preserving the strict lower bound.

Timestamps must arrive in non-decreasing order and queries use a non-decreasing
clock. Events are recorded before querying their time; future events are not preloaded.
The counter is single-threaded. At most `2^20` unremoved entries can be stored;
a full ring throws rather than silently overwriting events. Calling `count` reclaims
expired entries. Normal add/count operations do not allocate.

Each event is appended once and removed at most once. A add operations and Q count
operations therefore take O(A+Q) total time: amortized O(1) per operation.
A count that removes k entries takes O(k+1) individually. Ring construction takes
O(CAP) time and storage, about 8 MiB for timestamps.

## Run correctness checks and benchmark

From the repository root (Linux, C++17 GCC/Clang and Python 3):

```bash
cd hw8
python3 run_checks.py
```

This compiles and runs the unchanged course test driver and five additional boundary
checks. It checks RESULT verdicts explicitly because the course driver exits zero
even when a check fails. A compile error, missing verdict or failed check fails the run.

The course benchmark interleaves one `add(t)` with one `count(t)` per iteration.
Each process warms up 200,001 iterations and measures 2,000,000 iterations; seven
process runs are reported. One op means one add/count pair, including the barrier
and timestamp increment. Construction is outside the timed region.

The local measured median is **2.60559 ns/op**. Hardware, compiler, flags, per-run
numbers and limitations are in [RESULTS.md](RESULTS.md); complete raw outputs are
in [report.json](report.json). Timings depend on the machine and are not a fixed target.

## GitHub Actions

`.github/workflows/hw8.yml` runs the same checks on relevant pushes and pull requests.
Open **Actions → HW8 RollingCounter → the run → Summary** to see correctness
verdicts and ns/op measured on the GitHub runner. The run also saves raw results
as the `hw8-results` artifact. CI reruns generate their own results rather than
presenting local timing as a runner measurement.

## Files

- `rolling_counter.hpp`: required implementation.
- `tests/rolling_counter_test.cpp`, `tests/bench.hpp`: unmodified course tests/timer.
- `tests/boundaries.cpp`: zero timestamp, equality, duplicates, strict cutoff, zero window.
- `run_checks.py`: builds, verifies and reports measurements.
- `RESULTS.md`, `report.json`: recorded local results.

Course test source: https://github.com/sdonadio/hft-cpp-starter-columbia/tree/b4d7b9fd2b58f3cbdd37e722233a6fc13aeb8ade/tests
