# map_if requires predicate functions

    Code
      map_if(1:3, ~NA, ~"foo")
    Condition
      Error in `map_if()`:
      ! `.p()` must return a single `TRUE` or `FALSE`, not `NA`.

