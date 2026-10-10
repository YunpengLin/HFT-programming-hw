#include <cstdio>
#include <new>
#include "../include/pool.hpp"
#include "signals.hpp"

int main() {
    constexpr std::size_t SLOT = sizeof(SpreadSignal) > sizeof(MidpointSignal)
        ? sizeof(SpreadSignal)
        : sizeof(MidpointSignal);
    Pool pool(SLOT, 2);

    void* memory[2] = {pool.alloc(), pool.alloc()};
    if (!memory[0] || !memory[1]) {
        std::printf("pool allocation failed\n");
        pool.free(memory[0]);
        pool.free(memory[1]);
        return 1;
    }

    Signal* s[2] = {
        new (memory[0]) SpreadSignal{},
        new (memory[1]) MidpointSignal{},
    };
    std::printf("live objects after construction: %d\n", live);

    for (Signal* p : s) {
        std::printf("signal = %+.4f\n",  p->evaluate(100.00, 100.02, 0.4));
    }

    for (Signal* p : s) {
        p->~Signal();
        pool.free(p);
    }

    std::printf("live objects after teardown: %d\n", live);
    if (live != 0) {
        std::printf("lifetime check failed\n");
        return 1;
    }
}
