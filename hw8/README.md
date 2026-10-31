# HW8 — Sliding-window event counter

## Implementation

Implemented in [rolling_counter.hpp](rolling_counter.hpp):

```cpp
struct RollingCounter {
    explicit RollingCounter(uint64_t window_ns);
    void add(uint64_t ts_ns);
    uint64_t count(uint64_t now_ns);
};
```

A preallocated ring buffer stores event timestamps. `add()` appends at the tail;
`count()` lazily removes timestamps `ts <= now_ns - window_ns` from the head,
then returns the remaining count.

Events arrive in timestamp order and `count()` uses a non-decreasing clock.
When `now_ns < window_ns`, expiry is skipped to avoid unsigned underflow.
The ring holds up to `2^20` unremoved events; a full ring rejects further additions.

## Amortized complexity

Each event is added once and removed at most once. Across A additions and Q queries,
total work is O(A + Q), giving **amortized O(1)** per `add/count`.
A single query removing k expired events takes O(k + 1).

## Correctness and ns/op

| CI result | Value |
|---|---|
| Window correctness | PASS |
| Expiry as the clock advances | PASS |
| Median interleaved add/count time | **2.22792 ns/op** |

One op consists of one `add(t)` and one `count(t)`, including the result barrier
and timestamp increment. Each run measures 2,000,000 iterations after 200,001 warmup
iterations; the median is taken over seven runs, with `window_ns = 1000`.
Construction is excluded from timing.

Measured on the GitHub Actions runner; results are machine-dependent.
[CI run and Summary](https://github.com/YunpengLin/HFT-programming-hw/actions/runs/41169260208).
