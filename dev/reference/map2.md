# Map over two inputs

These functions are variants of
[`map()`](https://purrr.tidyverse.org/dev/reference/map.md) that iterate
over two arguments at a time.

## Usage

``` r
map2(.x, .y, .f, ..., .progress = FALSE)

map2_lgl(.x, .y, .f, ..., .progress = FALSE)

map2_int(.x, .y, .f, ..., .progress = FALSE)

map2_dbl(.x, .y, .f, ..., .progress = FALSE)

map2_chr(.x, .y, .f, ..., .progress = FALSE)

map2_vec(.x, .y, .f, ..., .ptype = NULL, .progress = FALSE)

walk2(.x, .y, .f, ..., .progress = FALSE)
```

## Arguments

- .x, .y:

  A pair of vectors, usually the same length. If not, a vector of length
  1 will be recycled to the length of the other.

- .f:

  A function, specified in one of the following ways:

  - A named function.

  - An anonymous function, e.g. `\(x, y) x + y` or
    `function(x, y) x + y`.

  - A formula, e.g. `~ .x + .y`. Use `.x` to refer to the current
    element of `x` and `.y` to refer to the current element of `y`. No
    longer recommended.

  **\[experimental\]**

  Wrap a function with
  [`in_parallel()`](https://purrr.tidyverse.org/dev/reference/in_parallel.md)
  to declare that it should be performed in parallel. See
  [`in_parallel()`](https://purrr.tidyverse.org/dev/reference/in_parallel.md)
  for more details. Use of `...` is not permitted in this context.

- ...:

  Additional arguments passed on to the mapped function.

  We now generally recommend against using `...` to pass additional
  (constant) arguments to `.f`. Instead use a shorthand anonymous
  function:

      # Instead of
      x |> map(f, 1, 2, collapse = ",")
      # do:
      x |> map(\(x) f(x, 1, 2, collapse = ","))

  This makes it easier to understand which arguments belong to which
  function and will tend to yield better error messages.

- .progress:

  Whether to show a progress bar. Use `TRUE` to turn on a basic progress
  bar, use a string to give it a name, or see
  [progress_bars](https://purrr.tidyverse.org/dev/reference/progress_bars.md)
  for more details.

- .ptype:

  If `NULL`, the default, the output type is the common type of the
  elements of the result. Otherwise, supply a "prototype" giving the
  desired type of output.

## Value

The output length is determined by the length of the input. The output
names are determined by the input names. The output type is determined
by the suffix:

- No suffix: a list; `.f()` can return anything.

- `_lgl()`, `_int()`, `_dbl()`, `_chr()` return a logical, integer,
  double, or character vector respectively; `.f()` must return a
  compatible atomic vector of length 1.

- `_vec()` return an atomic or S3 vector, the same type that `.f`
  returns. `.f` can return pretty much any type of vector, as long as
  its length 1.

- [`walk()`](https://purrr.tidyverse.org/dev/reference/map.md) returns
  the input `.x` (invisibly). This makes it easy to use in a pipe. The
  return value of `.f()` is ignored.

Any errors thrown by `.f` will be wrapped in an error with class
[purrr_error_indexed](https://purrr.tidyverse.org/dev/reference/purrr_error_indexed.md).

## See also

Other map variants:
[`imap()`](https://purrr.tidyverse.org/dev/reference/imap.md),
[`lmap()`](https://purrr.tidyverse.org/dev/reference/lmap.md),
[`map()`](https://purrr.tidyverse.org/dev/reference/map.md),
[`map_depth()`](https://purrr.tidyverse.org/dev/reference/map_depth.md),
[`map_if()`](https://purrr.tidyverse.org/dev/reference/map_if.md),
[`modify()`](https://purrr.tidyverse.org/dev/reference/modify.md),
[`pmap()`](https://purrr.tidyverse.org/dev/reference/pmap.md)

## Examples

``` r
x <- list(1, 1, 1)
y <- list(10, 20, 30)

map2(x, y, \(x, y) x + y)
#> [[1]]
#> [1] 11
#> 
#> [[2]]
#> [1] 21
#> 
#> [[3]]
#> [1] 31
#> 
# Or just
map2(x, y, `+`)
#> [[1]]
#> [1] 11
#> 
#> [[2]]
#> [1] 21
#> 
#> [[3]]
#> [1] 31
#> 

# Split into pieces, fit model to each piece, then predict
by_cyl <- mtcars |> split(mtcars$cyl)
mods <- by_cyl |> map(\(df) lm(mpg ~ wt, data = df))
map2(mods, by_cyl, predict)
#> $`4`
#>     Datsun 710      Merc 240D       Merc 230       Fiat 128 
#>       26.47010       21.55719       21.78307       27.14774 
#>    Honda Civic Toyota Corolla  Toyota Corona      Fiat X1-9 
#>       30.45125       29.20890       25.65128       28.64420 
#>  Porsche 914-2   Lotus Europa     Volvo 142E 
#>       27.48656       31.02725       23.87247 
#> 
#> $`6`
#>      Mazda RX4  Mazda RX4 Wag Hornet 4 Drive        Valiant 
#>       21.12497       20.41604       19.47080       18.78968 
#>       Merc 280      Merc 280C   Ferrari Dino 
#>       18.84528       18.84528       20.70795 
#> 
#> $`8`
#>   Hornet Sportabout          Duster 360          Merc 450SE 
#>            16.32604            16.04103            14.94481 
#>          Merc 450SL         Merc 450SLC  Cadillac Fleetwood 
#>            15.69024            15.58061            12.35773 
#> Lincoln Continental   Chrysler Imperial    Dodge Challenger 
#>            11.97625            12.14945            16.15065 
#>         AMC Javelin          Camaro Z28    Pontiac Firebird 
#>            16.33700            15.44907            15.43811 
#>      Ford Pantera L       Maserati Bora 
#>            16.91800            16.04103 
#> 
```
