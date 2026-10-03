#include <cstdio>
#include <memory>
#include <string_view>

struct Order {
    int id;
    double px;

    Order(int i, double p) : id(i), px(p) {}
    ~Order() { std::printf("~Order %d\n", id); }
};

bool risk_ok(double px) { return px < 1000.0; }

// Negative control: the rejected order intentionally leaks on the early return.
void handle_raw(double px) {
    Order* o = new Order(1, px);
    if (!risk_ok(o->px)) return;
    std::printf("sent order %d @ %.2f\n", o->id, o->px);
    delete o;
}

// Construct directly in the owned heap allocation, without a temporary Order.
void handle_unique(double px) {
    auto o = std::make_unique<Order>(2, px);
    if (!risk_ok(o->px)) return; 
    std::printf("sent order %d @ %.2f\n", o->id, o->px);
} // The Order is destroyed on both the accepted and rejected paths.

class OrderGuard {
public:
    explicit OrderGuard(Order* owned) noexcept : owned_(owned) {}
    ~OrderGuard() noexcept { delete owned_; }

    // A single guard owns the Order and is responsible for releasing it.
    OrderGuard(const OrderGuard&) = delete;
    OrderGuard& operator=(const OrderGuard&) = delete;
    OrderGuard(OrderGuard&&) = delete;
    OrderGuard& operator=(OrderGuard&&) = delete;

    // Return a non-owning observer; ownership remains with this guard.
    Order* get() const noexcept { return owned_; }

private:
    Order* owned_;
};

void handle_guard(double px) {
    OrderGuard guard(new Order(3, px));
    Order* o = guard.get();
    if (!risk_ok(o->px)) return;
    std::printf("sent order %d @ %.2f\n", o->id, o->px);
}

int main(int argc, char** argv) {
    const std::string_view mode = argc > 1 ? argv[1] : "fixed";
    if (argc > 2 || (mode != "raw" && mode != "unique" &&
                     mode != "guard" && mode != "fixed")) {
        std::fprintf(stderr, "Usage: %s [raw|unique|guard|fixed]\n", argv[0]);
        return 2;
    }
    if (mode == "raw") {
        std::puts("-- raw (intentional leak) --");
        handle_raw(2000.0);
        handle_raw(100.0);
    }
    if (mode == "unique" || mode == "fixed") {
        std::puts("-- unique_ptr --");
        handle_unique(2000.0);
        handle_unique(100.0);
    }
    if (mode == "guard" || mode == "fixed") {
        std::puts("-- custom RAII guard --");
        handle_guard(2000.0);
        handle_guard(100.0);
    }
}
