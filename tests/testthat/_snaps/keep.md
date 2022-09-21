# keep() and discard() require predicate functions

    Code
      keep(1:3, ~NA)
    Condition
      Error in `map_lgl()`:
      ! Can't compute index 1.
      Caused by error in `keep()`:
      ! `.p()` must return a single `TRUE` or `FALSE`, not `NA`.
    Code
      discard(1:3, ~NA)
    Condition
      Error in `map_lgl()`:
      ! Can't compute index 1.
      Caused by error in `discard()`:
      ! `.p()` must return a single `TRUE` or `FALSE`, not `NA`.

