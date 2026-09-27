# HW 2 — Pointers, References & the Cost of a Copy

## 1. Machine and Build Information

- CPU: `AMD Ryzen 9 9955HX 16-Core Processor, 16 physical cores, 32 logical CPUs`
- RAM: `7.3 GiB`
- OS: `Ubuntu 26.04 LTS running under WSL2`
- Compiler: `g++ 15.2.0`
- Language standard: `C++17`
- Compiler flags: `-std=c++17 -O2 -Wall`
- Architecture: `x86-64`
- Clock: `std::chrono::steady_clock`
- Warm-up: Yes. Whole batches were executed before the first reported sample.
- Reported statistics: p50, p99, p99.9, and mean
- Dead-code protection: `doNotOptimize()` was used on every benchmark result.
- Sampling:
  - Table 2: 1000 samples × 2000 calls
  - Table 3: 200 samples × 1 full traversal

All reported benchmark numbers below were obtained from the optimized `-O2` build. The laptop is on power, and only 4 apps are running.

## 2. Benchmark Results

### Table 1 — Swap Correctness

```text
function           a before   b before    a after    b after   result
---------------------------------------------------------------------

swap_ref                  3          9          9          3   OK
swap_ptr                  3          9          9          3   OK
swap_ptr(&a,&a)           5          5          5          5   OK
```

### Table 2 — Passing a 648-byte Struct

```text
variant                             p50          p99        p99.9         mean
                                  ns/call      ns/call      ns/call      ns/call
--------------------------------------------------------------------------------

sum_by_value(Big)                53.852       94.204      109.698       56.333
sum_by_cref(const Big&)          42.600       73.329      112.911       44.953

p50 ratio value/cref = 1.26x
checksum = 30202200000.0
1000 samples × 2000 calls

correctness:
sum_by_value = 7191.0
sum_by_cref  = 7191.0
OK (equal, non-zero)
```

### Table 3 — Contiguous Vector vs. Linked List

```text
variant                             p50          p99        p99.9         mean
                                  ns/elem      ns/elem      ns/elem      ns/elem
--------------------------------------------------------------------------------

sum_vector (contiguous)           0.532        0.624        0.697        0.535
sum_list   (pointer chase)       32.431       76.326      105.167       36.221

p50 ratio list/vector = 60.99x
200 samples × 1 full traversal

correctness:
sum_vector = 549755289600
sum_list   = 549755289600
expected   = 549755289600
OK

bytes touched:
vector = 4.0 MB
list   = 16.0 MB
```

## 3. Explanation A — References vs. Pointers


`swap_ref` receives references, which are aliases for the caller's original integers. Therefore, assigning to `a` and `b` directly modifies the caller's variables. No explicit dereference operator is required.

`swap_ptr` receives pointers, which are addresses of the caller's integers. So, the function must use * to access the integers stored in the addresses.

Swapping the pointer variables themselves would not modify the caller's pointers or integers. 

```cpp
int* temp = a;
a = b;
b = temp;
```

Because it only changes local copies of the pointer values inside the function. To swap the caller's integers, the pointers must be exchanged:

```cpp
int temp = *a;
*a = *b;
*b = temp;
```

The pointer version can represent a missing object using `nullptr`, while a reference must always refer to a valid object. In this implementation, the pointer version checks for null pointers before dereferencing them. This prevents undefined behavior when a null pointer is passed.

For an HFT hot path, I would generally prefer references when the argument is guaranteed to exist, because references express the non-null requirement clearly and avoid explicit null checks. Pointers are preferable when the absence of an object is meaningful or must be represented explicitly. In both cases, the basic access cost is very small; the big difference is the interface contract and whether null check is required.

## 4. Explanation B — Contiguous Access vs. Pointer Chasing

Both functions sum the same 1,048,576 integer values, but their memory access patterns are very different.

The vector stores its integers contiguously. A 64-byte cache line can contain sixteen 4-byte integers. When the CPU loads one element, nearby elements are likely brought into the cache as well. The hardware prefetcher can recognize the sequential access pattern and fetch future cache lines before they are needed.

The linked list uses 16-byte nodes and follows the `next` pointer from one node to the next. The nodes are not necessarily adjacent in memory, so a cache line may contain only one useful node or may contain data that is not needed. This explains the larger amount of memory touched by the list traversal.

The hardware prefetcher can predict the next address in the vector because the addresses increase regularly. It cannot reliably predict the next linked-list address because the next address is stored inside the current node, and usually not physically adjacent.

There is also a dependent-load chain in the linked list: The next pointer must be loaded before the next node can be accessed. Cache misses therefore tend to serialize instead of overlapping. The pointer itself is not inherently slow; the main cost comes from cache misses and dependent memory loads.

This is why the vector traversal has a p50 of approximately 0.532 ns per element, while the linked-list traversal has a p50 of approximately 32.431 ns per element. The linked-list traversal is approximately 60.99 times slower by p50.

This same principle appears in an order book: a flat array provides better locality and more predictable access than a collection of separately allocated nodes or a pointer-heavy map.

## 5. Explanation C — Copy Cost

`Big` has a size of 648 bytes. `sum_by_value(Big)` must copy this object when the function is called, while `sum_by_cref(const Big&)` only receives a reference to the existing object.

The measured p50 values were:

```text
by value:      53.852 ns/call
by const ref:  42.600 ns/call
```

The p50 ratio was 1.26x, so the by-value version was approximately 26% slower. This is consistent with the expected additional memory traffic caused by copying a 648-byte object. The exact ratio depends on compiler optimizations, cache state, calling conventions, and measurement noise.

The p99.9 values are close and slightly noisy, which is expected for tail measurements on a general-purpose operating system. The median and mean still show the expected additional cost for pass-by-value.

