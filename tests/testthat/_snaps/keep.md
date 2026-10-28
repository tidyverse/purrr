# formula deprecation warning shows user call

    Code
      keep(1:3, ~TRUE)
    Condition
      Warning:
      Using a formula was deprecated in purrr 1.3.0.
      i Please use an anonymous function instead.
    Output
      [1] 1 2 3

# keep() and discard() require predicate functions

    Code
      keep(1:3, function(.x) NA)
    Condition
      Error in `keep()`:
      i In index: 1.
      Caused by error:
      ! `.p()` must return a single `TRUE` or `FALSE`, not `NA`.
    Code
      discard(1:3, function(.x) NA)
    Condition
      Error in `discard()`:
      i In index: 1.
      Caused by error:
      ! `.p()` must return a single `TRUE` or `FALSE`, not `NA`.

# passing .f parameter to keep() and discard() results in an error

    Code
      keep(1:5, .f = function(x, ...) x > 3, .p = NULL)
    Condition
      Error in `as_mapper()`:
      ! formal argument ".f" matched by multiple actual arguments
    Code
      discard(1:5, .f = function(x, ...) x > 3, .p = NULL)
    Condition
      Error in `as_mapper()`:
      ! formal argument ".f" matched by multiple actual arguments

