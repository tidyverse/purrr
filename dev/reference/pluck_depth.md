# Compute the depth of a vector

The depth of a vector is how many levels that you can index/pluck into
it. `pluck_depth()` was previously called `vec_depth()`.

## Usage

``` r
pluck_depth(x, is_node = NULL)
```

## Arguments

- x:

  A vector

- is_node:

  Optionally override the default criteria for determine an element can
  be recursed within. The default matches the behaviour of
  [`pluck()`](https://purrr.tidyverse.org/dev/reference/pluck.md) which
  can recurse into lists and expressions.

## Value

An integer.

## Examples

``` r
x <- list(
  list(),
  list(list()),
  list(list(list(1)))
)
pluck_depth(x)
#> [1] 5
x |> map_int(pluck_depth)
#> [1] 1 2 4
```
