# map2 can't simplify if elements longer than length 1

    Code
      map2_int(1:4, 5:8, range)
    Condition
      Error in `stop_bad_type()`:
      ! Result 1 must be a single integer, not an integer vector of length 2

# fails on non-vectors

    Code
      map2(environment(), "a", identity)
    Condition
      Error in `purrr:::stop_bad_type()`:
      ! `.x` must be a vector, not an environment

---

    Code
      map2("a", environment(), identity)
    Condition
      Error in `purrr:::stop_bad_type()`:
      ! `.y` must be a vector, not an environment

# map2 recycles inputs

    Code
      map2(1:2, 1:3, `+`)
    Condition
      Error:
      ! Mapped vectors must have consistent lengths:
      * `.x` has length 2
      * `.y` has length 3

