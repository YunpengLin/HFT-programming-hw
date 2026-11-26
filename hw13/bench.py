"""Measure the frozen HW13 program on x86-64 Linux. Run from the hw13 directory."""
import csv
import hashlib
import json
import os
from pathlib import Path
import platform
import random
import re
import shutil
import statistics
import subprocess
import tempfile

OPS = 65536 * 3000
SOURCE = Path("kernel.cpp").resolve()
OUT = Path("results").resolve()
NATIVE = "-O3 -march=native"
FLAGS = {
    "O0": "-O0",
    "O2": "-O2",
    "O3": "-O3",
    "native": NATIVE,
    "unroll": NATIVE + " -funroll-loops",
    "lto": NATIVE + " -flto",
    "pgo": NATIVE,
    "native_no_contract": NATIVE + " -ffp-contract=off",
    "no_errno_no_contract": NATIVE + " -ffp-contract=off -fno-math-errno",
    "strict_unroll": NATIVE + " -ffp-contract=off -funroll-loops",
    "strict_pgo": NATIVE + " -ffp-contract=off",
    "strict_unroll_pgo": NATIVE + " -ffp-contract=off -funroll-loops",
    "O2_unroll": "-O2 -funroll-loops",
    "all_strict": NATIVE + " -ffp-contract=off -funroll-loops -flto",
    "fast_math": NATIVE + " -ffast-math",
    "fast_unroll": NATIVE + " -ffast-math -funroll-loops",
    "fast_lto": NATIVE + " -ffast-math -flto",
    "fast_pgo": NATIVE + " -ffast-math",
    "fast_all_pgo": NATIVE + " -ffast-math -funroll-loops -flto",
}
TRAIN = {"pgo", "strict_pgo", "strict_unroll_pgo", "all_strict", "fast_pgo", "fast_all_pgo"}
CYCLES_WRAPPER = r'''
#include <cstdio>
#include <sys/wait.h>
#include <unistd.h>
#include <x86intrin.h>
static unsigned long long ticks() {
    _mm_lfence();
    auto t = __rdtsc();
    _mm_lfence();
    return t;
}
int main(int argc, char** argv) {
    if (argc != 2) return 2;
    auto start = ticks();
    pid_t pid = fork();
    if (pid < 0) return 3;
    if (pid == 0) { execl(argv[1], argv[1], (char*)nullptr); _exit(127); }
    int status = 0;
    if (waitpid(pid, &status, 0) != pid || !WIFEXITED(status) || WEXITSTATUS(status)) return 4;
    auto end = ticks();
    std::printf("reference_ticks=%llu\n", end - start);
}
'''


def run(args, **kwargs):
    proc = subprocess.run(args, text=True, capture_output=True, **kwargs)
    if proc.returncode:
        raise RuntimeError(f"{args} failed ({proc.returncode}):\n{proc.stderr}")
    return proc.stdout


def compile_variant(work, name, flag_string):
    directory = work / name
    directory.mkdir()
    binary = directory / "fast"
    options = flag_string.split()
    if name in TRAIN:
        run(["g++", *options, "-fprofile-generate", SOURCE, "-o", "fast"], cwd=directory)
        run([binary], cwd=directory)
        if not list(directory.rglob("*.gcda")):
            raise RuntimeError("Missing training data: " + name + " " + str(list(directory.iterdir())))
        options += ["-fprofile-use", "-Werror=missing-profile", "-Werror=coverage-mismatch"]
    remarks = OUT / (name + ".vec.txt")
    remarks.unlink(missing_ok=True)
    run(["g++", *options, "-fopt-info-vec-all=" + str(remarks), SOURCE, "-o", "fast"], cwd=directory)
    listing = run(["objdump", "-d", "-C", "-M", "intel", binary])
    sections = re.split(r"(?=^[0-9a-f]+ <)", listing, flags=re.M)
    hot = [s for s in sections if re.match(r"^[0-9a-f]+ <(?:main>|kernel\()", s)]
    (OUT / (name + ".asm")).write_text("\n".join(hot))
    return binary


def perf_prefix(work):
    candidates = sorted(Path("/usr/lib/linux-tools").glob("*/perf"), reverse=True)
    if shutil.which("perf"):
        candidates.append(Path(shutil.which("perf")))
    last = "perf executable unavailable"
    available = []
    for perf in candidates:
        if not os.access(perf, os.X_OK):
            continue
        # Use elevated profiling only on an ephemeral hosted runner if necessary.
        prefixes = [[str(perf)]]
        if os.getenv("GITHUB_ACTIONS") == "true":
            prefixes.append(["sudo", "-n", str(perf)])
        for prefix in prefixes:
            p = subprocess.run([*prefix, "stat", "-x", ";", "-e", "cycles:u", "--", "true"],
                               cwd=work, text=True, capture_output=True)
            available.append(prefix)
            if re.search(r"(?m)^\s*\d+;[^;]*;cycles:u;", p.stderr):
                return prefix, p.stderr
            last = p.stderr.strip()
    # Prefer the matching perf binary and its privileged probe on the hosted VM.
    fallback = available[min(1, len(available) - 1)] if available else []
    return fallback, last


