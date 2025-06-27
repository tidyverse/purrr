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

