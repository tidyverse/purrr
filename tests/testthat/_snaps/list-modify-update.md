# removing elements with `NULL` is deprecated

    Code
      . <- list_modify(list(1, 2, 3), NULL)
    Condition
      Warning:
      Removing elements with `NULL` was deprecated in purrr 0.3.0.
      Please use `zap()` instead.

