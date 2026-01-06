# Functions that return data frames

**\[superseded\]**

These [`map()`](https://purrr.tidyverse.org/dev/reference/map.md),
[`map2()`](https://purrr.tidyverse.org/dev/reference/map2.md),
[`imap()`](https://purrr.tidyverse.org/dev/reference/imap.md), and
[`pmap()`](https://purrr.tidyverse.org/dev/reference/pmap.md) variants
return data frames by row-binding or column-binding the outputs
together.

The functions were superseded in purrr 1.0.0 because their names suggest
they work like `_lgl()`, `_int()`, etc which require length 1 outputs,
but actually they return results of any size because the results are
combined without any size checks. Additionally, they use
[`dplyr::bind_rows()`](https://dplyr.tidyverse.org/reference/bind_rows.html)
and
[`dplyr::bind_cols()`](https://dplyr.tidyverse.org/reference/bind_cols.html)
which require dplyr to be installed and have confusing semantics with
edge cases. Superseded functions will not go away, but will only receive
critical bug fixes.

Instead, we recommend using
[`map()`](https://purrr.tidyverse.org/dev/reference/map.md),
[`map2()`](https://purrr.tidyverse.org/dev/reference/map2.md), etc with
[`list_rbind()`](https://purrr.tidyverse.org/dev/reference/list_c.md)
and
[`list_cbind()`](https://purrr.tidyverse.org/dev/reference/list_c.md).
These use
[`vctrs::vec_rbind()`](https://vctrs.r-lib.org/reference/vec_bind.html)
and
[`vctrs::vec_cbind()`](https://vctrs.r-lib.org/reference/vec_bind.html)
under the hood, and have names that more clearly reflect their
semantics.

## Usage

``` r
map_dfr(.x, .f, ..., .id = NULL)

map_dfc(.x, .f, ...)

imap_dfr(.x, .f, ..., .id = NULL)

imap_dfc(.x, .f, ...)

map2_dfr(.x, .y, .f, ..., .id = NULL)

map2_dfc(.x, .y, .f, ...)

pmap_dfr(.l, .f, ..., .id = NULL)

pmap_dfc(.l, .f, ...)
```

## Arguments

- .id:

  Either a string or `NULL`. If a string, the output will contain a
  variable with that name, storing either the name (if `.x` is named) or
  the index (if `.x` is unnamed) of the input. If `NULL`, the default,
  no variable will be created.

  Only applies to `_dfr` variant.

## Examples

``` r
# map ---------------------------------------------
# Was:
mtcars |>
  split(mtcars$cyl) |>
  map(\(df) lm(mpg ~ wt, data = df)) |>
  map_dfr(\(mod) as.data.frame(t(as.matrix(coef(mod)))))
#>   (Intercept)        wt
#> 1    39.57120 -5.647025
#> 2    28.40884 -2.780106
#> 3    23.86803 -2.192438

# Now:
mtcars |>
  split(mtcars$cyl) |>
  map(\(df) lm(mpg ~ wt, data = df)) |>
  map(\(mod) as.data.frame(t(as.matrix(coef(mod))))) |>
  list_rbind()
#>   (Intercept)        wt
#> 1    39.57120 -5.647025
#> 2    28.40884 -2.780106
#> 3    23.86803 -2.192438

# for certain pathological inputs `map_dfr()` and `map_dfc()` actually
# both combine the list by column
df <- data.frame(
  x = c(" 13", "  15 "),
  y = c("  34",  " 67 ")
)

# Was:
map_dfr(df, trimws)
#> # A tibble: 2 × 2
#>   x     y    
#>   <chr> <chr>
#> 1 13    34   
#> 2 15    67   
map_dfc(df, trimws)
#> # A tibble: 2 × 2
#>   x     y    
#>   <chr> <chr>
#> 1 13    34   
#> 2 15    67   

# But list_rbind()/list_cbind() fail because they require data frame inputs
try(map(df, trimws) |> list_rbind())
#> Error in list_rbind(map(df, trimws)) : 
#>   Each element of `x` must be either a data frame or `NULL`.
#> ℹ Elements 1 and 2 are not.

# Instead, use modify() to apply a function to each column of a data frame
modify(df, trimws)
#>    x  y
#> 1 13 34
#> 2 15 67

# map2 ---------------------------------------------

ex_fun <- function(arg1, arg2){
  col <- arg1 + arg2
  x <- as.data.frame(col)
}
arg1 <- 1:4
arg2 <- 10:13

# was
map2_dfr(arg1, arg2, ex_fun)
#>   col
#> 1  11
#> 2  13
#> 3  15
#> 4  17
# now
map2(arg1, arg2, ex_fun) |> list_rbind()
#>   col
#> 1  11
#> 2  13
#> 3  15
#> 4  17

# was
map2_dfc(arg1, arg2, ex_fun)
#> New names:
#> • `col` -> `col...1`
#> • `col` -> `col...2`
#> • `col` -> `col...3`
#> • `col` -> `col...4`
#>   col...1 col...2 col...3 col...4
#> 1      11      13      15      17
# now
map2(arg1, arg2, ex_fun) |> list_cbind()
#> New names:
#> • `col` -> `col...1`
#> • `col` -> `col...2`
#> • `col` -> `col...3`
#> • `col` -> `col...4`
#>   col...1 col...2 col...3 col...4
#> 1      11      13      15      17
```
