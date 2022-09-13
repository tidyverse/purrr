# input must be a list

    Code
      flatten(1)
    Condition
      Error:
      ! `.x` must be a list, not a number.

---

    Code
      flatten_dbl(1)
    Condition
      Error:
      ! `.x` must be a list, not a number.

# contents of list must be supported types

    Code
      flatten(list(quote(a)))
    Condition
      Error:
      ! `.x[[1]]` must be a vector, not a symbol.

---

    Code
      flatten(list(expression(a)))
    Condition
      Error:
      ! `.x[[1]]` must be a vector, not an expression vector.

# must be a list

    Code
      flatten_lgl(1)
    Condition
      Error:
      ! `.x` must be a list, not a number.

