# partial() squashes quosures before printing

    Code
      foo
    Output
      <partialised>
      function (...) 
      foo(y = 3, ...)

# `.lazy`, `.env`, and `.first` are soft-deprecated

    Code
      . <- partial(list, "foo", .lazy = TRUE)
    Condition
      Warning:
      The `.lazy` argument of `partial()` is deprecated as of purrr 0.3.0.
    Code
      . <- partial(list, "foo", .env = env())
    Condition
      Warning:
      The `.env` argument of `partial()` is deprecated as of purrr 0.3.0.
    Code
      . <- partial(list, "foo", .first = TRUE)
    Condition
      Warning:
      The `.first` argument of `partial()` is deprecated as of purrr 0.3.0.

# checks inputs

    Code
      partial(1)
    Condition
      Error in `partial()`:
      ! `.f` must be a function, not a number.

