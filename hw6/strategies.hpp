#pragma once
#include <type_traits>

// HW4's on_book interface, with dispatch resolved from the derived type.
template <class Derived>
struct Strategy {
    double on_book(double bid, double ask, double obi) {
        return static_cast<Derived*>(this)->on_book_impl(bid, ask, obi);
    }
};

// S0-S3 preserve the formulas from HW4's virtual Strategy hierarchy.
struct S0 : Strategy<S0> {
    double on_book_impl(double bid, double ask, double obi) {
        return obi * (ask - bid);
    }
};
struct S1 : Strategy<S1> {
    double on_book_impl(double bid, double ask, double obi) {
        return obi + (ask + bid) / 2.0;
    }
};
struct S2 : Strategy<S2> {
    double on_book_impl(double bid, double ask, double obi) {
        return (ask - bid) - obi;
    }
};
struct S3 : Strategy<S3> {
    double on_book_impl(double bid, double ask, double obi) {
        (void)ask;
        return obi * obi + bid;
    }
};

static_assert(!std::is_polymorphic_v<S0> && !std::is_polymorphic_v<S1> &&
              !std::is_polymorphic_v<S2> && !std::is_polymorphic_v<S3>,
              "CRTP strategies must have no virtual functions");
