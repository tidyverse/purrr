# modify_at requires a named object

    Code
      modify_at(list(), "x", toupper)
    Condition
      Error in `vec_as_location()`:
      ! Can't use character names to index an unnamed vector.

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
      Error in `modify_if()`:
      ! `.p()` must return a single `TRUE` or `FALSE`, not a logical vector.

