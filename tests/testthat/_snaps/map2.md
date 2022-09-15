# map2 can't simplify if elements longer than length 1

    Code
      map2_int(1:4, 5:8, range)
    Condition
      Error in `map2_int()`:
      ! Result must be length 1, not 2

# fails on non-vectors

    Code
      map2(environment(), "a", identity)
    Condition
      Error in `map2()`:
      ! `.x` must be a vector, not an environment.

---

    Code
      map2("a", environment(), identity)
    Condition
      Error in `map2()`:
      ! `.y` must be a vector, not an environment.

# map2 recycles inputs

    Code
      map2(1:2, 1:3, `+`)
    Condition
      Error in `map2()`:
      ! Mapped vectors must have consistent lengths:
      * `.x` has length 2
      * `.y` has length 3

