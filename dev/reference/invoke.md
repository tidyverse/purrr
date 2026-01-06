# Invoke functions.

**\[deprecated\]**

These functions were superded in purrr 0.3.0 and deprecated in purrr
1.0.0.

- `invoke()` is deprecated in favour of the simpler
  [`exec()`](https://rlang.r-lib.org/reference/exec.html) function
  reexported from rlang.
  [`exec()`](https://rlang.r-lib.org/reference/exec.html) evaluates a
  function call built from its inputs and supports [dynamic
  dots](https://rlang.r-lib.org/reference/dyn-dots.html):

      # Before:
      invoke(mean, list(na.rm = TRUE), x = 1:10)

      # After
      exec(mean, 1:10, !!!list(na.rm = TRUE))

- `invoke_map()` is deprecated because it's harder to understand than
  the corresponding code using
  [`map()`](https://purrr.tidyverse.org/dev/reference/map.md)/[`map2()`](https://purrr.tidyverse.org/dev/reference/map2.md)
  and [`exec()`](https://rlang.r-lib.org/reference/exec.html):

      # Before:
      invoke_map(fns, list(args))
      invoke_map(fns, list(args1, args2))

      # After:
      map(fns, exec, !!!args)
      map2(fns, list(args1, args2), \(fn, args) exec(fn, !!!args))

## Usage

``` r
invoke(.f, .x = NULL, ..., .env = NULL)

invoke_map(.f, .x = list(NULL), ..., .env = NULL)

invoke_map_lgl(.f, .x = list(NULL), ..., .env = NULL)

invoke_map_int(.f, .x = list(NULL), ..., .env = NULL)

invoke_map_dbl(.f, .x = list(NULL), ..., .env = NULL)

invoke_map_chr(.f, .x = list(NULL), ..., .env = NULL)

invoke_map_raw(.f, .x = list(NULL), ..., .env = NULL)

invoke_map_dfr(.f, .x = list(NULL), ..., .env = NULL)

invoke_map_dfc(.f, .x = list(NULL), ..., .env = NULL)
```

## Arguments

- .f:

  For `invoke`, a function; for `invoke_map` a list of functions.

- .x:

  For `invoke`, an argument-list; for `invoke_map` a list of
  argument-lists the same length as `.f` (or length 1). The default
  argument, `list(NULL)`, will be recycled to the same length as `.f`,
  and will call each function with no arguments (apart from any supplied
  in `...`.

- ...:

  Additional arguments passed to each function.

- .env:

  Environment in which
  [`do.call()`](https://rdrr.io/r/base/do.call.html) should evaluate a
  constructed expression. This only matters if you pass as `.f` the name
  of a function rather than its value, or as `.x` symbols of objects
  rather than their values.

## Examples

``` r
# was
invoke(runif, list(n = 10))
#>  [1] 0.6043941 0.1246334 0.2946009 0.5776099 0.6309793 0.5120159
#>  [7] 0.5050239 0.5340354 0.5572494 0.8679195
invoke(runif, n = 10)
#>  [1] 0.82970869 0.11144915 0.70368836 0.89748826 0.27973255 0.22820188
#>  [7] 0.01532989 0.12898156 0.09338193 0.23688501
# now
exec(runif, n = 10)
#>  [1] 0.7911474 0.5997316 0.9101477 0.5604246 0.7557048 0.3791719
#>  [7] 0.3732810 0.1702906 0.4533073 0.2584140

# was
args <- list("01a", "01b")
invoke(paste, args, sep = "-")
#> [1] "01a-01b"
# now
exec(paste, !!!args, sep = "-")
#> [1] "01a-01b"

# was
funs <- list(runif, rnorm)
funs |> invoke_map(n = 5)
#> Warning: `invoke_map()` was deprecated in purrr 1.0.0.
#> ℹ Please use map() + exec() instead.
#> [[1]]
#> [1] 0.3362660 0.8895830 0.2019463 0.5791860 0.2076320
#> 
#> [[2]]
#> [1] -0.5784837 -0.9423007 -0.2037282 -1.6664748 -0.4844551
#> 
funs |> invoke_map(list(list(n = 10), list(n = 5)))
#> [[1]]
#>  [1] 0.2293247 0.2129984 0.8771009 0.9932220 0.8442470 0.9104365
#>  [7] 0.4712697 0.2244184 0.1278147 0.2796835
#> 
#> [[2]]
#> [1]  0.9006247  0.8517704  0.7277152  0.7365021 -0.3521296
#> 

# now
funs |> map(exec, n = 5)
#> [[1]]
#> [1] 0.7597553 0.7608199 0.9032608 0.9662828 0.5152566
#> 
#> [[2]]
#> [1]  0.1243494 -0.9757388  0.6779977  0.3971048 -2.3838210
#> 
funs |> map2(list(list(n = 10), list(n = 5)), function(f, args) exec(f, !!!args))
#> [[1]]
#>  [1] 0.83861615 0.21342494 0.49471356 0.63624426 0.92109139 0.01174404
#>  [7] 0.26740292 0.43557210 0.82946709 0.87094404
#> 
#> [[2]]
#> [1] -0.6711297 -0.5065428  0.4676356  0.4736696  0.5590722
#> 

# or use pmap + a tibble
df <- tibble::tibble(
  fun = list(runif, rnorm),
  args = list(list(n = 10), list(n = 5))
)
df |> pmap(function(fun, args) exec(fun, !!!args))
#> [[1]]
#>  [1] 0.34055921 0.04117032 0.40175251 0.07905965 0.31255265 0.32507594
#>  [7] 0.07836646 0.15021977 0.15242507 0.91342360
#> 
#> [[2]]
#> [1]  0.53089117  0.42769412 -0.09272151  0.92373577 -0.84181930
#> 


# was
list(m1 = mean, m2 = median) |> invoke_map(x = rcauchy(100))
#> $m1
#> [1] 1.982409
#> 
#> $m2
#> [1] 0.1125127
#> 
# now
list(m1 = mean, m2 = median) |> map(function(f) f(rcauchy(100)))
#> $m1
#> [1] -0.9786158
#> 
#> $m2
#> [1] 0.1509643
#> 
```
