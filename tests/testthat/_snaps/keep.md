# keep() and discard() require predicate functions

    Code
      keep(1:3, ~NA)
    Condition
      Error in `.f()`:
      ! Predicate functions must return a single `TRUE` or `FALSE`, not a missing value.
    Code
      discard(1:3, ~NA)
    Condition
      Error in `.f()`:
      ! Predicate functions must return a single `TRUE` or `FALSE`, not a missing value.

