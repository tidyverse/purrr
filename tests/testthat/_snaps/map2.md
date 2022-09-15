# verifies result types and length

    Code
      map2_int(1, 1, ~"x")
    Condition
      Error:
      ! Can't coerce element 1 from a character to a integer
    Code
      map2_int(1, 1, ~ 1:2)
    Condition
      Error in `map2_int()`:
      ! Result 1 must have length 1, not 2.

# requires vector inputs

    Code
      map2(environment(), "a", identity)
    Condition
      Error in `map2()`:
      ! `.x` must be a vector, not an environment.
    Code
      map2("a", environment(), "a", identity)
    Condition
      Error in `map2()`:
      ! `.y` must be a vector, not an environment.

# recycles inputs

    Code
      map2(1:2, 1:3, `+`)
    Condition
      Error in `map2()`:
      ! Mapped vectors must have consistent lengths:
      * `.x` has length 2
      * `.y` has length 3
    Code
      map2(1:2, integer(), `+`)
    Condition
      Error in `map2()`:
      ! Mapped vectors must have consistent lengths:
      * `.x` has length 2
      * `.y` has length 0

