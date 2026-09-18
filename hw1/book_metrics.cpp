#include <cmath>
#include <cstdio>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <stdexcept>
#include <string>
#include <utility>
#include <vector>


using namespace std;

struct Level {
    double px;  // price ( ask or bid)
    double sz;  // size
};

struct Snapshot {
    string timestamp;
    vector<Level> bids; // not fixed length, can have multiple levels
    vector<Level> asks;
};

struct Metrics { double mid, spread, micro, obi; };


Metrics compute(double bp, double bs, double ap, double as) 
// bp: best bid price, bs: best bid size, ap: best ask price, as: best ask size
{
    // A locked or crossed book does not have a valid positive spread. Reject it
    // instead of returning a zero/negative spread that could be used as normal data.
    // sanity check
    if (ap-bp <= 0.0) {
        throw invalid_argument("best ask must be greater than best bid");
    }

    if (bs<= 0.0 || as <= 0.0) {
        throw invalid_argument("both best-level size must be positive");
    }

    Metrics m;
    m.mid    = (bp + ap) / 2.0;              // mid price
    m.spread = ap - bp;                      // spread
    m.micro  = (ap * bs + bp * as) / (bs + as); // microprice
    m.obi    = (bs - as) / (bs + as);        // order-book imbalance
    return m;
};

// read snapshot from input stream, assume bid before ask
bool readSnapshot(istream& input, Snapshot& snapshot) 
{

    input >> ws; // skip whitespace
    // check if we are at the end of the file
    if (input.peek() == istream::traits_type::eof()) { 
        return false; // exit
    }

    string label;
    long long count; // the number of bids/asks in the snapshot
    Snapshot parsed;
 

    // read：snapshot 09:30:00.000
    if (!(input >> label >> parsed.timestamp) || label != "snapshot") {
        cerr << "Invalid snapshot header\n";
        return false;
    }

    // read：bids 3 
    if (!(input >> label >> count) ||
        label != "bids" ||
        count < 0) {
        cerr << "Invalid bids header\n";
        return false;
    }

    parsed.bids.reserve(static_cast<size_t>(count));

    for (long long i = 0; i < count; ++i) {
        Level level;

        if (!(input >> level.px >> level.sz)) {
            cerr << "Failed to read bid level " << i << '\n';
            return false;
        }

        parsed.bids.push_back(level); // add new bid level to the vector of bids
    }

    // read：asks 3
    if (!(input >> label >> count) ||
        label != "asks" ||
        count < 0) {
        cerr << "Invalid asks header\n";
        return false;
    }

    parsed.asks.reserve(static_cast<size_t>(count));

    for (long long i = 0; i < count; ++i) {
        Level level;

        if (!(input >> level.px >> level.sz)) {
            cerr << "Failed to read ask level " << i << '\n';
            return false;
        }

        parsed.asks.push_back(level); // add new ask level to the vector of asks
    }

    // only if you read a complete snapshot, overwrite the caller's object.

    snapshot = move(parsed);
    return true;
}

int main()
{
    
    ifstream input("snapshots.txt");

    if (!input) {
        cerr << "Cannot open snapshots.txt\n";
        return 1;
    }

    // save all snapshots
    vector<Snapshot> snapshots; // a vector of snapshots, 
    // each snapshot contains a vector of bids and a vector of asks

    Snapshot snapshot;

    while (readSnapshot(input, snapshot)) {
        snapshots.push_back(snapshot);
    }

    if (input.bad()) {
        cerr << "Stopped because snapshots.txt has invalid or incomplete data\n";
        return 1;
    }

    cout << "Read " << snapshots.size()
         << " snapshots\n";

    cout << fixed << setprecision(4); // set the output format 

    for (const Snapshot& current : snapshots) { // iterate through each snapshot
        if (current.bids.empty() || current.asks.empty()) { // sanity check: empty bids or asks
            cerr << "Cannot compute metrics for snapshot "
                 << current.timestamp
                 << ": bids or asks are empty\n";
            continue;
        }

        // Bid/ask levels may be stored in any order.
        // Best bid is the highest bid price.
        const Level* bestBid = &current.bids[0];
        for (const Level& level : current.bids) { //sort
            if (level.px > bestBid->px) {
                bestBid = &level;
            }
        }

        // Best ask is the lowest ask price.
        const Level* bestAsk = &current.asks[0];
        for (const Level& level : current.asks) {
            if (level.px < bestAsk->px) {
                bestAsk = &level;
            }
        }

        Metrics metrics;
        try {
            metrics = compute(bestBid->px, bestBid->sz,
                              bestAsk->px, bestAsk->sz);
        } catch (const invalid_argument& error) {
            cerr << "Cannot compute metrics for snapshot "
                 << current.timestamp << ": " << error.what() << '\n';
            continue;
        }

        cout << "snapshot " << current.timestamp
             << " bestBid=" << bestBid->px << " @ " << bestBid->sz
             << " bestAsk=" << bestAsk->px << " @ " << bestAsk->sz
             << " mid=" << metrics.mid
             << " spread=" << metrics.spread
             << " micro=" << metrics.micro
             << " obi=" << metrics.obi
             << '\n';
    }

    return 0;
}
