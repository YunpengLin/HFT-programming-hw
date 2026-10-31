#!/usr/bin/env python3
"""Run unmodified course tests; report ns per interleaved add/count pair."""
import json
import os
import platform
import statistics
import subprocess
import tempfile
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parent
CXX = os.environ.get("CXX", "g++")
FLAGS = ["-std=c++17", "-O2", "-pthread", "-Wall", "-Wextra", "-Wpedantic"]


def run(cmd):
    p = subprocess.run(cmd, cwd=ROOT, capture_output=True, text=True, timeout=120)
    if p.returncode:
        raise RuntimeError(p.stdout + p.stderr)
    return p.stdout


def parse(output):
    results, metrics = {}, {}
    for line in output.splitlines():
        parts = line.split("|")
        if parts[0] == "RESULT":
            results[parts[1]] = parts[2]
        elif parts[0] == "METRIC":
            metrics[parts[1]] = float(parts[2])
    if not results or any(v != "pass" for v in results.values()):
        raise RuntimeError("Correctness failure:\n" + output)
    return results, metrics


def main():
    cpuinfo = Path("/proc/cpuinfo")
    cpu = platform.processor()
    if cpuinfo.exists():
        cpu = next((s.split(":", 1)[1].strip() for s in cpuinfo.read_text().splitlines()
                    if s.startswith("model name")), cpu)
    report = {
        "measured_at_utc": datetime.now(timezone.utc).isoformat(),
        "environment": "GitHub Actions" if os.environ.get("GITHUB_ACTIONS") else "local",
        "os": platform.platform(), "cpu": cpu,
        "compiler": run([CXX, "--version"]).splitlines()[0],
        "flags": FLAGS, "window_ns": 1000,
        "measured_iterations_per_run": 2000000,
        "warmup_iterations_per_run": 200001,
        "op_definition": "add(t), count(t), result barrier, ++t",
        "raw_runs": [],
    }
    with tempfile.TemporaryDirectory(prefix="hw8_") as d:
        course, edges = str(Path(d) / "rolling"), str(Path(d) / "boundaries")
        for source, binary in [("rolling_counter_test.cpp", course), ("boundaries.cpp", edges)]:
            run([CXX, *FLAGS, "-I.", "-Itests", "tests/" + source, "-o", binary])
        edge_output = run([edges])
        report["boundary_checks"], _ = parse(edge_output)
        report["boundary_output"] = edge_output
        print(edge_output, end="")
        values = []
        for i in range(7):
            output = run([course])
            results, metrics = parse(output)
            if not {"rc_window", "rc_mixed"} <= results.keys():
                raise RuntimeError("Missing course results")
            ns = metrics["rolling_ns_per_op"]
            if not 0 < ns < float("inf"):
                raise RuntimeError("Invalid ns/op")
            report["course_checks"] = results
            report["raw_runs"].append(output)
            values.append(ns)
            print(f"run {i+1}: {ns} ns/op")
    report["ns_per_op_runs"] = values
    report["median_ns_per_op"] = statistics.median(values)
    (ROOT / "report.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    rows = "\n".join(f"| {i+1} | {v:.5f} |" for i, v in enumerate(values))
    summary = f"""# HW8 RollingCounter results

Environment: {report['environment']}; measured at {report['measured_at_utc']}.

Course checks: **rc_window PASS; rc_mixed PASS**. Five additional boundary checks: **PASS**.

**Median: {report['median_ns_per_op']:.5f} ns/op**, seven independent process runs.

One op is one interleaved **add + count** pair, including the result barrier and timestamp
increment. Each run warms up 200,001 iterations and measures 2,000,000 iterations,
with window_ns=1000 and timestamps increasing by 1 each iteration. Construction is outside
the timed interval. The course driver and bench.hpp are unmodified.

| Run | ns/op |
|---|---:|
{rows}

CPU: {cpu}. OS: {report['os']}.
Compiler: {report['compiler']}. Flags: `{' '.join(FLAGS)}`.
These are machine-specific amortized stream timings, not worst-case count latency.
Raw output for every run and environment details are in report.json.
"""
    (ROOT / "RESULTS.md").write_text(summary, encoding="utf-8")
    summary_path = os.environ.get("GITHUB_STEP_SUMMARY")
    if summary_path:
        with open(summary_path, "a", encoding="utf-8") as f:
            f.write(summary)
    print(summary)


if __name__ == "__main__":
    try:
        main()
    except Exception as exc:
        summary_path = os.environ.get("GITHUB_STEP_SUMMARY")
        if summary_path:
            with open(summary_path, "a", encoding="utf-8") as f:
                f.write("# HW8 RollingCounter\n\n**FAIL**: build or correctness check failed; see logs.\n")
        raise SystemExit(str(exc))
