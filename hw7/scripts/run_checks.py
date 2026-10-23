#!/usr/bin/env python3
"""Validate the exact course interface and additional edge cases."""
import argparse
import json
import os
from pathlib import Path
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--sanitize', action='store_true', help='ASan/UBSan edge checks, without timing')
    parser.add_argument('--course-only', action='store_true')
    args = parser.parse_args()
    build = ROOT / 'build' / ('sanitized' if args.sanitize else 'checks')
    build.mkdir(parents=True, exist_ok=True)
    flags = ['-std=c++17', '-Wall', '-Wextra', '-Werror', '-pedantic', '-fmax-errors=3',
             '-iquote', str(ROOT), '-iquote', str(ROOT / 'tests')]
    flags += ['-O1', '-g', '-fsanitize=address,undefined', '-fno-omit-frame-pointer'] if args.sanitize else ['-O2']
    cases = [] if args.sanitize else ['book_test']
    if not args.course_only:
        cases += ['flat_book_test', 'symmap_test', 'absolute_index_demo']
    if not cases:
        raise ValueError('choose --sanitize or --course-only separately')
    results, metrics = [], {}
    ok = True
    for case in cases:
        binary = build / case
        command = [os.environ.get('CXX', 'g++'), *flags, str(ROOT / 'tests' / (case + '.cpp')), '-o', str(binary)]
        compiled = subprocess.run(command, text=True, capture_output=True, timeout=120)
        output = compiled.stdout + compiled.stderr
        passed = compiled.returncode == 0
        if passed:
            ran = subprocess.run([str(binary)], text=True, capture_output=True, timeout=120)
            output += ran.stdout + ran.stderr
            passed = ran.returncode == 0
            if case == 'book_test':
                verdicts = {}
                for line in ran.stdout.splitlines():
                    fields = line.split('|')
                    if fields[0] == 'RESULT' and len(fields) == 4:
                        verdicts[fields[1]] = fields[2]
                    elif fields[0] == 'METRIC' and len(fields) == 3:
                        metrics[fields[1]] = float(fields[2])
                passed = passed and all(verdicts.get(key) == 'pass' for key in ('book_bbo', 'symmap'))
                passed = passed and all(key in metrics for key in ('book_bbo_ns_per_op', 'symmap_get_ns_per_op'))
        (build / (case + '.log')).write_text(output, encoding='utf-8')
        print(output, end='' if output.endswith('\n') else '\n')
        results.append({'test': case, 'passed': passed})
        ok = ok and passed
    data = {'passed': ok, 'sanitized': args.sanitize, 'tests': results, 'metrics': metrics}
    (build / 'results.json').write_text(json.dumps(data, indent=2) + '\n', encoding='utf-8')
    summary = ['## HW7 ' + ('ASan/UBSan edge checks' if args.sanitize else 'course interface and correctness'), '',
               '| Check | Result |', '|---|---|']
    summary += [f"| {r['test']} | {'PASS' if r['passed'] else 'FAIL'} |" for r in results]
    if not args.sanitize and ok:
        summary += ['', '| Course metric | ns/op |', '|---|---:|']
        summary += [f'| {name} | {value:.6f} |' for name, value in metrics.items()]
        summary += ['', 'BBO is one best_bid()+best_ask() pair. CI timings are runner-specific, separate from local write-up measurements.']
    if os.environ.get('GITHUB_STEP_SUMMARY'):
        with open(os.environ['GITHUB_STEP_SUMMARY'], 'a', encoding='utf-8') as stream:
            stream.write('\n'.join(summary) + '\n\n')
    return 0 if ok else 1


if __name__ == '__main__':
    try:
        sys.exit(main())
    except (ValueError, subprocess.TimeoutExpired) as error:
        print(f'FAIL: {error}', file=sys.stderr)
        sys.exit(1)
