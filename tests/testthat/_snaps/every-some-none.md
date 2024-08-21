# every() requires logical value

    Code
      every(list(1:3), identity)
    Condition
      Error in `every()`:
      ! `.p()` must return a single `TRUE` or `FALSE`, not an integer vector.

---

    Code
      every(list(function() NULL), identity)
    Condition
      Error in `every()`:
      ! `.p()` must return a single `TRUE` or `FALSE`, not a function.

