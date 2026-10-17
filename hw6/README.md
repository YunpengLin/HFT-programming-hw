# HW6 — CRTP strategy port and dispatch comparison

[`strategies.hpp`](strategies.hpp) ports the HW4 `Strategy::on_book(bid, ask,
obi)` hierarchy to CRTP. Its S0–S3 implementations use the same formulas as
[`hw4/week04_practice/dispatch_bench.cpp`](../hw4/week04_practice/dispatch_bench.cpp)
and have no virtual functions. [`w6.cpp`](w6.cpp) demonstrates all four strategies,
a compile-time tick table used at runtime, a two-axis policy-based `Quoter`,
`static_assert` checks, and the Week 6 `variant` visitor.

## Reproduce

From the repository root, in the same WSL/Ubuntu environment used for HW4:

```bash
bash hw6/run_hw6.sh
```

The script uses g++ 15.2.0 with `-std=c++20 -O2`, as in HW4. It saves the demo
and benchmark output in `results/`, and generates the full local assembly file
`results/dispatch_bench.s` with `-O2 -S -fverbose-asm`. A focused extract is
checked in as [`results/assembly_excerpt.txt`](results/assembly_excerpt.txt).
The benchmark includes the same HW4 `bench.hpp` helper,
20 million timed calls per sample, its warm-up, and the median of seven samples.
The direct, virtual, `final`, and CRTP rows use the same bid/ask/OBI values and
accumulation barrier. The four-target virtual rows reuse HW4's 4096-entry index
pattern.

## Results

The run below was measured on 2026-10-16, on the same AMD Ryzen 9 9955HX,
WSL2, Linux, and g++ setup documented in HW4. HW4's saved measurements were
collected on 2026-10-10; all comparison baselines were also rerun beside CRTP.
Raw results and machine/compiler details are in `results/`.

| Call form | HW4 saved (ns/call) | HW6 same-run (ns/call) |
|---|---:|---:|
| Direct | 1.46 | 1.45 |
| Virtual, one target | 6.17 | 6.20 |
| Virtual, four targets repeating | 6.25 | 6.28 |
| Virtual, four targets pseudo-random | 20.18 | 20.52 |
| `final` via derived pointer | 1.48 | 1.58 |
| CRTP, known S0 type | — | 2.09 |

CRTP measured about 3.0× faster than the one-target virtual call (`6.20 / 2.09`)
in this workload, but it was slower than direct and `final` in this run. The
numbers include loop, accumulation, and optimization-barrier work, and can vary
with compiler layout, CPU state, and WSL scheduling. They do not isolate a pure
call instruction cost or establish a tail-latency bound.

## Assembly and tradeoff

The `crtp_probe` function in the assembly extract contains `subsd`,
`mulsd`, and `ret` with no call to `on_book_impl`: the CRTP hook is inlined.
The `virtual_probe` function loads the vtable pointer and uses an indirect
`jmp *16(%rax)`; the timed virtual loops contain indirect `call *16(%rax)`.
The CRTP hierarchy therefore removes virtual dispatch where the concrete type
is known. It cannot directly hold different S0–S3 objects in one
`std::vector<Strategy*>`, because each `Strategy<S>` is a distinct type. A
`std::variant`, another type-erased wrapper, or a virtual boundary can be used
when heterogeneous runtime selection is needed.

The compile-time table check proves `kTicks.price[50] == 100.5`, and the demo
reads that entry at runtime. The two `Quoter` specializations produce edges
`0.0095` and `0.0087` for spread `0.01` and inventory `2`, selecting fee and
skew behavior through template types.
