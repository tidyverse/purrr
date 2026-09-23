# head_while and tail_while require predicate function

    Code
      head_while(1:3, ~NA)
    Condition
      Error in `head_while()`:
      ! `.p()` must return a single `TRUE` or `FALSE`, not `NA`.

---

    Code
      tail_while(1:3, ~ c(TRUE, FALSE))
    Condition
      Error in `tail_while()`:
      ! `.p()` must return a single `TRUE` or `FALSE`, not a logical vector.

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
      Error in `detect_index()`:
      ! formal argument ".dir" matched by multiple actual arguments

---

    Code
      tail_while(5:-5, function(x) x > 0, .dir = "forward")
    Condition
      Error in `detect_index()`:
      ! formal argument ".dir" matched by multiple actual arguments

