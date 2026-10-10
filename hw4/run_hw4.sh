#!/usr/bin/env bash
# Run from this submission folder: bash run_hw4.sh
# Stop when a compile/run fails; preserve failures through tee pipelines.
set -e
set -o pipefail
mkdir -p build results

g++ --version > results/compiler.txt
uname -sr > results/system.txt
lscpu > results/cpu.txt

g++ -std=c++17 -O2 -Wall -Wextra -Iinclude -Itests tests/pool_test.cpp -o build/pool
./build/pool | tee results/pool.txt
test "$(grep -c '^RESULT|pool_.*|pass|' results/pool.txt)" -eq 4

g++ -std=c++20 -O2 -Wall -Wextra -Itests week04_practice/allocator_bench.cpp -o build/allocator_bench
./build/allocator_bench | tee results/allocators.txt

g++ -std=c++20 -O2 -Wall -Wextra week04_practice/polymorphism.cpp -o build/polymorphism
./build/polymorphism | tee results/polymorphism.txt

g++ -std=c++20 -O1 -g -Wall -Wextra -fsanitize=address,undefined week04_practice/polymorphism.cpp -o build/polymorphism_asan
ASAN_OPTIONS=detect_leaks=1 ./build/polymorphism_asan 2>&1 | tee results/leak_check.txt

g++ -std=c++20 -O2 -Wall -Wextra week04_practice/dispatch_bench.cpp -o build/dispatch_bench
./build/dispatch_bench | tee results/dispatch.txt
g++ -std=c++20 -O2 -S -fverbose-asm week04_practice/dispatch_bench.cpp -o results/dispatch_bench.s

printf '\nHW4 checks completed. Logs and assembly are in results/.\n'
