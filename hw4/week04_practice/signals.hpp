#pragma once
#include <string>

static int live = 0;

struct Signal {
    virtual ~Signal() = default;

    virtual double evaluate(double bid, double ask, double obi) = 0;
};

struct SpreadSignal : Signal {
    SpreadSignal() { ++live; }
    ~SpreadSignal() override { --live; }

    double evaluate(double bid, double ask, double obi) override {
        return (ask - bid) * obi;
    }
};

struct MidpointSignal : Signal {
    std::string tag = "midpoint-signal-with-a-long-label-for-the-destructor-exercise";

    MidpointSignal() { ++live; }
    ~MidpointSignal() override { --live; }

    double evaluate(double bid, double ask, double obi) override {
        return (bid + ask) / 2.0 + obi;
    }
};
