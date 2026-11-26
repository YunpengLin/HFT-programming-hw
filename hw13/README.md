# HW13 — Compiler flags on a frozen kernel

On the AMD x86-64 runner, the fastest build that reproduced the baseline's printed checksum used `-O3 -march=native -ffp-contract=off -funroll-loops`. It took **119.874 ms**, down from **1181.756 ms** at `-O0` (**9.86×**). Reference cycles per element fell from **15.629 to 1.606**. The lowest median overall was **116.282 ms** with native PGO (**10.16×**, **1.558 reference cycles/op**). Its checksum differed by −0.335329. Native unrolling finished within 0.046 ms of PGO, well inside the observed run-to-run variation.

```sh
g++ -O0 kernel.cpp -o slow
g++ -O3 -march=native -ffp-contract=off -funroll-loops kernel.cpp -o fast
./slow
./fast
```

## The single change that helped most

Switching from `-O0` to `-O2` cut median kernel time to **123.626 ms** (**9.56×**) with the same checksum. At `-O0`, the inner loop calls `vector::operator[]` three times per element and calls `vector::size()` for the loop test. At `-O2`, GCC generates direct array loads, keeps the accumulator in a register and emits a scalar `sqrtss` instruction. Cachegrind recorded **102.52 → 12.52 instructions/op** across the process. In a separate three-run `perf stat` measurement, mean process task-clock fell from **1211.04 to 126.85 ms**. GCC's report for the timed inner loop says control flow prevented vectorization. [Baseline assembly](results/O0.asm) · [Optimized assembly](results/O2.asm) · [Vectorizer remarks](results/O2.vec.txt)

## x86-64 timing matrix

Ubuntu 24.04, GCC 13.3.0, AMD EPYC 9V45 on a GitHub-hosted Linux VM, pinned to logical CPU 0. Each of the 19 builds received one warm-up, followed by nine rounds with the build order shuffled within each round. Times are medians of the kernel's printed `time_ms`. Speedup divides the baseline median by that row's median. One op is one element in one pass, giving 65,536 × 3,000 = 196,608,000 ops per run. Checksums below are the six decimal places printed by the starter.

| GCC flags | Kernel ms | Speedup | Ref. cycles/op | Checksum |
|---|---:|---:|---:|---:|
| `-O0` | 1181.756 | 1.00× | 15.629 | 151299320.423484 |
| `-O2` | 123.626 | 9.56× | 1.656 | 151299320.423484 |
| `-O3` | 124.967 | 9.46× | 1.673 | 151299320.423484 |
| `-O3 -march=native` | 119.133 | 9.92× | 1.596 | 151299320.088155 |
| `-O3 -march=native -funroll-loops` | 116.328 | 10.16× | 1.559 | 151299320.088155 |
| `-O3 -march=native -flto` | 188.279 | 6.28× | 2.510 | 151299320.088155 |
| `-O3 -march=native -fprofile-use` | 116.282 | 10.16× | 1.558 | 151299320.088155 |
| `-O3 -march=native -ffp-contract=off` | 122.739 | 9.63× | 1.644 | 151299320.423484 |
| `-O3 -march=native -ffp-contract=off -fno-math-errno` | 122.016 | 9.69× | 1.634 | 151299320.423484 |
| `-O3 -march=native -ffp-contract=off -funroll-loops` | 119.874 | 9.86× | 1.606 | 151299320.423484 |
| `-O3 -march=native -ffp-contract=off -fprofile-use` | 122.363 | 9.66× | 1.639 | 151299320.423484 |
| `-O3 -march=native -ffp-contract=off -funroll-loops -fprofile-use` | 122.496 | 9.65× | 1.641 | 151299320.423484 |
| `-O2 -funroll-loops` | 121.689 | 9.71× | 1.629 | 151299320.423484 |
| `-O3 -march=native -ffp-contract=off -funroll-loops -flto -fprofile-use` | 123.117 | 9.60× | 1.651 | 151299320.423484 |
| `-O3 -march=native -ffast-math` | 122.276 | 9.66× | 1.638 | 151299381.089976 |
| `-O3 -march=native -ffast-math -funroll-loops` | 120.524 | 9.81× | 1.615 | 151299381.089976 |
| `-O3 -march=native -ffast-math -flto` | 122.420 | 9.65× | 1.639 | 151299381.089976 |
| `-O3 -march=native -ffast-math -fprofile-use` | 126.227 | 9.36× | 1.690 | 151299381.089976 |
| `-O3 -march=native -ffast-math -funroll-loops -flto -fprofile-use` | 123.198 | 9.59× | 1.651 | 151299381.089976 |

**x86-64 counter scope.** The AMD Linux VM reported `cycles:u` unsupported even with privileged `perf stat`. Hardware core cycles, retired instructions, branch misses and cache misses were unavailable. The reference-cycle column uses the median fenced x86 TSC delta around child launch through exit, divided by the operation count. It includes process startup and input initialization. The internal timer covers only the kernel. Dynamic instruction and conditional-branch counts below come from separate Cachegrind runs on the same binaries. [Hardware-event probe](results/environment.txt) · [Software perf events](results/strict_unroll.software.txt) · [Dynamic counts](results/dynamic-counts.json)

