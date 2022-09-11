# keep() and discard() require predicate functions

    Code
      keep(1:3, ~NA)
    Condition
      Error in `keep()`:
      ! `.p()` must return a single `TRUE` or `FALSE`, not `NA`.

---

    Code
      discard(1:3, ~ 1:3)
    Condition
      Error in `discard()`:
      ! `.p()` must return a single `TRUE` or `FALSE`, not an integer vector.

