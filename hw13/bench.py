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
    "all_strict": NATIVE + " -ffp-contract=off -funroll-loops -flto",
    "fast_math": NATIVE + " -ffast-math",
    "fast_unroll": NATIVE + " -ffast-math -funroll-loops",
    "fast_lto": NATIVE + " -ffast-math -flto",
    "fast_pgo": NATIVE + " -ffast-math",
    "fast_all_pgo": NATIVE + " -ffast-math -funroll-loops -flto",
}
TRAIN = {"pgo", "all_strict", "fast_pgo", "fast_all_pgo"}
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
    return subprocess.run(args, check=True, text=True, capture_output=True, **kwargs).stdout


def compile_variant(work, name, flag_string):
    binary = work / name
    options = flag_string.split()
    if name in TRAIN:
        directory = work / ("profile-" + name)
        directory.mkdir()
        run(["g++", *options, "-fprofile-generate=" + str(directory), SOURCE, "-o", binary])
        run([binary])
        if not list(directory.glob("*.gcda")):
            raise RuntimeError("Missing training data: " + name)
        options += ["-fprofile-use=" + str(directory), "-Werror=missing-profile",
                    "-Werror=coverage-mismatch"]
    remarks = OUT / (name + ".vec.txt")
    run(["g++", *options, "-fopt-info-vec-all=" + str(remarks), SOURCE, "-o", binary])
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
    return (available[-1] if available else []), last


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
            summary[name] = dict(flags=FLAGS[name] + (" -fprofile-use=PROFILE" if name in TRAIN else ""),
                ms=statistics.median(times), min_ms=min(times), max_ms=max(times), checksum=checks.pop(),
                reference_ticks_per_op=statistics.median(s[4] for s in rows) / OPS)
            if prefix:
                events = "cycles:u,instructions:u,branches:u,branch-misses:u,cache-references:u,cache-misses:u"
                perf = subprocess.run([*prefix, "stat", "-r", "3", "-x", ";", "-e", events,
                                       "--", binary], text=True, capture_output=True)
                (OUT / (name + ".perf.txt")).write_text(perf.stderr + "\n" + perf.stdout)
        (OUT / "summary.json").write_text(json.dumps(summary, indent=2) + "\n")
        print(json.dumps(summary, indent=2))


if __name__ == "__main__":
    main()
