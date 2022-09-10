# flatten functions are deprecated

    Code
      . <- flatten(list())
    Condition
      Warning:
      `flatten()` was deprecated in purrr 0.4.0.
      Please use `list_flatten()` instead.
    Code
      . <- flatten_lgl(list())
    Condition
      Warning:
      `flatten_lgl()` was deprecated in purrr 0.4.0.
      Please use `list_c()` instead.
    Code
      . <- flatten_int(list())
    Condition
      Warning:
      `flatten_lgl()` was deprecated in purrr 0.4.0.
      Please use `list_c()` instead.
    Code
      . <- flatten_dbl(list())
    Condition
      Warning:
      `flatten_lgl()` was deprecated in purrr 0.4.0.
      Please use `list_c()` instead.
    Code
      . <- flatten_chr(list())
    Condition
      Warning:
      `flatten_lgl()` was deprecated in purrr 0.4.0.
      Please use `list_c()` instead.
    Code
      . <- flatten_dfr(list())
    Condition
      Warning:
      `flatten_dfr()` was deprecated in purrr 0.4.0.
      Please use `list_rbind()` instead.
    Code
      . <- flatten_dfc(list())
    Condition
      Warning:
      `flatten_dfc()` was deprecated in purrr 0.4.0.
      Please use `list_cbind()` instead.
    Code
      . <- flatten_df(list())
    Condition
      Warning:
      `flatten_df()` was deprecated in purrr 0.4.0.
      Please use `list_rbind()` instead.

# input must be a list

    Code
      flatten(1)
    Condition
      Error:
      ! `.x` must be a list, not a number

---

    Code
      flatten_dbl(1)
    Condition
      Error:
      ! `.x` must be a list, not a number

# contents of list must be supported types

    Code
      flatten(list(quote(a)))
    Condition
      Error:
      ! `.x[[1]]` must be a vector, not a symbol

---

    Code
      flatten(list(expression(a)))
    Condition
      Error:
      ! `.x[[1]]` must be a vector, not an expression vector

# must be a list

    Code
      flatten_lgl(1)
    Condition
      Error:
      ! `.x` must be a list, not a number

