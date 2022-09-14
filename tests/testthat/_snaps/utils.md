# errors on invalid subsetting vectors

    Code
      at_selection(x, c(FALSE, TRUE))
    Condition
      Error:
      ! Must subset elements with a valid subscript vector.
      i Logical subscripts must match the size of the indexed input.
      x Input has size 3 but subscript `at` has size 2.
    Code
      at_selection(x, NA_real_)
    Condition
      Error:
      ! Must subset elements with a valid subscript vector.
      x Subscript can't contain missing values.
      x It has a missing value at location 1.
    Code
      at_selection(x, 4)
    Condition
      Error:
      ! Can't subset elements past the end.
      i Location 4 doesn't exist.
      i There are only 3 elements.

# validates its inputs

    Code
      at_selection(x, list())
    Condition
      Error:
      ! `list()` must be a numeric vector, character vector, or function, not an empty list.

# tidyselect `at` is deprecated

    Code
      . <- at_selection(data.frame(x = 1), vars("x"))
    Condition
      Warning:
      Using `vars()` in .at was deprecated in purrr 1.0.0.

