#!/usr/bin/env python3
"""Summarize raw runs; optionally compare two experiment directories."""
import csv
import hashlib
import json
from pathlib import Path
import re
import statistics
import sys


def percent(first, second):
    if first == 0:
        return 0.0 if second == 0 else None
    return 100 * (second - first) / first


def pct_text(value):
    return 'n/a' if value is None else f'{value:+.1f}%'


def read_samples(path):
    groups = {}
    with path.open(newline='') as stream:
        for row in csv.DictReader(stream):
            groups.setdefault(row['query'], []).append(
                (float(row['ns_per_op']), float(row['tsc_ticks_per_op'])))
    if len(groups) != 9 or any(len(rows) != 31 for rows in groups.values()):
        raise ValueError(f'{path}: expected 9 queries x 31 samples')
    return groups


def lookup_stats(path):
    return {name: {
        'ns': statistics.median(row[0] for row in samples),
        'ticks': statistics.median(row[1] for row in samples),
        'ops_per_second': 1e9 / statistics.median(row[0] for row in samples),
    } for name, samples in read_samples(path).items()}


def container_rows(path):
    number = r'([0-9]+(?:\.[0-9]+)?)'
    pattern = re.compile(r'^\s{2}(.+?)\s+' + r'\s+'.join([number] * 3)
                         + r'\s+' + number + r'\s*/\s*' + number
                         + r'\s+' + number + r'\s*/\s*' + number + r'\s*$')
    rows = {}
    n = None
    for line in path.read_text().splitlines():
        size = re.match(r'^N = (\d+)', line)
        if size:
            n = int(size[1])
        match = pattern.match(line)
        if n is not None and match:
            rows[(n, match[1].strip())] = list(map(float, match.groups()[1:]))
    if len(rows) != 21:
        raise ValueError(f'{path}: expected 7 structures x 3 order counts, got {len(rows)}')
    return rows


