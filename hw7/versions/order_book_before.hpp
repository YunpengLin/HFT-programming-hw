#pragma once

#include <algorithm>
#include <array>
#include <cmath>
#include <cstddef>
#include <cstdint>
#include <cstring>
#include <limits>
#include <unordered_map>
#include <vector>

// Week 7 fill-in-the-blank exercise. The exercise uses the same public interface.
// Prices are nonnegative, on a $0.01 grid, and fit in an int tick.
// Duplicate order ids replace the old order. Invalid inputs are ignored.
struct Book {
    static constexpr double TICK = 0.01;
    static constexpr int NLEV = 1 << 16;

private:
    struct Rec { char side; int slot; std::uint32_t qty; };

    // Heap-backed, contiguous arrays avoid putting a large Book on the stack.
    // Aggregate in 64 bits: multiple uint32_t orders can share one level.
    std::vector<std::uint64_t> bid_qty_ = std::vector<std::uint64_t>(NLEV, 0);
    std::vector<std::uint64_t> ask_qty_ = std::vector<std::uint64_t>(NLEV, 0);
    std::unordered_map<std::uint64_t, Rec> orders_;
    int base_tick_ = 0;
    bool based_ = false;
    int best_bid_slot_ = -1;
    int best_ask_slot_ = -1;

    static bool to_tick(double px, int& tick) {
        if (!std::isfinite(px) || px < 0.0) return false;
        // [01] Round instead of truncating a floating-point division.
        const double rounded =  std::round(px / TICK);
        if (rounded > static_cast<double>(std::numeric_limits<int>::max()))
            return false;
        tick = static_cast<int>(rounded);
        return true;
    }

    int slot_of(int tick) {
        if (!based_) {
            // [02] Centre the band on the first accepted price.
            base_tick_ = std::max(0, tick - NLEV / 2);
            based_ = true;
        }
        // [03] Convert an absolute tick into a slot within the band.
        return tick - base_tick_;
    }

    double px_of(int slot) const {
        return (static_cast<double>(base_tick_) + slot) * TICK;
    }

public:
    void add(std::uint64_t id, char side, double px, std::uint32_t qty) {
        int tick = 0;
        if ((side != 'B' && side != 'S') || qty == 0 || !to_tick(px, tick))
            return;
        const int slot = slot_of(tick);
        // [04] Reject out-of-band prices before accessing either array.
        if (slot < 0 || slot >= NLEV) return;

        // [05] Reusing an id must remove the old quantity first.
        cancel(id);
        // [06] Remember everything needed to cancel this order later.
        orders_[id] = Rec{side, slot, qty};
        if (side == 'B') {
            // [07] Aggregate all orders at this price level.
            bid_qty_[slot] += qty;
            // [08] A higher bid improves the best bid.
            if ( slot > best_bid_slot_) best_bid_slot_ = slot;
        } else {
            // [09] Aggregate the ask side independently.
            ask_qty_[slot] += qty;
            // [10] A lower ask improves the best ask; -1 means empty.
            if (slot < best_ask_slot_ || best_ask_slot_ == -1) best_ask_slot_ = slot;
        }
    }

    void cancel(std::uint64_t id) {
        // [11] Find the order by id, rather than scanning price levels.
        const auto it = orders_.find(id);
        // [12] Cancelling a missing id is a no-op.
        if (it == orders_.end()) return;
        const Rec r = it->second;  // copy before erasing the record
        orders_.erase(it);
        if (r.side == 'B') {
            // [13] Remove only this order's contribution.
            bid_qty_[r.slot] -= r.qty;
            // [14] Search only if the current best level became empty.
            if (r.slot == best_bid_slot_ && bid_qty_[r.slot] == 0) {
                while (best_bid_slot_ >= 0 && bid_qty_[best_bid_slot_] == 0)
                    // [15] The next possible bid is at a lower price.
                    --best_bid_slot_;
            }
        } else {
            // [16] Remove this order's ask quantity.
            ask_qty_[r.slot] -= r.qty;
            if (r.slot == best_ask_slot_ && ask_qty_[r.slot] == 0) {
                // [17] Bounds check must precede the array access.
                while (best_ask_slot_ < NLEV && ask_qty_[best_ask_slot_] == 0)
                    ++best_ask_slot_;
                // [18] Restore the empty-side sentinel.
                if (best_ask_slot_ == NLEV) best_ask_slot_ = -1;
            }
        }
    }

