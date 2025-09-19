# keep() and discard() require predicate functions

    Code
      keep(1:3, ~NA)
    Condition
      Error in `keep()`:
      i In .x[[1]]
      Caused by error:
      ! `.p()` must return a single `TRUE` or `FALSE`, not `NA`.
    Code
      discard(1:3, ~NA)
    Condition
      Error in `discard()`:
      i In .x[[1]]
      Caused by error:
      ! `.p()` must return a single `TRUE` or `FALSE`, not `NA`.