def main():
    src = SOURCE.read_bytes()
    blob = hashlib.sha1(b"blob " + str(len(src)).encode() + b"\0" + src).hexdigest()
    if blob != "5e3cfa363da463f924b0984480b27ae573279a41":
        raise SystemExit("The source differs from the frozen starter.")
    if platform.machine() not in ("x86_64", "AMD64"):
        raise SystemExit("This reference-tick harness requires x86-64.")
    OUT.mkdir(exist_ok=True)
    cpu = min(os.sched_getaffinity(0))
    os.sched_setaffinity(0, {cpu})
    with tempfile.TemporaryDirectory() as tmp:
        work = Path(tmp)
        wrapper = work / "ticks"
        (work / "ticks.cpp").write_text(CYCLES_WRAPPER)
        run(["g++", "-O2", work / "ticks.cpp", "-o", wrapper])
        binaries = {n: compile_variant(work, n, f) for n, f in FLAGS.items()}
        prefix, probe = perf_prefix(work)
        (OUT / "environment.txt").write_text(
            f"Git blob {blob}\nPinned logical CPU {cpu}\nRun {os.getenv('GITHUB_RUN_ID')}\n"
            + platform.platform() + "\n" + run(["g++", "--version"]) + run(["lscpu"])
            + "\nperf command: " + str(prefix) + "\nperf probe:\n" + probe + "\n")
        for binary in binaries.values():
            run([binary])
        samples = []
        rng = random.Random(4741)
        for block in range(1, 10):
            names = list(binaries)
            rng.shuffle(names)
            for name in names:
                output = run([wrapper, binaries[name]])
                checksum, milliseconds = re.search(r"checksum=(\S+) time_ms=(\S+)", output).groups()
                ticks = int(re.search(r"reference_ticks=(\d+)", output)[1])
                samples.append((block, name, float(milliseconds), checksum, ticks))
        with (OUT / "timings.csv").open("w", newline="") as f:
            writer = csv.writer(f)
            writer.writerow(["round", "variant", "kernel_ms", "checksum", "process_reference_ticks"])
            writer.writerows(samples)
        summary = {}
        for name, binary in binaries.items():
            rows = [s for s in samples if s[1] == name]
            checks = {s[3] for s in rows}
            if len(checks) != 1:
                raise RuntimeError("Inconsistent checksum: " + name)
            times = [s[2] for s in rows]
            summary[name] = dict(flags=FLAGS[name] + (" -fprofile-use" if name in TRAIN else ""),
                ms=statistics.median(times), min_ms=min(times), max_ms=max(times), checksum=checks.pop(),
                reference_ticks_per_op=statistics.median(s[4] for s in rows) / OPS)
            if prefix:
                events = "cycles:u,instructions:u,branches:u,branch-misses:u,cache-references:u,cache-misses:u"
                perf = subprocess.run([*prefix, "stat", "-r", "3", "-x", ";", "-e", events,
                                       "--", binary], text=True, capture_output=True)
                (OUT / (name + ".perf.txt")).write_text(perf.stderr + "\n" + perf.stdout)
        if prefix:
            # Software events remain available on some VMs without a virtual PMU.
            for name in binaries:
                software = subprocess.run([*prefix, "stat", "-r", "3", "-x", ";", "-e",
                    "task-clock,context-switches,cpu-migrations,page-faults", "--", binaries[name]],
                    text=True, capture_output=True)
                (OUT / (name + ".software.txt")).write_text(software.stderr + "\n" + software.stdout)
        if shutil.which("valgrind"):
            counts = {}
            ref = summary["O0"]["checksum"]
            exact = min((n for n in summary if summary[n]["checksum"] == ref), key=lambda n: summary[n]["ms"])
            quickest = min(summary, key=lambda n: summary[n]["ms"])
            for name in dict.fromkeys(["O0", "O2", "O3", "native", "unroll", "pgo", "lto",
                                       "fast_math", "native_no_contract", "strict_unroll", exact, quickest]):
                path = work / ("cg-" + name)
                child = subprocess.run(["valgrind", "--tool=cachegrind", "--cache-sim=no",
                    "--branch-sim=yes", "--cachegrind-out-file=" + str(path), binaries[name]],
                    text=True, capture_output=True)
                if child.returncode:
                    counts[name] = {"error": child.stderr[-1400:]}
                    continue
                data = path.read_text()
                keys = re.search(r"^events:\s*(.+)$", data, re.M)[1].split()
                values = re.search(r"^summary:\s*(.+)$", data, re.M)[1].split()
                counts[name] = dict(zip(keys, map(int, values)))
                counts[name]["checksum"] = re.search(r"checksum=(\S+)", child.stdout)[1]
            (OUT / "dynamic-counts.json").write_text(json.dumps(counts, indent=2) + "\n")
        (OUT / "summary.json").write_text(json.dumps(summary, indent=2) + "\n")
        print(json.dumps(summary, indent=2))


if __name__ == "__main__":
    main()
