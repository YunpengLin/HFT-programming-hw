# HW3: Memory Management, Smart Pointers, and RAII

This submission contains four C++ source files and this README. Parts 1-3 are separate executables, each with its own `main`. Part 4 is a comment-only pool sketch.

| File | Assignment task |
| --- | --- |
| `hw3part1.cpp` | Intentional raw-pointer leak, `unique_ptr` fix, custom RAII guard |
| `hw3part2.cpp` | Rule of Three and a `unique_ptr<double[]>` rewrite with checks |
| `hw3part3.cpp` | Raw/unique/shared dereference and shared ownership copy benchmark |
| `hw3part4.cpp` | Pool allocation and object-lifetime sketch |


## Platform and tools

Verified on October 3, 2026:

- CPU: AMD Ryzen 9 9955HX 16-Core Processor, 32 logical CPUs.
- Host/execution environment: Windows host, Ubuntu 26.04 LTS under WSL2.
- Kernel/architecture: Linux 6.18.33.2-microsoft-standard-WSL2, x86_64.
- Compiler: GCC 15.2.0, `g++-15 (Ubuntu 15.2.0-16ubuntu1)`.
- Standard library: libstdc++, `__GLIBCXX__ = 20260321`.
- Correctness tools: AddressSanitizer, its Linux LeakSanitizer, and UBSan.
- Correctness flags: C++17, `-O0 -g`, sanitizers and frame pointers.
- Timing flags: C++17, `-O2 -pthread`, no sanitizers.

## Part 1: fix the early-return leak

`handle_raw(2000.0)` allocates an Order, rejects its price, and returns before
`delete`. The accepted call at 100.0 reaches `delete`. The `raw` mode isolates
this intentional bug from the fixed versions.

The negative control exited 1 and produced:

```text
ERROR: LeakSanitizer: detected memory leaks
Direct leak of 16 byte(s) in 1 object(s) allocated from:
    ... handle_raw(double) ... hw3part1.cpp:17
SUMMARY: AddressSanitizer: 16 byte(s) leaked in 1 allocation(s).
```

`handle_unique` constructs the Order directly with
`std::make_unique<Order>(2, px)`. The local owning pointer destroys it on every
scope-exit path. `handle_guard` uses an `OrderGuard` whose destructor deletes
its owned pointer; copying and moving the guard are disabled to prevent duplicate
ownership. Its `get()` returns a non-owning observer.

The `unique`, `guard`, and combined `fixed` modes each exited 0 with no ASan,
LSan, or UBSan diagnostics. The combined mode printed:

```text
-- unique_ptr --
~Order 2
sent order 2 @ 100.00
~Order 2
-- custom RAII guard --
~Order 3
sent order 3 @ 100.00
~Order 3
```

Each fixed handler destroys exactly one Order per call. On the accepted path,
the destruction follows the send message; on the rejected path, it occurs at
the early return.

## Part 2: Rule of Three and the unique_ptr rewrite

`RawBuffer` pairs `new double[n]()` with `delete[]`. Its copy constructor
allocates an independent array and copies the values. Copy assignment handles
self-assignment, allocates and fills a replacement before releasing the old
array, then updates the pointer and size. Since copying doubles does not throw,
an allocation failure leaves the destination unchanged.

Both buffer classes check zero initialization, independent copies, assignment
across different sizes, assignment's returned reference, self-assignment, empty
buffers, and `std::vector` reallocation. `reserve(old_capacity + 1)` guarantees
reallocation; checks afterward verify the preserved values and independence.
The scope ends before the success message so destruction is also exercised.

At `-O0` with ASan/LSan/UBSan, the program exited 0 without diagnostics:

```text
RawBuffer: vector capacity 2 -> 3
RawBuffer: all checks passed
UniqueBuffer: vector capacity 2 -> 3
UniqueBuffer: all checks passed
```

Exactly which special members can be removed in this rewrite:

| Special member | `RawBuffer` | Copyable `UniqueBuffer` |
| --- | --- | --- |
| Custom destructor | Required to `delete[]` the array | Removed; member `unique_ptr<double[]>` releases it automatically |
| Custom copy constructor | Required for deep copy | Retained for deep copy |
| Custom copy assignment | Required for deep copy | Retained for deep copy |

Replacing the member with `unique_ptr` does not create automatic deep-copy
semantics: `unique_ptr` itself is non-copyable. Therefore only the handwritten
destructor can be removed while preserving the tested copyable interface.
The unique-pointer assignment swaps in the replacement; its local pointer then
releases the old array automatically. Neither class defines move operations;
vector growth in these implementations uses deep copies. If copying is not
needed, all three handwritten special members can be omitted, but that produces
a different, non-copyable interface.

## Part 3: benchmark and interpretation

