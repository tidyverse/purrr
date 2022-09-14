# head_while and tail_while require predicate function

    Code
      head_while(1:3, ~NA)
    Condition
      Error in `head_while()`:
      ! `.p()` must return a single `TRUE` or `FALSE`, not `NA`.

---

    Code
      tail_while(1:3, ~ c(TRUE, FALSE))
    Condition
      Error in `tail_while()`:
      ! `.p()` must return a single `TRUE` or `FALSE`, not a logical vector.

