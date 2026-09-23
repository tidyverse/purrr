# detect() and detect_index() require boolean results

    Code
      detect(list(1), function(x) 1)
    Condition
      Error in `detect()`:
      ! `.f()` must return a single `TRUE` or `FALSE`, not the number 1.

---

    Code
      detect_index(list(1), function(x) 1)
    Condition
      Error in `detect_index()`:
      ! `.f()` must return a single `TRUE` or `FALSE`, not the number 1.

---

    Code
      detect(list(1), function(x) NA)
    Condition
      Error in `detect()`:
      ! `.f()` must return a single `TRUE` or `FALSE`, not `NA`.

---

    Code
      detect_index(list(1), function(x) NA)
    Condition
      Error in `detect_index()`:
      ! `.f()` must return a single `TRUE` or `FALSE`, not `NA`.

---

    Code
      detect(list(1), function(x) c(TRUE, FALSE))
    Condition
      Error in `detect()`:
      ! `.f()` must return a single `TRUE` or `FALSE`, not a logical vector.

---

    Code
      detect_index(list(1), function(x) c(TRUE, FALSE))
    Condition
      Error in `detect_index()`:
      ! `.f()` must return a single `TRUE` or `FALSE`, not a logical vector.

# detect() and detect_index() require vector `.x`

    Code
      detect(function() 1, identity)
    Condition
      Error in `detect()`:
      ! `.x` must be a vector, not a function.
      i Read our FAQ about scalar types (`?vctrs::faq_error_scalar_type`) to learn more.

---

    Code
      detect_index(function() 1, identity)
    Condition
      Error in `detect_index()`:
      ! `.x` must be a vector, not a function.
      i Read our FAQ about scalar types (`?vctrs::faq_error_scalar_type`) to learn more.

