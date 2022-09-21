# validates inputs

    Code
      modify_tree(mean, identity)
    Condition
      Error in `modify_tree()`:
      ! `x` must be a vector, not a function.
    Code
      modify_tree(list(), p_leaf = ~1)
    Condition
      Error in `modify_tree()`:
      ! `p_leaf()` must return a single `TRUE` or `FALSE`, not a number.

