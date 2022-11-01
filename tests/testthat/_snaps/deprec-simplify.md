# simplify functions are deprecated

    Code
      x <- simplify(list())
    Condition
      Warning:
      `simplify()` was deprecated in purrr 1.0.0.
      i Please use `list_simplify(strict = FALSE)` instead.
    Code
      x <- simplify_all(list())
    Condition
      Warning:
      `simplify_all()` was deprecated in purrr 1.0.0.
      i Please use `map(xs, \(x) list_simplify(strict = FALSE))` instead.
    Code
      x <- as_vector(list())
    Condition
      Warning:
      `as_vector()` was deprecated in purrr 1.0.0.
      i Please use `list_simplify()` instead.