def summarize(root):
    root = root.resolve()
    first = lookup_stats(root / 'lookup_samples_run1.csv')
    second = lookup_stats(root / 'lookup_samples_run2.csv')
    one = container_rows(root / 'containers_run1.txt')
    two = container_rows(root / 'containers_run2.txt')
    header_hash = hashlib.sha256((root / 'source/order_book.hpp').read_bytes()).hexdigest()
    data = {'header_sha256': header_hash, 'lookups_run1': first, 'lookups_run2': second}
    (root / 'summary.json').write_text(json.dumps(data, indent=2) + '\n')

    differences = []
    with (root / 'container_variation.csv').open('w', newline='') as stream:
        writer = csv.writer(stream)
        writer.writerow(['N', 'structure', 'metric', 'run1', 'run2', 'change_percent'])
        for key, values in one.items():
            for index, metric in enumerate(['add', 'cancel', 'bbo', 'add_p50', 'add_p99', 'cancel_p50', 'cancel_p99']):
                change = percent(values[index], two[key][index])
                writer.writerow([*key, metric, values[index], two[key][index], change])
                if index < 3 and change is not None:
                    differences.append((abs(change), key, metric, change))

    out = ['# Performance experiment', '',
           f'Header SHA-256: `{header_hash}`', '',
           'CPU/compiler/flags: [environment.txt](environment.txt). All measured source files are in [source/](source/).', '',
           '## Correctness and course output', '',
           '[Course test](course_test.txt), [container run 1](containers_run1.txt), [container run 2](containers_run2.txt).', '',
           'Container logs include every structure at N=64, 1024, 16384; add/cancel/BBO means, batch p50/p99, rehash spikes and the course reference SymMap block.', '',
           'Copy one full container run into your write-up and describe the difference between runs. The final SymMap block in these course logs is the reference implementation; actual student SymMap measurements follow below.', '',
           '## Your queries: warmed-up medians', '',
           'Each program run has 31 samples/query, 200000 ops/sample, after 20000 warm-up ops. Symbols: eight course keys, cyclic hits only. Book: 1024 resting orders after add/cancel churn.', '',
           'cycles/op means invariant/virtual TSC ticks per operation, not dynamically clocked core cycles. Throughput is single-thread loop ops/s. Loop, pointer reload and result-consumption overhead are included.', '',
           '| Query | Run 1 ns/op | Run 1 TSC ticks/op | Run 1 ops/s | Run 2 ns/op | ns change |',
           '|---|---:|---:|---:|---:|---:|']
    for name, row in first.items():
        other = second[name]
        out.append(f"| {name} | {row['ns']:.3f} | {row['ticks']:.3f} | {row['ops_per_second']:.0f} | {other['ns']:.3f} | {pct_text(percent(row['ns'], other['ns']))} |")

    out += ['', 'Book.best_bid and Book.best_ask are single calls. Book.BBO is one bid+ask pair: keep these op definitions separate.', '',
            'unordered_map.find(string) uses an existing std::string. unordered_map.find(c_str) includes temporary string conversion, as in the course harness. Name the chosen baseline when reporting speedup.', '',
            'Raw per-sample values: [run 1 CSV](lookup_samples_run1.csv), [run 2 CSV](lookup_samples_run2.csv).', '',
            '## Your Book: container-run variation', '',
            '| N | Metric | Run 1 ns/op | Run 2 ns/op | Change |',
            '|---:|---|---:|---:|---:|']
    for key, values in one.items():
        if not key[1].startswith('4  YOUR'):
            continue
        for index, metric in enumerate(['add', 'cancel', 'bbo']):
            out.append(f'| {key[0]} | {metric} | {values[index]:.2f} | {two[key][index]:.2f} | {pct_text(percent(values[index], two[key][index]))} |')
    if differences:
        _, key, metric, change = max(differences, key=lambda item: item[0])
        out += ['', f'Largest absolute change among add/cancel/BBO means: N={key[0]}, {key[1]}, {metric}: {pct_text(change)}.']
    out += ['', 'All structures and percentile variations: [container_variation.csv](container_variation.csv).', '',
            '## Scope of the required write-up', '',
            'GitHub Lab Step 5 asks for the full structure comparison, two runs and their variation, the METRIC lines, rehash/reference-symbol blocks, CPU/compiler, and an explanation of Q1/Q2/Q3 and tradeoffs. It does not explicitly require another optimized version of the completed Book/SymMap.', '',
            'The before directory label is a script label, not evidence of a missing after experiment. Additional before/after micro-optimization is optional for the GitHub Lab. If you choose it, preserve source changes and report both speedups and slowdowns. Two identical-source runs already serve the required repeatability comparison.', '']
    (root / 'summary.md').write_text('\n'.join(out), encoding='utf-8')
    print(root / 'summary.md')


def pooled_stats(root):
    first = read_samples(root / 'lookup_samples_run1.csv')
    second = read_samples(root / 'lookup_samples_run2.csv')
    return {name: statistics.median(row[0] for row in rows + second[name])
            for name, rows in first.items()}


def compare(before, after):
    before, after = before.resolve(), after.resolve()
    a, b = pooled_stats(before), pooled_stats(after)
    same = (before / 'source/order_book.hpp').read_bytes() == (after / 'source/order_book.hpp').read_bytes()
    same_harness = (before / 'source/lookup_benchmark.cpp').read_bytes() == (after / 'source/lookup_benchmark.cpp').read_bytes()
    out = ['# Before/after comparison', '', f'Before: `{before}`', f'After: `{after}`', '',
           'Each ns/op value is the median of all 62 samples across two program runs.', '']
    if same:
        out += ['**Header source is identical: this measures repeatability, not an optimization speedup.**', '']
    if not same_harness:
        out += ['**Benchmark source differs: inspect the workloads/method before comparing these values.**', '']
    out += ['| Query | Before ns/op | After ns/op | Before / after |', '|---|---:|---:|---:|']
    for name, ns in a.items():
        out.append(f'| {name} | {ns:.3f} | {b[name]:.3f} | {ns / b[name]:.3f}x |')
    destination = after / 'comparison.md'
    destination.write_text('\n'.join(out) + '\n', encoding='utf-8')
    print(destination)


if __name__ == '__main__':
    if len(sys.argv) == 2:
        summarize(Path(sys.argv[1]))
    elif len(sys.argv) == 3:
        compare(Path(sys.argv[1]), Path(sys.argv[2]))
    else:
        raise SystemExit('Usage: summarize_performance.py RESULT_DIR [AFTER_DIR]')
