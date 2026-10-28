# errors on invalid subsetting vectors

    Code
      where_at(x, c(FALSE, TRUE))
    Condition
      Error:
      ! Can't subset elements with `at`.
      x Logical subscript `at` must be size 1 or 3, not 2.
    Code
      where_at(x, NA_real_)
    Condition
      Error:
      ! Can't subset elements.
      x Subscript can't contain missing values.
      x It has a missing value at location 1.
    Code
      where_at(x, 4)
    Condition
      Error:
      ! Can't subset elements past the end.
      i Location 4 doesn't exist.
      i There are only 3 elements.

# validates its inputs

    Code
      where_at(x, list())
    Condition
      Error:
      ! `list()` must be a numeric vector, character vector, or function, not an empty list.

# tidyselect `at` is defunct

    Code
      where_at(data.frame(x = 1), quos(x))
    Condition
      Error:
      ! Using `vars()` in .at was deprecated in purrr 1.0.0 and is now defunct.

# pairlists, expressions, and calls are deprecated

    Code
      x <- vctrs_vec_compat(expression(1, 2), globalenv())
    Condition
      Warning:
      Use of calls and expressions in purrr functions was deprecated in purrr 1.0.0.
      i Please coerce explicitly with `as.list()`

---

    Code
      x <- vctrs_vec_compat(pairlist(1, 2), globalenv())
    Condition
      Warning:
      Use of pairlists in purrr functions was deprecated in purrr 1.0.0.
      i Please coerce explicitly with `as.list()`

---

    Code
      x <- vctrs_vec_compat(quote(f(a, b = 1)), globalenv())
    Condition
      Warning:
      Use of calls and expressions in purrr functions was deprecated in purrr 1.0.0.
      i Please coerce explicitly with `as.list()`

# can't work with regular S4 objects

    Code
      map(foo(), identity)
    Condition
      Error in `x[[i]]`:
      ! this S4 class is not subsettable

