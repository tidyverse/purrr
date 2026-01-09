# Flatten a list of lists into a simple vector

**\[superseded\]**

These functions were superseded in purrr 1.0.0 because their behaviour
was inconsistent. Superseded functions will not go away, but will only
receive critical bug fixes.

- `flatten()` has been superseded by
  [`list_flatten()`](https://purrr.tidyverse.org/reference/list_flatten.md).

- `flatten_lgl()`, `flatten_int()`, `flatten_dbl()`, and `flatten_chr()`
  have been superseded by
  [`list_c()`](https://purrr.tidyverse.org/reference/list_c.md).

- `flatten_dfr()` and `flatten_dfc()` have been superseded by
  [`list_rbind()`](https://purrr.tidyverse.org/reference/list_c.md) and
  [`list_cbind()`](https://purrr.tidyverse.org/reference/list_c.md)
  respectively.

## Usage

``` r
flatten(.x)

flatten_lgl(.x)

flatten_int(.x)

flatten_dbl(.x)

flatten_chr(.x)

flatten_dfr(.x, .id = NULL)

flatten_dfc(.x)
```

## Arguments

- .x:

  A list to flatten. The contents of the list can be anything for
  `flatten()` (as a list is returned), but the contents must match the
  type for the other functions.

## Value

`flatten()` returns a list, `flatten_lgl()` a logical vector,
`flatten_int()` an integer vector, `flatten_dbl()` a double vector, and
`flatten_chr()` a character vector.

`flatten_dfr()` and `flatten_dfc()` return data frames created by
row-binding and column-binding respectively. They require dplyr to be
installed.

## Examples

``` r
x <- map(1:3, \(i) sample(4))
x
#> [[1]]
#> [1] 2 1 4 3
#> 
#> [[2]]
#> [1] 4 2 1 3
#> 
#> [[3]]
#> [1] 2 4 1 3
#> 

# was
x |> flatten_int() |> str()
#>  int [1:12] 2 1 4 3 4 2 1 3 2 4 ...
# now
x |> list_c() |> str()
#>  int [1:12] 2 1 4 3 4 2 1 3 2 4 ...

x <- list(list(1, 2), list(3, 4))
# was
x |> flatten() |> str()
#> List of 4
#>  $ : num 1
#>  $ : num 2
#>  $ : num 3
#>  $ : num 4
# now
x |> list_flatten() |> str()
#> List of 4
#>  $ : num 1
#>  $ : num 2
#>  $ : num 3
#>  $ : num 4
```
