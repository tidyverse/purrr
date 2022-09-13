# list_modify() validates inputs

    Code
      list_modify(1:3)
    Condition
      Error in `list_modify()`:
      ! `.x` must be a list, not an integer vector.

---

    Code
      list_modify(list(a = 1), 2, a = 2)
    Condition
      Error in `list_modify()`:
      ! `...` arguments must be either all named or all unnamed.

---

    Code
      list_modify(list(x = 1), x = 2, x = 3)
    Condition
      Error in `list_modify()`:
      ! Arguments in `...` must have unique names.
      x Multiple arguments named `x` at positions 1 and 2.

# merge() validates inputs

    Code
      list_merge(1:3)
    Condition
      Error in `list_merge()`:
      ! `.x` must be a list, not an integer vector.

---

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
      `update_list()` was deprecated in purrr 1.0.0.

