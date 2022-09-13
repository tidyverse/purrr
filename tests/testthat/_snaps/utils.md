# rdunif and rbernoulli are deprecated

    Code
      . <- rdunif(10, 1)
    Condition
      Warning:
      `rdunif()` was deprecated in purrr 1.0.0.
    Code
      . <- rbernoulli(10)
    Condition
      Warning:
      `rbernoulli()` was deprecated in purrr 1.0.0.

# using tidyselect in .at is deprecated

    Code
      . <- at_selection(letters, vars("x"))
    Condition
      Warning:
      using `vars()` in .at was deprecated in purrr 1.0.0.

