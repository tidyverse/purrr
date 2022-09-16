# validates inputs

    Code
      rmodify(mean, identity)
    Condition
      Error in `rmodify()`:
      ! `x` must be a vector, not a function.
    Code
      rmodify(list(), p_leaf = ~1)
    Condition
      Error in `rmodify()`:
      ! `p_leaf()` must return a single `TRUE` or `FALSE`, not a number.

