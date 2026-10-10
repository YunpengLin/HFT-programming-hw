#pragma once
#include <cstddef>
#include <cstdint>
#include <new>

struct Pool {
    Pool(std::size_t obj_size, std::size_t capacity)
        : slot_(obj_size < sizeof(void*) ? sizeof(void*) : obj_size), cap_(capacity) {
        buf_ = static_cast<uint8_t*>(::operator new(slot_ * cap_));
        head_ = nullptr;
        for (std::size_t i = cap_; i-- > 0; )
            free(i*slot_ + buf_); // i*slot_ + buf_
    }

    ~Pool() { ::operator delete(buf_); }

    void* alloc() {
        if (!head_) return nullptr;
        void* p = head_;
        head_ = *reinterpret_cast<void**>(head_);
        return p;
    }

    void free(void* p) {
        if (!p) return;
        *reinterpret_cast<void**>(p) = head_;
        head_ = p;
    }

private:
    std::size_t slot_, cap_;
    uint8_t* buf_;
    void* head_;
};
