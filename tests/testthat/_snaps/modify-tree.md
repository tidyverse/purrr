# validates inputs

    Code
      modify_tree(list(), is_leaf = ~1)
    Condition
      Error in `modify_tree()`:
      ! `is_leaf()` must return a single `TRUE` or `FALSE`, not a number.
    Code
      modify_tree(list(), is_leaf = 1)
    Condition
      Error in `modify_tree()`:
      ! Can't convert `is_leaf`, a number, to a function.

