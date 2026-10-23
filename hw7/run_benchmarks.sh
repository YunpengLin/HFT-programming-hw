#!/usr/bin/env bash
# Reproduce either frozen version without overwriting the submitted header.
set -euo pipefail
taskLabel="${1:-after}"
case "$taskLabel" in
    before|after) ;;
    *) printf '%s\n' 'Usage: bash run_benchmarks.sh before|after' >&2; exit 1 ;;
esac
taskRoot="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
taskOutput="$taskRoot/build/performance_${taskLabel}_$(date -u +%Y%m%dT%H%M%SZ)_$$"
mkdir -p "$taskOutput/source" "$taskOutput/bin"
taskHeader="$taskRoot/order_book.hpp"
if [[ "$taskLabel" == before ]]; then taskHeader="$taskRoot/versions/order_book_before.hpp"; fi
cp -- "$taskHeader" "$taskOutput/source/order_book.hpp"
cp -- "$taskRoot/benchmarks/bench_containers.cpp" "$taskRoot/benchmarks/lookup_benchmark.cpp" \
    "$taskRoot/tests/book_test.cpp" "$taskRoot/tests/bench.hpp" "$taskOutput/source/"
{
    date -u '+Measured at: %Y-%m-%d %H:%M:%S UTC'
    printf 'Label: %s\nFlags: -std=c++20 -O2\n' "$taskLabel"
    uname -a
    g++ --version
    lscpu
    sha256sum "$taskOutput/source/"*
} > "$taskOutput/environment.txt"
printf 'Results: %s\n' "$taskOutput"
g++ -std=c++20 -O2 -fmax-errors=3 "$taskOutput/source/book_test.cpp" -o "$taskOutput/bin/book_test"
"$taskOutput/bin/book_test" | tee "$taskOutput/course_test.txt"
taskVerdicts="$(<"$taskOutput/course_test.txt")"
if [[ "$taskVerdicts" != *'RESULT|book_bbo|pass|'* || "$taskVerdicts" != *'RESULT|symmap|pass|'* ]]; then
    printf '%s\n' 'Correctness failed; no timings accepted.' >&2
    exit 1
fi
g++ -std=c++20 -O2 -DSTUDENT_BOOK -fmax-errors=3 "$taskOutput/source/bench_containers.cpp" -o "$taskOutput/bin/containers"
g++ -std=c++20 -O2 -fmax-errors=3 "$taskOutput/source/lookup_benchmark.cpp" -o "$taskOutput/bin/lookups"
for taskRun in 1 2; do
    "$taskOutput/bin/containers" | tee "$taskOutput/containers_run${taskRun}.txt"
done
for taskRun in 1 2; do
    "$taskOutput/bin/lookups" "$taskOutput/lookup_samples_run${taskRun}.csv" \
        | tee "$taskOutput/lookups_run${taskRun}.txt"
done
python3 "$taskRoot/scripts/summarize_performance.py" "$taskOutput"
