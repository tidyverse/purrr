# Apply a function to each element of a vector

The map functions transform their input by applying a function to each
element of a list or atomic vector and returning an object of the same
length as the input.

- `map()` always returns a list. See the
  [`modify()`](https://purrr.tidyverse.org/reference/modify.md) family
  for versions that return an object of the same type as the input.

- `map_lgl()`, `map_int()`, `map_dbl()` and `map_chr()` return an atomic
  vector of the indicated type (or die trying). For these functions,
  `.f` must return a length-1 vector of the appropriate type.

- `map_vec()` simplifies to the common type of the output. It works with
  most types of simple vectors like Date, POSIXct, factors, etc.

- `walk()` calls `.f` for its side-effect and returns the input `.x`.

## Usage

``` r
map(.x, .f, ..., .progress = FALSE)

map_lgl(.x, .f, ..., .progress = FALSE)

map_int(.x, .f, ..., .progress = FALSE)

map_dbl(.x, .f, ..., .progress = FALSE)

map_chr(.x, .f, ..., .progress = FALSE)

map_vec(.x, .f, ..., .ptype = NULL, .progress = FALSE)

walk(.x, .f, ..., .progress = FALSE)
```

## Arguments

- .x:

  A list or atomic vector.

- .f:

  A function, specified in one of the following ways:

  - A named function, e.g. `mean`.

  - An anonymous function, e.g. `\(x) x + 1` or `function(x) x + 1`.

  - A formula, e.g. `~ .x + 1`. Use `.x` to refer to the first argument.
    No longer recommended.

  - A string, integer, or list, e.g. `"idx"`, `1`, or `list("idx", 1)`
    which are shorthand for `\(x) pluck(x, "idx")`, `\(x) pluck(x, 1)`,
    and `\(x) pluck(x, "idx", 1)` respectively. Optionally supply
    `.default` to set a default value if the indexed element is `NULL`
    or does not exist.

  **\[experimental\]**

  Wrap a function with
  [`in_parallel()`](https://purrr.tidyverse.org/reference/in_parallel.md)
  to declare that it should be performed in parallel. See
  [`in_parallel()`](https://purrr.tidyverse.org/reference/in_parallel.md)
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
  [progress_bars](https://purrr.tidyverse.org/reference/progress_bars.md)
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

- `walk()` returns the input `.x` (invisibly). This makes it easy to use
  in a pipe. The return value of `.f()` is ignored.

Any errors thrown by `.f` will be wrapped in an error with class
[purrr_error_indexed](https://purrr.tidyverse.org/reference/purrr_error_indexed.md).

## See also

[`map_if()`](https://purrr.tidyverse.org/reference/map_if.md) for
applying a function to only those elements of `.x` that meet a specified
condition.

Other map variants:
[`imap()`](https://purrr.tidyverse.org/reference/imap.md),
[`lmap()`](https://purrr.tidyverse.org/reference/lmap.md),
[`map2()`](https://purrr.tidyverse.org/reference/map2.md),
[`map_depth()`](https://purrr.tidyverse.org/reference/map_depth.md),
[`map_if()`](https://purrr.tidyverse.org/reference/map_if.md),
[`modify()`](https://purrr.tidyverse.org/reference/modify.md),
[`pmap()`](https://purrr.tidyverse.org/reference/pmap.md)

## Examples

``` r
# Compute normal distributions from an atomic vector
1:10 |>
  map(rnorm, n = 10)
#> [[1]]
#>  [1]  2.1484116 -0.8218177  0.7526747  0.7558004  0.7172946  0.4463006
#>  [7]  1.6289820  3.0650249 -0.6309894  1.5124269
#> 
#> [[2]]
#>  [1] 0.1369885 1.4779875 1.9473981 2.5429963 1.0859252 2.4681544
#>  [7] 2.3629513 0.6954565 2.7377763 3.8885049
#> 
#> [[3]]
#>  [1] 2.902555 2.064153 2.984050 2.173211 1.487600 3.935363 3.176489
#>  [8] 3.243685 4.623549 3.112038
#> 
#> [[4]]
#>  [1] 3.866003 2.089913 3.720763 3.686554 5.067308 4.070035 3.360877
#>  [8] 3.950035 3.748517 4.444797
#> 
#> [[5]]
#>  [1] 7.755418 5.046531 5.577709 5.118195 3.088280 5.862086 4.756763
#>  [8] 4.793913 5.019178 5.029561
#> 
#> [[6]]
#>  [1] 6.549828 3.725885 8.682557 5.638779 6.213356 7.074346 5.334912
#>  [8] 7.113952 5.754104 4.822437
#> 
#> [[7]]
#>  [1] 6.024149 8.065057 7.131671 7.488629 5.300549 5.529264 7.284150
#>  [8] 8.337320 7.236696 8.318293
#> 
#> [[8]]
#>  [1] 8.523910 8.606748 7.890064 8.172182 7.909673 9.924343 9.298393
#>  [8] 8.748791 8.556224 7.451743
#> 
#> [[9]]
#>  [1] 10.110535  6.387666  8.844306  9.433890  8.618049  9.424188
#>  [7] 10.063102 10.048713  8.961897  9.486149
#> 
#> [[10]]
#>  [1] 11.672883  9.645639 10.946348 11.316826  9.703360  9.612786
#>  [7]  9.214567  8.943263  9.204459  8.243725
#> 

# You can also use an anonymous function
1:10 |>
  map(\(x) rnorm(10, x))
#> [[1]]
#>  [1]  0.3094621  0.4414580  0.4633367  1.2271271  1.9784549  0.7911173
#>  [7] -0.3994105  1.2585373  0.5582005  1.5685999
#> 
#> [[2]]
#>  [1] 4.1268505 2.4248584 0.3157185 2.2494018 3.0728383 4.0393693
#>  [7] 2.4494538 3.3918140 2.4265665 2.1075840
#> 
#> [[3]]
#>  [1] 3.022295 3.603611 2.737349 2.471736 3.192149 1.853800 3.846185
#>  [8] 3.081720 1.694883 2.055088
#> 
#> [[4]]
#>  [1] 4.454342 3.144797 3.713105 4.894962 4.067304 3.837324 3.172690
#>  [8] 5.876506 4.766440 4.979957
#> 
#> [[5]]
#>  [1] 6.321781 3.880289 5.514600 3.490900 6.532741 5.429147 5.122103
#>  [8] 3.861988 4.441985 6.052539
#> 
#> [[6]]
#>  [1] 6.677684 6.038500 5.643619 6.782844 6.804412 4.099939 6.935784
#>  [8] 5.690948 6.263067 4.209408
#> 
#> [[7]]
#>  [1] 6.211741 5.866978 7.363653 6.714112 7.517669 6.897091 6.025930
#>  [8] 8.270672 7.960865 7.768721
#> 
#> [[8]]
#>  [1]  9.035931  7.526113  6.724665  7.694379 10.211769  6.958332
#>  [7]  6.853476  6.324673  9.525939  8.554186
#> 
#> [[9]]
#>  [1] 10.993110  8.845879 11.564408 10.061999 10.142695 10.123839
#>  [7]  8.602999  8.176739  8.421115 10.763789
#> 
#> [[10]]
#>  [1] 10.132992 10.376499 11.138708 11.241263 10.612091  9.570620
#>  [7] 11.360461  9.929143  9.727846  7.553320
#> 

# Simplify output to a vector instead of a list by computing the mean of the distributions
1:10 |>
  map(rnorm, n = 10) |>  # output a list
  map_dbl(mean)           # output an atomic vector
#>  [1]  0.7483032  1.9289496  2.8461081  3.9944891  5.0055171  5.7423877
#>  [7]  6.6846082  8.6550474  9.2117627 10.1718634

# Using set_names() with character vectors is handy to keep track
# of the original inputs:
set_names(c("foo", "bar")) |> map_chr(paste0, ":suffix")
#>          foo          bar 
#> "foo:suffix" "bar:suffix" 

# Working with lists
favorite_desserts <- list(Sophia = "banana bread", Eliott = "pancakes", Karina = "chocolate cake")
favorite_desserts |> map_chr(\(food) paste(food, "rocks!"))
#>                  Sophia                  Eliott 
#>   "banana bread rocks!"       "pancakes rocks!" 
#>                  Karina 
#> "chocolate cake rocks!" 

# Extract by name or position
# .default specifies value for elements that are missing or NULL
l1 <- list(list(a = 1L), list(a = NULL, b = 2L), list(b = 3L))
l1 |> map("a", .default = "???")
#> [[1]]
#> [1] 1
#> 
#> [[2]]
#> [1] "???"
#> 
#> [[3]]
#> [1] "???"
#> 
l1 |> map_int("b", .default = NA)
#> [1] NA  2  3
l1 |> map_int(2, .default = NA)
#> [1] NA  2 NA

# Supply multiple values to index deeply into a list
l2 <- list(
  list(num = 1:3,     letters[1:3]),
  list(num = 101:103, letters[4:6]),
  list()
)
l2 |> map(c(2, 2))
#> [[1]]
#> [1] "b"
#> 
#> [[2]]
#> [1] "e"
#> 
#> [[3]]
#> NULL
#> 

# Use a list to build an extractor that mixes numeric indices and names,
# and .default to provide a default value if the element does not exist
l2 |> map(list("num", 3))
#> [[1]]
#> [1] 3
#> 
#> [[2]]
#> [1] 103
#> 
#> [[3]]
#> NULL
#> 
l2 |> map_int(list("num", 3), .default = NA)
#> [1]   3 103  NA

# Working with data frames
# Use map_lgl(), map_dbl(), etc to return a vector instead of a list:
mtcars |> map_dbl(sum)
#>      mpg      cyl     disp       hp     drat       wt     qsec 
#>  642.900  198.000 7383.100 4694.000  115.090  102.952  571.160 
#>       vs       am     gear     carb 
#>   14.000   13.000  118.000   90.000 

# A more realistic example: split a data frame into pieces, fit a
# model to each piece, summarise and extract R^2
mtcars |>
  split(mtcars$cyl) |>
  map(\(df) lm(mpg ~ wt, data = df)) |>
  map(summary) |>
  map_dbl("r.squared")
#>         4         6         8 
#> 0.5086326 0.4645102 0.4229655 

if (FALSE) { # interactive() && rlang::is_installed("mirai") && rlang::is_installed("carrier")
# Run in interactive sessions only as spawns additional processes

# To use parallelized map:
# 1. Set daemons (number of parallel processes) first:
mirai::daemons(2)

# 2. Wrap .f with in_parallel():
mtcars |> map_dbl(in_parallel(\(x) mean(x)))

# Note that functions from packages should be fully qualified with `pkg::`
# or call `library(pkg)` within the function
1:10 |>
  map(in_parallel(\(x) vctrs::vec_init(integer(), x))) |>
  map_int(in_parallel(\(x) { library(vctrs); vec_size(x) }))

# A locally-defined function (or any required variables)
# should be passed via ... of in_parallel():
slow_lm <- function(formula, data) {
  Sys.sleep(0.5)
  lm(formula, data)
}

mtcars |>
  split(mtcars$cyl) |>
  map(in_parallel(\(df) slow_lm(mpg ~ disp, data = df), slow_lm = slow_lm))

# Tear down daemons when no longer in use:
mirai::daemons(0)
}
```
