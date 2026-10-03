#include <cassert>
#include <cstddef>
#include <iostream>
#include <memory>
#include <vector>

// Rule of Three: this class owns a raw array and provides deep-copy semantics.
class RawBuffer {
public:
    explicit RawBuffer(std::size_t n) : n_(n), data_(new double[n]()) {}
    ~RawBuffer() { delete[] data_; }

    RawBuffer(const RawBuffer& other)
        : n_(other.n_), data_(new double[other.n_]()) {
        for (std::size_t i = 0; i < n_; ++i) data_[i] = other.data_[i];
    }

    RawBuffer& operator=(const RawBuffer& other) {
        if (this == &other) return *this;
        // Allocate before releasing the old array: allocation failure leaves
        // this object unchanged. Copying double values cannot throw.
        double* fresh = new double[other.n_];
        for (std::size_t i = 0; i < other.n_; ++i) fresh[i] = other.data_[i];
        delete[] data_;
        data_ = fresh;
        n_ = other.n_;
        return *this;
    }

    std::size_t size() const { return n_; }
    double& operator[](std::size_t i) { return data_[i]; }
    const double& operator[](std::size_t i) const { return data_[i]; }

private:
    std::size_t n_;
    double* data_;
};

class UniqueBuffer {
public:
    explicit UniqueBuffer(std::size_t n)
        : n_(n), data_(std::make_unique<double[]>(n)) {}

    // No custom destructor: unique_ptr<double[]> automatically calls delete[].
    // Explicit copy operations remain necessary to preserve deep-copy semantics.
    UniqueBuffer(const UniqueBuffer& other)
        : n_(other.n_), data_(std::make_unique<double[]>(other.n_)) {
        for (std::size_t i = 0; i < n_; ++i) data_[i] = other.data_[i];
    }

    UniqueBuffer& operator=(const UniqueBuffer& other) {
        if (this == &other) return *this;
        auto fresh = std::make_unique<double[]>(other.n_);
        for (std::size_t i = 0; i < other.n_; ++i) fresh[i] = other.data_[i];
        data_.swap(fresh);
        n_ = other.n_;
        return *this;
    } // fresh releases the old array on scope exit.

    std::size_t size() const { return n_; }
    double& operator[](std::size_t i) { return data_[i]; }
    const double& operator[](std::size_t i) const { return data_[i]; }

private:
    std::size_t n_;
    std::unique_ptr<double[]> data_;
};

// Use identical checks for both implementations; keep assertions enabled.
template <typename Buffer>
void run_tests(const char* label) {
    {
        Buffer a(3);
        assert(a[0] == 0.0 && a[1] == 0.0 && a[2] == 0.0);
        a[0] = 10.0;
        a[1] = 20.0;
        a[2] = 30.0;

        Buffer b = a;
        assert(b.size() == 3 && b[2] == 30.0);
        b[0] = 99.0;
        assert(a[0] == 10.0); // Mutating a copy must not change the original.

        Buffer c(1);
        c[0] = -1.0;
        Buffer& result = (c = a);
        assert(&result == &c);
        assert(c.size() == 3 && c[0] == 10.0 && c[2] == 30.0);
        c[1] = 88.0;
        assert(a[1] == 20.0);

        a = a; // Self-assignment must preserve the array and its values.
        assert(a.size() == 3);
        assert(a[0] == 10.0 && a[1] == 20.0 && a[2] == 30.0);

        Buffer empty(0);
        Buffer empty_copy = empty;
        assert(empty_copy.size() == 0);
        c = empty;
        assert(c.size() == 0);
        c = a;
        assert(c.size() == 3 && c[2] == 30.0);

        std::vector<Buffer> buffers;
        buffers.push_back(a);
        buffers.push_back(b);
        const auto old_capacity = buffers.capacity();
        // Request more than the current capacity to guarantee reallocation.
        buffers.reserve(old_capacity + 1);
        assert(buffers.capacity() > old_capacity);
        assert(buffers.size() == 2);
        assert(buffers[0].size() == 3 && buffers[0][0] == 10.0);
        assert(buffers[0][1] == 20.0 && buffers[0][2] == 30.0);
        assert(buffers[1].size() == 3 && buffers[1][0] == 99.0);
        assert(buffers[1][1] == 20.0 && buffers[1][2] == 30.0);
        buffers[0][0] = 77.0;
        assert(a[0] == 10.0 && buffers[1][0] == 99.0);

        std::cout << label << ": vector capacity " << old_capacity
                  << " -> " << buffers.capacity() << '\n';
    } // All arrays are destroyed here; ASan also checks their release.
    std::cout << label << ": all checks passed\n";
}

int main() {
    run_tests<RawBuffer>("RawBuffer");
    run_tests<UniqueBuffer>("UniqueBuffer");
}