    double best_bid() const {
        // [19] Pure O(1): no loop, tree search, or hash lookup.
        return  best_bid_slot_ < 0 ? 0.0 : px_of(best_bid_slot_);
    }

    double best_ask() const {
        // [20] Return 0.0 if there are no asks.
        return best_ask_slot_ < 0 ? 0.0 : px_of(best_ask_slot_);
    }
};

// The staged Book exercise can be checked before SymMap is filled in.

struct SymMap {
private:
    static constexpr std::size_t MAX_KEY = 16;
    static constexpr std::uint64_t ABSENT = static_cast<std::uint64_t>(-1);
    struct Slot {
        std::array<char, MAX_KEY + 1> key{}; // 16 characters AND a terminator
        std::uint64_t id = 0;
        bool used = false;
    };
    // Always a power of two. Growth keeps an unused slot available.
    std::vector<Slot> slots_ = std::vector<Slot>(64);
    std::size_t size_ = 0;

    static bool valid_key(const char* sym) {
        if (!sym) return false;
        for (std::size_t i = 0; i <= MAX_KEY; ++i)
            if (sym[i] == '\0') return true;
        return false;
    }

    static std::uint64_t hash(const char* sym) {
        std::uint64_t h = 14695981039346656037ull; // FNV-1a offset basis
        for (; *sym; ++sym) {
            // [21] Mix the next byte into the hash.
            h ^= static_cast<std::uint64_t>(*sym);
            // [22] FNV-1a's 64-bit prime; unsigned overflow is intentional.
            h *= 1099511628211ull;
        }
        return h;
    }

    // Return the matching slot, the first empty slot, or size() if full.
    std::size_t find_slot(const char* sym) const {
        // [23] Masking is valid because capacity is a power of two.
        const std::size_t mask =  slots_.size() - 1;
        std::size_t i = static_cast<std::size_t>(hash(sym)) & mask;
        for (std::size_t probes = 0; probes < slots_.size(); ++probes) {
            if (!slots_[i].used) return i;
            // [24] Equal hash positions do not imply equal keys.
            if (std::strncmp(slots_[i].key.data(), sym, MAX_KEY + 1) == 0) return i;
            // [25] Linear probing with wraparound.
            i = (i + 1) & mask;
        }
        return slots_.size();
    }

    // Plumbing supplied in the exercise: rehash only on the write path.
    void grow() {
        std::vector<Slot> expanded(slots_.size() * 2);
        const std::size_t mask = expanded.size() - 1;
        for (const Slot& old : slots_) {
            if (!old.used) continue;
            std::size_t i = static_cast<std::size_t>(hash(old.key.data())) & mask;
            while (expanded[i].used) i = (i + 1) & mask;
            expanded[i] = old;
        }
        slots_.swap(expanded);
    }

public:
    void put(const char* sym, std::uint64_t id) {
        if (!valid_key(sym)) return;
        std::size_t i = find_slot(sym);
        if (i < slots_.size() && slots_[i].used) {
            // [26] Existing symbol: overwrite without increasing size_.
            slots_[i].id = id;
            return;
        }
        // [27] Keep load factor below 70%, rather than filling every slot.
        if (size_ >= slots_.size() * 0.7) {
            grow();
            i = find_slot(sym); // the hash position changed with capacity
        }
        // [28] Copy the terminator too; key storage has 17 bytes.
        std::strncpy(slots_[i].key.data(), sym, MAX_KEY + 1);
        slots_[i].id = id;
        slots_[i].used = true;
        ++size_;
    }

    std::uint64_t get(const char* sym) const {
        if (!valid_key(sym)) return ABSENT;
        const std::size_t i = find_slot(sym);
        // [29] An unused slot ends an unsuccessful search.
        if (i == slots_.size() || !slots_[i].used) return  ABSENT;
        // [30] find_slot already verified the full key.
        return slots_[i].id;
    }
};

