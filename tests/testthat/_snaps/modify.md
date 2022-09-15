# modify_if() requires predicate functions

    Code
      modify_if(list(1, 2), ~NA, ~"foo")
    Condition
      Error in `map_lgl()`:
      ! Computation failed in index 1
      Caused by error in `modify_if()`:
      ! `.p()` must return a single `TRUE` or `FALSE`, not `NA`.

---

    Code
      modify_if(1:2, ~ c(TRUE, FALSE), ~"foo")
    Condition
      Error in `map_lgl()`:
      ! Computation failed in index 1
      Caused by error in `modify_if()`:
      ! `.p()` must return a single `TRUE` or `FALSE`, not a logical vector.
