# validates inputs

    Code
      modify_tree(list(), is_node = ~1)
    Condition
      Error in `modify_tree()`:
      ! `is_node()` must return a single `TRUE` or `FALSE`, not a number.
    Code
      modify_tree(list(), is_node = 1)
    Condition
      Error in `modify_tree()`:
      ! Can't convert `is_node`, a double vector, to a function.

