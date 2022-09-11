# map_if requires predicate functions

    Code
      map_if(1:3, ~NA, ~"foo")
    Condition
      Error in `map_if()`:
      ! `.p()` must return a single `TRUE` or `FALSE`, not `NA`.

# map_depth modifies values at specified depth

    Code
      map_depth(x1, -5, length)
    Condition
      Error in `map_depth()`:
      ! `Negative `.depth` must be smaller that `pluck_depth(.x)`

---

    Code
      map_depth(x1, "x", length)
    Condition
      Error in `map_depth()`:
      ! `.depth` must be a single number, not a string.

