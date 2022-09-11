# head_while and tail_while require predicate function

    Code
      head_while(1:3, ~NA)
    Condition
      Error in `detect_index()`:
      ! `.p()` must return a single `TRUE` or `FALSE`, not `NA`.

---

    Code
      tail_while(1:3, ~ c(TRUE, FALSE))
    Condition
      Error in `detect_index()`:
      ! `.p()` must return a single `TRUE` or `FALSE`, not a logical vector.

