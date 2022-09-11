# modify_at requires a named object

    Code
      modify_at(x, "x", toupper)
    Condition
      Error in `modify_at()`:
      ! Character `.at` must be used with a named `x`.

# modify_at operates on character and numeric indexing

    Code
      modify_at(x, mean, toupper)
    Condition
      Error in `modify_at()`:
      ! `.at` must be a character or numeric vector, not a function.

# modify_if() requires predicate functions

    Code
      modify_if(list(1, 2), ~NA, ~"foo")
    Condition
      Error in `modify_if()`:
      ! `.p()` must return a single `TRUE` or `FALSE`, not `NA`.

---

    Code
      modify_if(1:2, ~ c(TRUE, FALSE), ~"foo")
    Condition
      Error in `modify_if_atomic()`:
      ! `.p()` must return a single `TRUE` or `FALSE`, not a logical vector.

# modify_depth modifies values at specified depth

    Code
      modify_depth(x1, 5, length)
    Condition
      Error in `modify_depth_rec()`:
      ! `.x` not deep enough for specified `.depth`.

---

    Code
      modify_depth(x1, -5, length)
    Condition
      Error in `modify_depth_rec()`:
      ! Invalid depth

