#!/usr/bin/env bash
# Reproduce the demo, timing comparison, and optimized assembly on the HW4 machine.
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p build results

g++ --version > results/compiler.txt
uname -sr > results/system.txt
lscpu > results/cpu.txt

g++ -std=c++20 -O2 -Wall -Wextra w6.cpp -o build/w6
./build/w6 | tee results/demo.txt

# HW4 used C++20, -O2, ns_per_op, 20M calls, warm-up, and seven medians.
g++ -std=c++20 -O2 -Wall -Wextra dispatch_bench.cpp -o build/dispatch_bench
./build/dispatch_bench | tee results/dispatch.txt
g++ -std=c++20 -O2 -S -fverbose-asm dispatch_bench.cpp -o results/dispatch_bench.s

printf '\nHW6 results and assembly are in results/.\n'
