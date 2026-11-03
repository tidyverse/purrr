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

# .f parameter passed to head_while()/tail_while() doesn't override .p parameter

    Code
      head_while(5:-5, .f = function(x, ...) x < 3)
    Condition
      Error in `as_mapper()`:
      ! formal argument ".f" matched by multiple actual arguments

---

    Code
      tail_while(5:-5, .f = function(x, ...) x > 3)
    Condition
      Error in `as_mapper()`:
      ! formal argument ".f" matched by multiple actual arguments

# passing .dir parameter to head_while()/tail_while() results in an error

    Code
      head_while(5:-5, function(x) x < 0, .dir = "backward")
    Condition
      Error in `which_satisfies_predicate()`:
      ! formal argument ".dir" matched by multiple actual arguments

---

    Code
      tail_while(5:-5, function(x) x > 0, .dir = "forward")
    Condition
      Error in `which_satisfies_predicate()`:
      ! formal argument ".dir" matched by multiple actual arguments

