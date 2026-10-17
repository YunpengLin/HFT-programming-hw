# HW5 — Generic rolling return statistics

`w5.cpp` computes simple returns from a price series, then keeps a fixed-size
window of recent returns in `RingStat<T>`. The container is generic over numeric
types. `push` replaces the oldest value after the window fills; `mean`, `median`,
and population standard deviation summarize its current contents.

## Requirements covered

- `std::vector` stores prices, returns, and the ring's observations.
- `std::transform` calculates `price[t] / price[t-1] - 1` and squared deviations.
- `std::accumulate` calculates totals; `std::sort` calculates the median.
- `sum(Ts...)` uses a C++17 fold expression. SFINAE admits arithmetic arguments
  to `sum` and floating-point price types to `simple_returns`.

Prices must be positive and finite. A window of zero and an empty statistics
request raise exceptions. For an even window size, median averages the two middle
values. Standard deviation divides by the number of observations (population
definition).

## Build and run

From the repository root, in WSL/Ubuntu:

```bash
g++ -std=c++17 -O2 -Wall -Wextra -Werror hw5/w5.cpp -o /tmp/hw5 && /tmp/hw5
```

The sample prices are `100, 101, 100, 102, 101, 103`, with a three-return
window. The saved program output is in [`results.txt`](results.txt).

| Ending price | Latest return | Rolling mean | Rolling median | Population std. dev. |
|---:|---:|---:|---:|---:|
| 102 | +0.020000 | +0.006700 | +0.010000 | 0.012428 |
| 101 | -0.009804 | +0.000098 | -0.009804 | 0.014073 |
| 103 | +0.019802 | +0.009999 | +0.019802 | 0.014003 |

The variadic checks print `sum(1,2,3,4)=10` and `sum(1,2.5,3)=6.5`.
These are deterministic statistical results; no execution-latency measurement
was made for HW5.