## What the other flags changed

- **Native instructions and rounding.** Going from `-O3` to `-O3 -march=native` reduced the median from 124.967 to 119.133 ms. GCC emitted scalar `vfmadd132ss`, combining a multiply and an add with one rounding. The printed checksum changed from 151299320.423484 to 151299320.088155. Disabling contraction restored the baseline checksum. [Native assembly](results/native.asm)
- **Loop unrolling.** Adding `-funroll-loops` to the native build with contraction disabled cut time from 122.739 to 119.874 ms. Its loop contains eight copies of the scalar square-root path. The dynamic conditional-branch count fell from 394.1 million to 222.0 million, or **2.00 to 1.13 per op**, because one loop-control check covers more elements. The sign test still applies to each element. [Unrolled assembly](results/strict_unroll.asm) · [Vectorizer remarks](results/strict_unroll.vec.txt)
- **PGO and LTO.** PGO trains on the frozen input. With native flags it changed the loop layout and improved the median from 119.133 to 116.282 ms. Dynamic instructions stayed near 10.52/op and conditional branches near 2.00/op in both builds. These counts cannot establish a hardware branch-prediction gain. Adding LTO alone to the native build increased time to 188.279 ms. Both builds had already inlined the kernel into `main`, and their dynamic instruction counts were nearly identical. [PGO assembly](results/pgo.asm) · [LTO assembly](results/lto.asm)
- **Fast math.** Adding `-ffast-math` to native flags took 122.276 ms and shifted the baseline checksum by +60.666492. GCC may reassociate operations and assume finite inputs under this option. It still reported a missed vectorization at the reduction in this build. [Fast-math vectorizer remarks](results/fast_math.vec.txt) · [GCC floating-point options](https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html#index-ffast-math)

## Linux hardware cycles and branches on Arm64

All 19 flag sets were also built on an Arm Neoverse-N2 Linux runner with GCC 13.3.0. One warm-up per binary preceded five shuffled rounds pinned to CPU 0. Each run counted user-mode hardware cycles, instructions, branches and branch misses with `perf stat`. The denominator is 196,608,000 element updates. Counts cover the whole process including initialization. The starter's timer covers the kernel. Each column below reports its own median.

| Arm64 build | Kernel ms | Speedup | Hardware cycles/op | Instructions/op | Branches/op | Branch misses/op |
|---|---:|---:|---:|---:|---:|---:|
| `-O0` | 1526.956 | 1.00× | 26.322 | 91.52 | 14.50 | 0.04408 |
| `-O2` | 242.867 | 6.29× | 4.190 | 12.01 | 2.50 | 0.02635 |
| `-O3 -march=native -ffp-contract=off` | 272.323 | 5.61× | 4.699 | 13.01 | 2.50 | 0.02563 |
| Same build with `-funroll-loops` | 238.979 | 6.39× | 4.120 | 11.26 | 1.63 | 0.00608 |
| Same unrolled build with LTO and PGO | 237.708 | 6.42× | 4.105 | 12.51 | 2.00 | 0.00608 |
| `-O3 -march=native -ffast-math -funroll-loops` | 194.480 | 7.85× | 3.354 | 9.83 | 1.19 | 0.00610 |

On Arm64, `-O2` delivered the largest single gain over `-O0`, cutting hardware instructions per element from 91.52 to 12.01. With native flags and contraction disabled, unrolling reduced both executed branches (2.50 to 1.63 per element) and branch misses (0.02563 to 0.00608). The lowest median that retained the baseline checksum of **151299320.423484** used `-O3 -march=native -ffp-contract=off -funroll-loops -flto -fprofile-use` with training. Its 1.271 ms advantage over unrolling alone is small. The fastest median overall (194.480 ms) produced **151299381.089976**. The x86-64 speedups above use their own baseline.

Run `python3 measure_pmu.py` from the homework directory on a Linux machine with an accessible PMU. [All 19 Arm64 results](results/arm64/summary.csv) · [95 raw samples](results/arm64/samples.csv) · [Raw perf output](results/arm64/perf-stat.txt) · [Environment](results/arm64/environment.txt) · [Benchmark run](https://github.com/YunpengLin/HFT-programming-hw/actions/runs/45896906637)

## Reproduce

Run `python3 bench.py` from this directory on x86-64 Linux with GCC and binutils. Install `perf` and Valgrind to collect the profiling evidence. To reproduce the PGO winner alone, use these commands in a fresh build directory containing the frozen source. Keep the output name and working directory identical for both builds.

```sh
g++ -O3 -march=native -fprofile-generate kernel.cpp -o fast
./fast
g++ -O3 -march=native -fprofile-use -Werror=missing-profile kernel.cpp -o fast
./fast
```

The submitted source matches course Git blob `5e3cfa363da463f924b0984480b27ae573279a41`. [Course starter](https://github.com/Leonard-Tsai-2003/hft-columbia-2026fall/blob/phase-5-zach/starters/hw13/kernel.cpp) · [171 raw timing samples](results/timings.csv) · [Benchmark run](https://github.com/YunpengLin/HFT-programming-hw/actions/runs/45892045664)
