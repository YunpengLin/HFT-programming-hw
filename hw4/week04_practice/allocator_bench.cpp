#include <algorithm>
#include <cstdio>
#include <cstdlib>
#include <vector>
#include "../include/pool.hpp"
#include "arena.hpp"
#include "bench.hpp"

int main() {
    constexpr int BATCH = 256;
    constexpr std::size_t BYTES = 64;
    constexpr long ROUNDS = 20000;
    Pool pool(BYTES, BATCH);
    Arena arena(BYTES * BATCH);
    void* p[BATCH];
    uint8_t* q[BATCH];
    bool failed = false;
    std::vector<double> malloc_times, new_times, pool_times, arena_times;

    for (int rep = 0; rep < 7; ++rep) {
        malloc_times.push_back(ns_per_op([&] {
            for (int i = 0; i < BATCH; ++i) {
                p[i] = malloc(BYTES);
                if (!p[i]) failed = true;
                doNotOptimize(p[i]);
            }
            for (int i = 0; i < BATCH; ++i) {
                free(p[i]);
            }
        }, ROUNDS));

        new_times.push_back(ns_per_op([&] {
            for (int i = 0; i < BATCH; ++i) {
                q[i] = new uint8_t[BYTES];
                if (!q[i]) failed = true;
                doNotOptimize(q[i]);
            }
            for (int i = 0; i < BATCH; ++i) {
                delete[] q[i];
            }
        }, ROUNDS));

        pool_times.push_back(ns_per_op([&] {
            for (int i = 0; i < BATCH; ++i) {
                p[i] = pool.alloc();
                if (!p[i]) failed = true;
                doNotOptimize(p[i]);
            }
            for (int i = 0; i < BATCH; ++i) {
                pool.free(p[i]);
            }
        }, ROUNDS));

        arena_times.push_back(ns_per_op([&] {
            for (int i = 0; i < BATCH; ++i) {
                p[i] = arena.alloc(BYTES);
                if (!p[i]) failed = true;
                doNotOptimize(p[i]);
            }
            arena.reset();
        }, ROUNDS));
    }

    if (failed) {
        std::printf("allocation failed; timing is not valid\n");
        return 1;
    }
    std::sort(malloc_times.begin(), malloc_times.end());
    std::sort(new_times.begin(), new_times.end());
    std::sort(pool_times.begin(), pool_times.end());
    std::sort(arena_times.begin(), arena_times.end());
    const int middle = malloc_times.size() / 2;
    const double count = BATCH;
    std::printf("malloc/free  %.2f ns/object\n", malloc_times[middle] / count);
    std::printf("new/delete   %.2f ns/object\n", new_times[middle] / count);
    std::printf("pool         %.2f ns/object\n", pool_times[middle] / count);
    std::printf("arena        %.2f ns/object\n", arena_times[middle] / count);
}
