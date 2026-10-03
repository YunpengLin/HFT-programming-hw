// Part 4: pool replacement sketch. 
//
// Before:
//   for (int i = 0; i < 100000; ++i) {
//       auto order = std::make_shared<Order>(i, 101.5);
//       process(*order);
//   }
//
// After (pseudocode):
//   At startup, create a Pool member owned by the long-lived trading engine.
//   Preallocate one buffer with 4096 slots and a free-list.
//   Each slot must fit sizeof(Order) and satisfy alignof(Order).
//   Pool::alloc() and Pool::free() pop/push the free-list in O(1), without
//   calling the heap allocator. The pool outlives every outstanding order.
//
//   for (int i = 0; i < 100000; ++i) {
//       void* slot = pool.alloc();
//       if (slot == nullptr) {
//           continue; //  skip this order when the pool is full.
//       }
//
//       Order* order = new (slot) Order(i, 101.5); // Placement new, no heap call.
//       process(*order);
//       order->~Order(); // End the object's lifetime without deleting the slot.
//       pool.free(slot); // Return the storage for reuse on the next iteration.
//   }
//
// The sketch assumes Order construction and process do not throw,
// and process is synchronous and does not retain the object's address. 
//
// For early returns or exceptions, add a non-copyable slot guard immediately
// after alloc(). It stores the slot and an initially null Order pointer. Set
// that pointer only after placement construction succeeds. Its noexcept
// destructor destroys the Order if constructed, then always returns the slot.
// Thus constructor failure returns the slot without destroying an unconstructed
// Order, and a later return/throw destroys and releases a constructed Order.
// Remove the explicit destructor/free above when the guard owns cleanup.
//
// If processing is asynchronous, transfer the slot's ownership to the consumer
// and return it only after the last consumer finishes. Never recycle a slot
// while another task can still access its Order. Use a pool concurrency policy
// appropriate to those consumers; this sketch assumes single-thread access.
//
// Heap allocation can contend on allocator locks or incur page faults. These
// occasional stalls increase p99.9 more than p50; preallocation removes that
// per-order source of variable latency. No tail-latency claim is measured here.
