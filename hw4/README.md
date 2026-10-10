# HW4 — Allocators and Runtime Polymorphism

Author: YunpengLin

## Environment and reproduction

Measurements were collected on 2026-10-10 on an AMD Ryzen 9 9955HX 16-Core Processor (32 logical processors), Ubuntu under WSL2, Linux 6.18.33.2-microsoft-standard-WSL2, using g++ 15.2.0. Compiler and machine output are saved in `results/compiler.txt`, `results/system.txt`, and `results/cpu.txt`.

From this submission directory, run:

```bash
bash run_hw4.sh
```

The script compiles and runs the pool tests, allocator benchmark, polymorphism example, sanitizer check, and dispatch benchmark, and generates assembly. It writes logs to `results/` and executables to `build/`. The supplied `tests/bench.hpp` and `tests/pool_test.cpp` are course helpers included unchanged for reproducibility.

## 1. Free-list pool

`include/pool.hpp` allocates one buffer during construction. Free slots store a next pointer inside their own storage. Allocation removes the head, and reclamation inserts a slot at the head; each performs constant work independent of capacity.

All four official tests passed: `pool_basic`, `pool_full`, `pool_reuse`, and `pool_pattern`. The official test reported 1.05197 ns per alloc/free pair in this run. See `results/pool.txt`.

## 2. Arena and allocator measurements

The arena advances an offset through one buffer, rounds requests to the exercise's pointer-sized alignment unit, returns null if capacity is insufficient, and resets the offset once per batch.

The comparison uses 256 requests of 64 bytes per batch. Each batch allocates all its buffers before reclaiming them. Pool and arena setup occur outside timing. Each sample runs 20,000 timed batches after the warm-up performed by `ns_per_op`; the reported value is the median of seven samples divided by 256.

| Allocator | ns per object lifecycle | Speedup vs malloc/free |
|---|---:|---:|
| malloc/free | 26.71 | 1.00x |
| new[]/delete[] | 30.18 | 0.89x |
| Pool | 2.62 | 10.19x |
| Arena | 1.09 | 24.50x |

Speedup is baseline time divided by the measured allocator time. The measurements include allocation and reclamation plus the shared loop, pointer storage, null checks, and optimization barriers. Raw output is in `results/allocators.txt`. These are separate from the official immediate alloc/free measurement above.

Pool avoids repeated general-purpose heap management and performs a fixed number of free-list operations. Arena also replaces individual reclamation with one reset per batch, which suits this workload. Fixed operation count supports predictable allocator work, but does not guarantee constant elapsed time: cache effects, scheduling, and WSL can still introduce variation. These medians do not establish tail-latency bounds or superiority on every allocation pattern.

## 3. Runtime polymorphism and leak check

`Signal` is abstract and has a virtual destructor. `SpreadSignal` and `MidpointSignal` implement `evaluate` differently. Slots are sized to fit the larger derived type. Both objects are placement-constructed in distinct pool slots, called through `Signal*`, explicitly destroyed through those pointers, and then returned to the pool.

The live counter tracks derived-object construction and destruction. The program produced:

```text
live objects after construction: 2
signal = +0.0080
signal = +100.4100
live objects after teardown: 0
```

The sanitizer build used `-O1 -g -fsanitize=address,undefined` and ran with `ASAN_OPTIONS=detect_leaks=1`. It exited successfully without a sanitizer or leak diagnostic. See `results/polymorphism.txt` and `results/leak_check.txt`. The long string in `MidpointSignal` exercises member-resource cleanup; its character storage may use the ordinary heap during construction, even though the enclosing object is pool-allocated.

## 4. Virtual-call measurements

The dispatch experiment follows the Week 4 lab structure. It uses `-std=c++20 -O2`, 20,000,000 timed calls per sample, warm-up, and the median of seven samples. The direct function and S0 have the same computation. A precomputed 4096-entry index pattern selects among four different target functions. Results accumulate behind `doNotOptimize` and are written to `g_sink`, which is printed.

| Call form | ns/call |
|---|---:|
| Direct | 1.46 |
| Virtual, one hot target | 6.17 |
| Virtual, four targets in repeating order | 6.25 |
| Virtual, four targets in pseudo-random order | 20.18 |
| Final class, through S0* | 1.48 |

The printed sink was `1.078e+06`. Raw output is in `results/dispatch.txt`.

Virtual dispatch loads the object's vptr and obtains the target function from its vtable before performing an indirect call. The branch-target buffer (BTB) helps predict that target; a repeatedly used target or regular target sequence is easier to predict than an irregular sequence, so the pseudo-random row is much slower here. When the compiler cannot determine the runtime target, it cannot normally inline that call body, losing opportunities to optimize across the call. In the final-derived-pointer case the target is provable, allowing devirtualization and inlining, consistent with its near-direct cost. The gap is not a pure measurement of branch misprediction: the random row also reads the pattern table, target functions differ, and every row includes loop and sink work. A virtual function can still be inlined when the compiler proves its target.

### Assembly evidence

`results/dispatch_bench.s` was generated with `-O2 -S -fverbose-asm`. The timed direct and final loops each have zero `on_book` call instructions because the computation is inlined. Each of the three timed virtual loops contains one static indirect `call *16(%rax)` instruction, executed once per iteration. Warm-up loops contain separate copies. These are counts of instructions in the corresponding loop bodies, not counts of all calls in the file. Timing and printing calls are excluded.

## Scope and files

The exercise allocators are single-threaded, are not copied, and are used with sizes satisfying their simplified alignment requirements. Arena pointers are not retained across reset. They are not general-purpose allocators for arbitrary over-aligned types.

The submission contains six implementation files: `pool.hpp`, `arena.hpp`, `signals.hpp`, `allocator_bench.cpp`, `polymorphism.cpp`, and `dispatch_bench.cpp`, plus the course benchmark/test headers, this README, the reproduction script, and result files. Directory structure is retained so quoted include paths continue to work.

The tables correspond to the saved measurement run in `results/`. Rerunning the script refreshes logs; update the tables if the measured values change. The unused-parameter warning for S3's `a` parameter is benign: that implementation's formula uses only `b` and `o`.
