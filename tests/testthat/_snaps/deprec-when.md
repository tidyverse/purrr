# when is deprecated

    Code
      . <- when(1:5 < 3 ~ 1, ~0)
    Condition
      Warning:
      `when()` was deprecated in purrr 1.0.0.
      i Please use `if` instead.

# error when named arguments have no matching conditions

    Code
      when(1:5, a = sum(.) < 5 ~ 3)
    Condition
      Error in `when()`:
      ! At least one matching condition is needed.

