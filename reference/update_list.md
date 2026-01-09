# Update a list with formulas

**\[deprecated\]**

`update_list()` was deprecated in purrr 1.0.0, because we no longer
believe that functions that use NSE are a good fit for purrr.

`update_list()` handles formulas and quosures that can refer to values
existing within the input list. This function is deprecated because we
no longer believe that functions that use tidy evaluation are a good fit
for purrr.

## Usage

``` r
update_list(.x, ...)
```

## Arguments

- .x:

  List to modify.

- ...:

  New values of a list. Use
  [`zap()`](https://rlang.r-lib.org/reference/zap.html) to remove
  values.

  These values should be either all named or all unnamed. When inputs
  are all named, they are matched to `.x` by name. When they are all
  unnamed, they are matched by position.

  [Dynamic dots](https://rlang.r-lib.org/reference/dyn-dots.html) are
  supported. In particular, if your replacement values are stored in a
  list, you can splice that in with `!!!`.
