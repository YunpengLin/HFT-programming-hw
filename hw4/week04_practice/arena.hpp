#pragma once
#include <cstddef>
#include <cstdint>
#include <new>

struct Arena {
    Arena(std::size_t capacity) : cap_(capacity), offset_(0) {
        base_ = static_cast<uint8_t*>(::operator new(cap_));
    }
    ~Arena() { ::operator delete(base_); }

    void* alloc(std::size_t n) {
        if (n == 0) return nullptr;
        const std::size_t alignment = sizeof(void*);
        const std::size_t remainder = n % alignment;
        if (remainder != 0) {
            const std::size_t padding = alignment - remainder;
            if (padding > cap_ || n > cap_ - padding) return nullptr;
            n += padding;
        }
        if (n > cap_ - offset_) return nullptr;
        void* p = offset_ + base_;
        offset_ += n;
        return p;
    }
    void reset() { offset_ = 0; }

private:
    uint8_t* base_;
    std::size_t cap_, offset_;
};
