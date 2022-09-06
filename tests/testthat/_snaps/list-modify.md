# error if inputs are not all named or unnamed

    Code
      list_modify(list(a = 1), 2, a = 2)
    Condition
      Error in `list_recurse()`:
      ! `...` arguments must be either all named, or all unnamed

# errors on names are duplicated

    Code
      list_modify(list(x = 1), x = 2, x = 3)
    Condition
      Error in `list_modify()`:
      ! Arguments in `...` must have unique names.
      x Multiple arguments named `x` at positions 1 and 2.

# list_merge errors on duplicated names

    Code
      list_merge(list(x = 1), x = 2, x = 3)
    Condition
      Error in `list_merge()`:
      ! Arguments in `...` must have unique names.
      x Multiple arguments named `x` at positions 1 and 2.

# update_list() is deprecated

    Code
      . <- update_list(list())
    Condition
      Warning:
      `update_list()` was deprecated in purrr 0.4.0.

