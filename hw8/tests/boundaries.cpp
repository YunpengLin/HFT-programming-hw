#include "rolling_counter.hpp"
#include <iostream>

int main() {
    bool ok = true;
    auto check = [&](const char* name, bool pass) {
        std::cout << "RESULT|" << name << '|' << (pass ? "pass" : "fail")
                  << "|boundary correctness\n";
        ok &= pass;
    };
    RollingCounter rc(1000);
    rc.add(0);
    check("early_zero", rc.count(999) == 1);
    check("equal_window", rc.count(1000) == 0);
    rc.add(1000); rc.add(1000);
    check("duplicate_and_repeated_clock", rc.count(1000) == 2 && rc.count(1000) == 2);
    check("strict_cutoff", rc.count(2000) == 0);
    RollingCounter zero(0);
    zero.add(0);
    check("zero_window", zero.count(0) == 0);
    return ok ? 0 : 1;
}
