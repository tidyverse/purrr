# transpose() is deprecated

    Code
      . <- transpose(list())
    Condition
      Warning:
      `transpose()` was deprecated in purrr 0.4.0.
      Please use `list_transpose()` instead.

# input must be a list

    Code
      transpose(1:3)
    Condition
      Error:
      ! `.l` must be a list, not an integer vector.

# elements of input must be atomic vectors

    Code
      transpose(list(environment()))
    Condition
      Error:
      ! Element 1 must be a vector, not an environment.

---

    Code
      transpose(list(list(), environment()))
    Condition
      Error:
      ! Element 2 must be a vector, not an environment.

# can't transpose expressions

    Code
      transpose(list(expression(a)))
    Condition
      Error:
      ! Transposed element must be a vector, not an expression vector.

