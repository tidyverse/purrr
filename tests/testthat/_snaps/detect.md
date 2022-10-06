# `detect()` requires a predicate function

    Code
      detect(list(1:2, 2), is.na)
    Condition
      Error in `detect()`:
      ! `.f()` must return a single `TRUE` or `FALSE`, not a logical vector.

---

    Code
      detect_index(list(1:2, 2), is.na)
    Condition
      Error in `detect_index()`:
      ! `.f()` must return a single `TRUE` or `FALSE`, not a logical vector.

# `.right` argument is retired

    Code
      . <- detect(1:2, ~TRUE, .right = TRUE)
    Condition
      Warning:
      The `.right` argument of `detect()` is deprecated as of purrr 0.3.0.
      i Please use the `.dir` argument instead.
    Code
      . <- detect_index(1:2, ~TRUE, .right = TRUE)
    Condition
      Warning:
      The `.right` argument of `detect_index()` is deprecated as of purrr 0.3.0.
      i Please use the `.dir` argument instead.

