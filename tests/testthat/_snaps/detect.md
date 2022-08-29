# `.right` argument is retired

    Code
      . <- detect(1:2, ~TRUE, .right = TRUE)
    Condition
      Warning:
      The `.right` argument of `detect()` is deprecated as of purrr 0.3.0.
      Please use the `.dir` argument instead.
    Code
      . <- detect_index(1:2, ~TRUE, .right = TRUE)
    Condition
      Warning:
      The `.right` argument of `detect_index()` is deprecated as of purrr 0.3.0.
      Please use the `.dir` argument instead.

