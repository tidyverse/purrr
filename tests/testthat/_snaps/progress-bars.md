# useful for bad progress spec

    Code
      map(1, .progress = 1)
    Condition
      Error in `map()`:
      ! `.progress` must be TRUE, FALSE, a string, or a named list, not the number 1.

---

    Code
      reduce(1:4, `+`, .progress = 1)
    Condition
      Error in `reduce()`:
      ! `.progress` must be TRUE, FALSE, a string, or a named list, not the number 1.

