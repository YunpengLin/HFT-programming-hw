#pragma once
#include <cstddef>
#include <cstdint>
#include <stdexcept>
#include <vector>

// Lab 8: timestamps are added in non-decreasing order; count's clock never
// decreases. Call count(now) only after recording events with ts <= now.
// Single-threaded. At most CAP timestamps may be stored between count calls.
struct RollingCounter {
    static constexpr std::size_t CAP = std::size_t{1} << 20;
    static_assert(CAP > 0 && (CAP & (CAP - 1)) == 0,
                  "CAP must be a nonzero power of two");

    uint64_t window_;
    std::vector<uint64_t> buf_;
    std::size_t head_ = 0, tail_ = 0;

    explicit RollingCounter(uint64_t window_ns) : window_(window_ns) {
        buf_.resize(CAP);
    }

    void add(uint64_t ts_ns) {
        // Extra guard beyond the lecture: never silently overwrite an event.
        // Expiry remains lazy: call count() to reclaim space, or increase CAP.
        if (tail_ - head_ == CAP) {
            throw std::overflow_error("RollingCounter capacity exceeded");
        }
        buf_[tail_ & (CAP-1)] = ts_ns;
        ++tail_;
    }

    uint64_t count(uint64_t now_ns) {
        // Equality matters: when now == window, ts == 0 MUST expire.
        if (now_ns >= window_) {
            const uint64_t cutoff = now_ns - window_;
            while (head_ != tail_ &&
                   buf_[head_ & (CAP - 1)] <= cutoff) {
                ++head_;
            }
        }
        return static_cast<uint64_t>(tail_-head_);
    }
};