Method: five rounds, 50,000,000 iterations per operation per round, with the
starter timer's warm-up of `iterations / 10 + 1` calls before each measurement.
Report the median of the five samples. The `ns_per_op` and `doNotOptimize`
implementations are copied from `tests/bench.hpp` into the submitted source to
avoid a separate header dependency.

The objects are allocated before timing. The raw pointer observes the same
double as the unique pointer; the shared pointer owns a separate double with
the same initial value. Lambdas capture by reference, and the compiler barrier
preserves the measured work. An empty thread is started and joined before
timing to enable the multithread-aware reference-count path in this glibc/
libstdc++ environment. Only the main thread performs timed work; there is no
concurrent reference-count contention. Operations use a fixed order each round.

### Submission verification run

| Operation | Median ns/op |
| --- | ---: |
| Raw pointer dereference | 0.259 |
| `unique_ptr::operator*` | 0.518 |
| `shared_ptr` dereference | 0.520 |
| `shared_ptr` copy and temporary destruction | 25.851 |

Full measured output:

```text
Compiler: 15.2.0
Standard library: libstdc++ 20260321
Iterations per round: 50000000; rounds: 5
Times below are ns/op; shared_ptr copy includes temporary destruction.
Round 1: raw=0.259 unique=0.516 shared_deref=0.521 shared_copy=25.823
Round 2: raw=0.261 unique=0.518 shared_deref=0.516 shared_copy=25.851
Round 3: raw=0.262 unique=0.523 shared_deref=0.525 shared_copy=25.886
Round 4: raw=0.258 unique=0.519 shared_deref=0.520 shared_copy=25.804
Round 5: raw=0.257 unique=0.515 shared_deref=0.510 shared_copy=25.892

Median results (ns/op):
raw pointer deref  : 0.259
unique_ptr deref   : 0.518
shared_ptr deref   : 0.520
shared_ptr copy    : 25.851
```

The observed ordering is raw dereference < unique dereference approximately equal
to shared dereference << shared copy/release. Here the raw loop is about twice
as fast, a sub-nanosecond absolute difference; these tiny loop measurements do
not establish a general smart-pointer dereference penalty. They include loop,
load, and barrier overhead and can differ because of generated loop code,
alignment, execution order, and scheduling. This run does not isolate those
contributions or measure individual instruction latency.

Smart-pointer dereference is effectively free in ownership-management terms:
it accesses the stored object pointer without updating the reference count.
"Free" does not mean zero nanoseconds or identical numbers in every benchmark.

Copying a nonempty `shared_ptr` is not free. Creating the temporary increments
the strong reference count; destroying it decrements the count. This
multithread-aware implementation uses atomic updates. The object is not
deep-copied, and there is no new object allocation inside the copy loop. The
reported 25.851 ns/op includes both copy construction and temporary destruction,
about 49.7 times the measured shared dereference cost. Multiple cores sharing
the control block can add cache-line traffic, but this run measures only the
uncontended case with hot data.

### Existing results retained for traceability

These are earlier saved results, separate from the new submission run above:

| Operation | Original Part 3 report, 5-round median ns/op | Earlier combined benchmark, 7-round median ns/op |
| --- | ---: | ---: |
| Raw dereference | 0.258 | 0.513 |
| Unique dereference | 0.514 | 0.512 |
| Shared dereference | 0.512 | 0.510 |
| Shared copy/release | 25.758 | 25.820 |

The five-round values come from `scripts/week03_benchmark_report_fill.md`, whose
machine fields were still unfilled; it records GCC 15.2.0 and libstdc++ 20260321.
The seven-round values come from `build/week03/benchmark.txt`, with environment
details in `scripts/hw3_walkthrough_zh.md` (October 2, 2026, Ryzen 9 9955HX,
Ubuntu/WSL2, GCC 15.2.0). That combined benchmark used 5,000,000 iterations and
rotated operation order; its referenced `scripts/hw3.cpp` is absent from the
current directory, so those values are historical evidence only. They are not
pooled with the new measurements or presented as verification of these files.
The earlier combined correctness log likewise belongs to that older program.
Those historical files are not required to reproduce this submission.

## Part 4: replace make_shared with a pool slot

The comments in `hw3part4.cpp` show the before/after loop and the required
sequence: preallocate at engine startup, obtain a slot, handle pool exhaustion,
construct with placement new, process the object, explicitly destroy it, and
return the slot. The pool is a long-lived engine member; slots must have enough
space and correct alignment. Allocation/free use a free-list in O(1) with no
per-order heap allocation.

The straight-line sketch assumes construction and processing do not throw and
processing is synchronous. The comments also explain how a slot guard covers
early returns and exceptions, including construction failure, and why an
asynchronous consumer must retain ownership until its last access. This is a
design sketch, not an implemented or performance-tested HW4 pool.

An allocation in `on_book` can occasionally stall on allocator contention or a
page fault, increasing p99.9 much more than the typical p50; preallocating removes
that source of per-tick heap latency. This homework benchmark does not measure
p99.9 directly.
