# when is deprecated

    Code
      . <- when(1:5 < 3 ~ 1, ~0)
    Condition
      Warning:
      `when()` was deprecated in purrr 0.4.0.
      Please use `dplyr::case_when()` instead.

