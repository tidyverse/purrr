# old simplification functions are deprecated

    Code
      . <- as_vector(list(1, 2))
    Condition
      Warning:
      `as_vector()` was deprecated in purrr 1.0.0.
      Please use `list_simplify()` instead.
    Code
      . <- simplify(list(1, 2))
    Condition
      Warning:
      `as_vector()` was deprecated in purrr 1.0.0.
      Please use `list_simplify()` instead.
    Code
      . <- simplify_all(list(1, 2))
    Condition
      Warning:
      `as_vector()` was deprecated in purrr 1.0.0.
      Please use map() + list_simplify() instead.

