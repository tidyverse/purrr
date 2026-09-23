# head_while() and tail_while() require boolean results

    Code
      head_while(list(1), function(x) 1)
    Condition
      Error in `head_while()`:
      ! `.p()` must return a single `TRUE` or `FALSE`, not the number 1.

---

    Code
      tail_while(list(1), function(x) 1)
    Condition
      Error in `tail_while()`:
      ! `.p()` must return a single `TRUE` or `FALSE`, not the number 1.

---

    Code
      head_while(list(1), function(x) NA)
    Condition
      Error in `head_while()`:
      ! `.p()` must return a single `TRUE` or `FALSE`, not `NA`.

---

    Code
      tail_while(list(1), function(x) NA)
    Condition
      Error in `tail_while()`:
      ! `.p()` must return a single `TRUE` or `FALSE`, not `NA`.

---

    Code
      head_while(list(1), function(x) c(TRUE, FALSE))
    Condition
      Error in `head_while()`:
      ! `.p()` must return a single `TRUE` or `FALSE`, not a logical vector.

---

    Code
      tail_while(list(1), function(x) c(TRUE, FALSE))
    Condition
      Error in `tail_while()`:
      ! `.p()` must return a single `TRUE` or `FALSE`, not a logical vector.

# head_while() and tail_while() require vector `.x`

    Code
      head_while(function() 1, identity)
    Condition
      Error in `head_while()`:
      ! `.x` must be a vector, not a function.
      i Read our FAQ about scalar types (`?vctrs::faq_error_scalar_type`) to learn more.

---

    Code
      tail_while(function() 1, identity)
    Condition
      Error in `tail_while()`:
      ! `.x` must be a vector, not a function.
      i Read our FAQ about scalar types (`?vctrs::faq_error_scalar_type`) to learn more.

