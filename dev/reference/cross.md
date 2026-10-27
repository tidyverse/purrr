# Produce all combinations of list elements

**\[defunct\]**

These functions were deprecated in purrr 1.0.0 and are now defunct
because they are slow and buggy, and we no longer think they are the
right approach to solving this problem. Please use
[`tidyr::expand_grid()`](https://tidyr.tidyverse.org/reference/expand_grid.html)
instead.

Here is an example of equivalent usages for `cross()` and
`expand_grid()`:

    data <- list(
      id = c("John", "Jane"),
      sep = c("! ", "... "),
      greeting = c("Hello.", "Bonjour.")
    )

    # With defunct `cross()`
    data |> cross() |> map_chr(\(...) paste0(..., collapse = ""))

    # With `expand_grid()`
    tidyr::expand_grid(!!!data) |> pmap_chr(paste)

## Usage

``` r
cross(.l, .filter = NULL)

cross2(.x, .y, .filter = NULL)

cross3(.x, .y, .z, .filter = NULL)

cross_df(.l, .filter = NULL)
```

## Arguments

- .l:

  A list of lists or atomic vectors. Alternatively, a data frame.
  `cross_df()` requires all elements to be named.

- .filter:

  A predicate function that takes the same number of arguments as the
  number of variables to be combined.

- .x, .y, .z:

  Lists or atomic vectors.

## Value

`cross2()`, `cross3()` and `cross()` always return a list. `cross_df()`
always returns a data frame. `cross()` returns a list where each element
is one combination so that the list can be directly mapped over.
`cross_df()` returns a data frame where each row is one combination.

## Details

`cross2()` returns the product set of the elements of `.x` and `.y`.
`cross3()` takes an additional `.z` argument. `cross()` takes a list
`.l` and returns the cartesian product of all its elements in a list,
with one combination by element. `cross_df()` is like `cross()` but
returns a data frame, with one combination by row.

`cross()`, `cross2()` and `cross3()` return the cartesian product is
returned in wide format. This makes it more amenable to mapping
operations. `cross_df()` returns the output in long format just as
[`expand.grid()`](https://rdrr.io/r/base/expand.grid.html) does. This is
adapted to rowwise operations.

When the number of combinations is large and the individual elements are
heavy memory-wise, it is often useful to filter unwanted combinations on
the fly with `.filter`. It must be a predicate function that takes the
same number of arguments as the number of crossed objects (2 for
`cross2()`, 3 for `cross3()`, `length(.l)` for `cross()`) and returns
`TRUE` or `FALSE`. The combinations where the predicate function returns
`TRUE` will be removed from the result.

## See also

[`expand.grid()`](https://rdrr.io/r/base/expand.grid.html)
