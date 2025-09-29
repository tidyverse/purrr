# every(), some(), and none() require logical scalar predicate results

    Code
      every(list(1), function(x) 1)
    Condition
      Error in `every()`:
      ! `.p()` must return a single `TRUE`, `FALSE`, or `NA`, not the number 1.

---

    Code
      some(list(1), function(x) 1)
    Condition
      Error in `some()`:
      ! `.p()` must return a single `TRUE`, `FALSE`, or `NA`, not the number 1.

---

    Code
      none(list(1), function(x) 1)
    Condition
      Error in `none()`:
      ! `.p()` must return a single `TRUE`, `FALSE`, or `NA`, not the number 1.

---

    Code
      every(list(1), function(x) NA_integer_)
    Condition
      Error in `every()`:
      ! `.p()` must return a single `TRUE`, `FALSE`, or `NA`, not an integer `NA`.

---

    Code
      some(list(1), function(x) NA_integer_)
    Condition
      Error in `some()`:
      ! `.p()` must return a single `TRUE`, `FALSE`, or `NA`, not an integer `NA`.

---

    Code
      none(list(1), function(x) NA_integer_)
    Condition
      Error in `none()`:
      ! `.p()` must return a single `TRUE`, `FALSE`, or `NA`, not an integer `NA`.

---

    Code
      every(list(1), function(x) c(TRUE, FALSE))
    Condition
      Error in `every()`:
      ! `.p()` must return a single `TRUE`, `FALSE`, or `NA`, not a logical vector.

---

    Code
      some(list(1), function(x) c(TRUE, FALSE))
    Condition
      Error in `some()`:
      ! `.p()` must return a single `TRUE`, `FALSE`, or `NA`, not a logical vector.

---

    Code
      none(list(1), function(x) c(TRUE, FALSE))
    Condition
      Error in `none()`:
      ! `.p()` must return a single `TRUE`, `FALSE`, or `NA`, not a logical vector.

# every(), some(), and none() require vector `.x`

    Code
      every(function() 1, identity)
    Condition
      Error in `every()`:
      ! `.x` must be a vector, not a function.

---

    Code
      some(function() 1, identity)
    Condition
      Error in `some()`:
      ! `.x` must be a vector, not a function.

---

    Code
      none(function() 1, identity)
    Condition
      Error in `none()`:
      ! `.x` must be a vector, not a function.

# pairlists, expressions, and calls are deprecated but work

    Code
      out <- every(expression(1, 2), is.double)
    Condition
      Warning:
      Use of calls and expressions in purrr functions was deprecated in purrr 1.0.0.
      i Please coerce explicitly with `as.list()`

---

    Code
      out <- every(pairlist(1, 2), is.double)
    Condition
      Warning:
      Use of pairlists in purrr functions was deprecated in purrr 1.0.0.
      i Please coerce explicitly with `as.list()`

---

    Code
      x <- every(quote(f(a, b)), is.name)
    Condition
      Warning:
      Use of calls and expressions in purrr functions was deprecated in purrr 1.0.0.
      i Please coerce explicitly with `as.list()`

