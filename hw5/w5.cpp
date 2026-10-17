// HW5: generic rolling statistics over simple returns from a price series.
#include <algorithm>
#include <cmath>
#include <cstddef>
#include <cstdio>
#include <iterator>
#include <numeric>
#include <stdexcept>
#include <type_traits>
#include <vector>

template <class T>
class RingStat {
    static_assert(std::is_arithmetic_v<T> && !std::is_same_v<T, bool>,
                  "RingStat requires a numeric, non-bool value type");

public:
    explicit RingStat(std::size_t window) : window_(window) {
        if (window == 0) throw std::invalid_argument("window must be positive");
        values_.reserve(window);
    }

    // Once full, replace the oldest observation without growing the vector.
    void push(T value) {
        if (values_.size() < window_) {
            values_.push_back(value);
        } else {
            values_[next_] = value;
        }
        next_ = (next_ + 1) % window_;
    }

    bool full() const { return values_.size() == window_; }

    double mean() const {
        require_data();
        const double total = std::accumulate(values_.begin(), values_.end(), 0.0);
        return total / static_cast<double>(values_.size());
    }

    double median() const {
        require_data();
        std::vector<T> sorted = values_;
        std::sort(sorted.begin(), sorted.end());
        const std::size_t n = sorted.size();
        if (n % 2 != 0) return static_cast<double>(sorted[n / 2]);
        return (static_cast<double>(sorted[n / 2 - 1]) +
                static_cast<double>(sorted[n / 2])) / 2.0;
    }

    double population_stddev() const {
        require_data();
        const double average = mean();
        std::vector<double> squared(values_.size());
        std::transform(values_.begin(), values_.end(), squared.begin(),
                       [average](T value) {
                           const double delta = static_cast<double>(value) - average;
                           return delta * delta;
                       });
        const double sum_squares = std::accumulate(squared.begin(), squared.end(), 0.0);
        return std::sqrt(sum_squares / static_cast<double>(values_.size()));
    }

private:
    void require_data() const {
        if (values_.empty()) throw std::logic_error("statistics need observations");
    }

    std::size_t window_;
    std::size_t next_ = 0;
    std::vector<T> values_;
};

// SFINAE limits price returns to floating-point types; integer division would be wrong.
template <class T, std::enable_if_t<std::is_floating_point_v<T>, int> = 0>
std::vector<T> simple_returns(const std::vector<T>& prices) {
    if (prices.size() < 2) throw std::invalid_argument("need at least two prices");
    if (!std::all_of(prices.begin(), prices.end(),
                     [](T price) { return std::isfinite(price) && price > 0; })) {
        throw std::invalid_argument("prices must be positive and finite");
    }

    std::vector<T> returns;
    returns.reserve(prices.size() - 1);
    std::transform(prices.begin() + 1, prices.end(), prices.begin(),
                   std::back_inserter(returns),
                   [](T current, T previous) { return current / previous - T{1}; });
    return returns;
}

// A variadic fold adds any nonempty pack of arithmetic arguments.
template <class... Ts, std::enable_if_t<(std::is_arithmetic_v<Ts> && ...), int> = 0>
auto sum(Ts... values) {
    static_assert(sizeof...(Ts) > 0, "sum needs at least one argument");
    return (values + ...);
}

int main() {
    const std::vector<double> prices{100.0, 101.0, 100.0, 102.0, 101.0, 103.0};
    constexpr std::size_t window = 3;
    const auto returns = simple_returns(prices);
    RingStat<double> rolling(window);

    std::printf("prices: 100, 101, 100, 102, 101, 103\n");
    std::printf("simple return = current / previous - 1; rolling window = %zu\n", window);
    std::printf("end_price  return      mean        median      population_stddev\n");
    for (std::size_t i = 0; i < returns.size(); ++i) {
        rolling.push(returns[i]);
        if (rolling.full()) {
            std::printf("%9.2f  %+10.6f  %+10.6f  %+10.6f  %.6f\n",
                        prices[i + 1], returns[i], rolling.mean(),
                        rolling.median(), rolling.population_stddev());
        }
    }
    std::printf("sum(1,2,3,4)=%d; sum(1,2.5,3)=%.1f\n",
                sum(1, 2, 3, 4), sum(1, 2.5, 3));
}
