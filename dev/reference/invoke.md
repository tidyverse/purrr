# Invoke functions.

**\[defunct\]**

These functions were superseded in purrr 0.3.0 and deprecated in purrr
1.0.0. They are now defunct, except for `invoke_map_df()` and
`invoke_map_dfc()`, which are deprecated.

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
# Instead of invoke(runif, n = 10), use:
exec(runif, n = 10)
#>  [1] 0.3277343 0.6021007 0.6043941 0.1246334 0.2946009 0.5776099
#>  [7] 0.6309793 0.5120159 0.5050239 0.5340354

# Instead of invoke(paste, args, sep = "-"), use:
args <- list("01a", "01b")
exec(paste, !!!args, sep = "-")
#> [1] "01a-01b"

# Instead of invoke_map(), use map() + exec():
funs <- list(runif, rnorm)
funs |> map(exec, n = 5)
#> [[1]]
#> [1] 0.5572494 0.8679195 0.8297087 0.1114492 0.7036884
#> 
#> [[2]]
#> [1]  1.2673687 -0.7447816 -1.1312186 -0.7163585  0.2526524
#> 
funs |> map2(list(list(n = 10), list(n = 5)), function(f, args) exec(f, !!!args))
#> [[1]]
#>  [1] 0.5604246 0.7557048 0.3791719 0.3732810 0.1702906 0.4533073
#>  [7] 0.2584140 0.3362660 0.8895830 0.2019463
#> 
#> [[2]]
#> [1]  0.1998116 -0.5784837 -0.9423007 -0.2037282 -1.6664748
#> 

# or use pmap + a tibble
df <- tibble::tibble(
  fun = list(runif, rnorm),
  args = list(list(n = 10), list(n = 5))
)
df |> pmap(function(fun, args) exec(fun, !!!args))
#> [[1]]
#>  [1] 0.3140315 0.8006411 0.2293247 0.2129984 0.8771009 0.9932220
#>  [7] 0.8442470 0.9104365 0.4712697 0.2244184
#> 
#> [[2]]
#> [1] -1.1367823  0.9006247  0.8517704  0.7277152  0.7365021
#> 
```
