# input must be a list

    Code
      transpose(1:3)
    Condition
      Error in `transpose()`:
      ! `.l` must be a list, not an integer vector.

# elements of input must be atomic vectors

    Code
      transpose(list(environment()))
    Condition
      Error in `transpose()`:
      ! Element 1 must be a vector, not an environment.

---

    Code
      transpose(list(list(), environment()))
    Condition
      Error in `transpose()`:
      ! Element 2 must be a vector, not an environment.

# can't transpose expressions

    Code
      transpose(list(expression(a)))
    Condition
      Error in `transpose()`:
      ! Transposed element must be a vector, not an expression vector.

