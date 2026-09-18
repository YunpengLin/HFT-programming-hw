# Week 1 Homework: Order Book Metrics

This assignment reads a sequence of order book snapshots and calculates four top-of-book metrics: mid price, bid–ask spread, microprice, and order book imbalance (OBI). The implementation is in `book_metrics.cpp`; the three sample snapshots are in `snapshots.txt`.

## Snapshot data

Each snapshot contains a timestamp, a `bids` section, and an `asks` section. Each section starts with its number of price levels, followed by one `price quantity` pair per level. The sample file has **11 bid levels and 11 ask levels in each snapshot**. These rows represent price levels, not individually identified orders.

Assume the Snapshot data has the following format:


| snapshot | timestamp |
| --- | --- |
| bid | num_of_bids |
| bid_price_1 | bid_quantity_1 |

| ask | num_of_asks |
| ask_price_1 | bid_quantity_1 |

The program selects the highest bid price and the lowest ask price as the best bid and best ask. It reads every level, but the metrics below use only the prices and quantities at those two best levels.

## Metrics

Let `bp` and `bs` be the best bid price and quantity, and `ap` and `as` be the best ask price and quantity.

| Metric | Formula |
| --- | --- |
| Mid price | `(bp + ap) / 2` |
| Spread | `ap - bp` |
| Microprice | `(ap × bs + bp × as) / (bs + as)` |
| OBI | `(bs - as) / (bs + as)` |

A valid snapshot needs positive quantities at both best levels and `ap > bp`. The program reports a snapshot with a locked or crossed best bid and ask as invalid for these calculations.

## Results

The three snapshots show balanced, bid-heavy, and ask-heavy best-level quantities:

| Time | Case | Best bid/ask quantity | Mid | Spread | Microprice | OBI |
| --- | --- | ---: | ---: | ---: | ---: | ---: |
| 09:30:00.000 | Balanced | 500/500 | 100.0100 | 0.0200 | 100.0100 | 0.0000 |
| 09:30:00.100 | Bid-heavy | 900/100 | 100.0100 | 0.0200 | 100.0180 | 0.8000 |
| 09:30:00.200 | Ask-heavy | 100/900 | 100.0200 | 0.0200 | 100.0120 | -0.8000 |

When the best-level quantities are balanced, OBI is zero and microprice equals mid. As OBI rises from `0.0000` to `0.8000`, bid-side quantity becomes larger relative to ask-side quantity, and microprice moves toward the ask. In the final snapshot, OBI falls to `-0.8000` and microprice moves toward the bid. The mid stays at `100.0100` between the first two snapshots, then rises to `100.0200` in the third.
