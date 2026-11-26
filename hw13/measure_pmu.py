"""Collect whole-process hardware counts for the frozen HW13 kernel on Linux."""
import csv
import hashlib
import os
from pathlib import Path
import platform
import random
import re
import shutil
import statistics
import subprocess
import sys
import tempfile

from bench import FLAGS, TRAIN

ROOT = Path(__file__).resolve().parent
SOURCE = ROOT / "kernel.cpp"
OPS = 65536 * 3000
EVENTS = ["cycles", "instructions", "branches", "branch-misses"]


def read_counts(report):
    counts = {}
    for row in csv.reader(report.splitlines(), delimiter=";"):
        if len(row) < 3 or not row[0].strip().isdigit():
            continue
        for name in EVENTS:
            # Accept both ordinary and hybrid PMU names, e.g. cpu_core/cycles/u.
            if re.search(r"(?:^|/)" + re.escape(name) + r"(?:$|:|/)", row[2]):
                counts[name] = counts.get(name, 0) + int(row[0])
    return counts


def perf_command():
    candidates = [shutil.which("perf"), *sorted(Path("/usr/lib/linux-tools").glob("*/perf"), reverse=True)]
    messages = []
    for candidate in dict.fromkeys(str(p) for p in candidates if p):
        attempts = [[candidate]]
        if shutil.which("sudo"):
            attempts.append(["sudo", "-n", candidate])
        for prefix in attempts:
            probe = subprocess.run([*prefix, "stat", "-x", ";", "-e", "cycles:u", "--",
                                    sys.executable, "-c", "sum(range(100000))"],
                                   text=True, capture_output=True)
            if probe.returncode == 0 and read_counts(probe.stderr).get("cycles", 0) > 0:
                return prefix
            messages.append(" ".join(prefix) + "\n" + probe.stderr.strip())
    raise SystemExit("No readable hardware cycles event.\n" + ("\n".join(messages) or "Install Linux perf."))


def main():
    if not sys.platform.startswith("linux"):
        raise SystemExit("Run from Linux.")
    source = SOURCE.read_bytes()
    if hashlib.sha1(b"blob " + str(len(source)).encode() + b"\0" + source).hexdigest() != "5e3cfa363da463f924b0984480b27ae573279a41":
        raise SystemExit("Source differs from the frozen kernel.")
    os.environ["LC_ALL"] = "C"
    os.sched_setaffinity(0, {min(os.sched_getaffinity(0))})
    perf = perf_command()
    # Probe optional events individually so a missing branch event cannot drop cycles.
    supported = []
    for e in EVENTS:
        probe = subprocess.run([*perf, "stat", "-x", ";", "-e", e + ":u", "--",
                                sys.executable, "-c", "sum(range(100000))"],
                               text=True, capture_output=True)
        if e in read_counts(probe.stderr):
            supported.append(e)
    if "cycles" not in supported:
        raise SystemExit("Hardware cycles probe did not repeat.")
    out = Path(tempfile.mkdtemp(prefix="pmu-", dir=ROOT))
    print("Results directory:", out, flush=True)
    (out / "environment.txt").write_text(platform.platform() + "\n"
        + subprocess.check_output(["lscpu"], text=True)
        + subprocess.check_output(["g++", "--version"], text=True)
        + "Actions run: " + os.getenv("GITHUB_RUN_ID", "local") + "\n"
        + "CPU affinity: " + str(os.sched_getaffinity(0)) + "\nEvents: " + ", ".join(supported) + "\n")
    samples = {n: [] for n in FLAGS}
    with tempfile.TemporaryDirectory() as temp:
        binaries = {}
        for name, flags in FLAGS.items():
            folder = Path(temp) / name
            folder.mkdir()
            flags = flags.split()
            if name in TRAIN:
                subprocess.run(["g++", *flags, "-fprofile-generate", SOURCE, "-o", "fast"], cwd=folder, check=True)
                subprocess.run(["./fast"], cwd=folder, check=True, stdout=subprocess.DEVNULL)
                flags += ["-fprofile-use", "-Werror=missing-profile", "-Werror=coverage-mismatch"]
            subprocess.run(["g++", *flags, SOURCE, "-o", "fast"], cwd=folder, check=True)
            binaries[name] = folder / "fast"
            subprocess.run([binaries[name]], check=True, stdout=subprocess.DEVNULL)
        rng = random.Random(4741)
        with (out / "samples.csv").open("w", newline="") as f, (out / "perf-stat.txt").open("w") as log:
            writer = csv.writer(f)
            writer.writerow(["round", "build", "kernel_ms", "checksum", *supported])
            for block in range(1, 6):
                names = list(FLAGS)
                rng.shuffle(names)
                for n in names:
                    result = subprocess.run([*perf, "stat", "-x", ";", "-e",
                        ",".join(e + ":u" for e in supported), "--", binaries[n]],
                        text=True, capture_output=True)
                    log.write(f"\n{n}, round {block}\n" + result.stderr + result.stdout)
                    counts = read_counts(result.stderr)
                    if result.returncode or any(e not in counts for e in supported) or counts["cycles"] <= 0:
                        raise SystemExit("Incomplete perf measurement. See " + str(out / "perf-stat.txt"))
                    checksum, ms = re.search(r"checksum=(\S+) time_ms=(\S+)", result.stdout).groups()
                    samples[n].append((float(ms), checksum, counts))
                    writer.writerow([block, n, ms, checksum, *(counts[e] for e in supported)])
    with (out / "summary.csv").open("w", newline="") as f:
        writer = csv.writer(f)
        writer.writerow(["build", "median_kernel_ms", "speedup", "checksum", *(e + "_per_op" for e in supported)])
        baseline = statistics.median(r[0] for r in samples["O0"])
        for n, rows in samples.items():
            if len({r[1] for r in rows}) != 1:
                raise SystemExit("Unstable checksum: " + n)
            ms = statistics.median(r[0] for r in rows)
            writer.writerow([n, ms, baseline / ms, rows[0][1],
                             *(statistics.median(r[2][e] for r in rows) / OPS for e in supported)])
    for name in ("environment.txt", "samples.csv", "summary.csv", "perf-stat.txt"):
        print(f"HW13_BEGIN {name}", flush=True)
        print((out / name).read_text(), end="", flush=True)
        print(f"HW13_END {name}", flush=True)


if __name__ == "__main__":
    main()
