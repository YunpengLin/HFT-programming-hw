#pragma once

#include <atomic>
#include <cstddef>
#include <cstdint>
#include <vector>

struct SPSCRing {
    // The caller supplies a nonzero power of two.
    explicit SPSCRing(std::size_t capacity_pow2)
        : cap_(capacity_pow2), mask_(cap_ - 1), buf_(cap_) {}

    bool push(std::uint64_t value) {
        const std::size_t tail = tail_.load(std::memory_order_relaxed);
        const std::size_t head = head_.load(std::memory_order_acquire);
        if (tail - head == cap_) {
            return false;
        }

        buf_[tail & mask_] = value;
        tail_.store(tail + 1, std::memory_order_release);
        return true;
    }

    bool pop(std::uint64_t& out) {
        const std::size_t head = head_.load(std::memory_order_relaxed);
        const std::size_t tail = tail_.load(std::memory_order_acquire);
        if (head == tail) {
            return false;
        }

        out = buf_[head & mask_];
        head_.store(head + 1, std::memory_order_release);
        return true;
    }

    bool empty() const {
        const std::size_t head = head_.load(std::memory_order_acquire);
        const std::size_t tail = tail_.load(std::memory_order_acquire);
        return head == tail;
    }

    bool full() const {
        const std::size_t tail = tail_.load(std::memory_order_acquire);
        const std::size_t head = head_.load(std::memory_order_acquire);
        return tail - head == cap_;
    }

private:
    const std::size_t cap_;
    const std::size_t mask_;
    std::vector<std::uint64_t> buf_;

    alignas(64) std::atomic<std::size_t> head_{0}; // Consumer writes.
    alignas(64) std::atomic<std::size_t> tail_{0}; // Producer writes.
};
