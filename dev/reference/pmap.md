# Map over multiple input simultaneously (in "parallel")

These functions are variants of
[`map()`](https://purrr.tidyverse.org/dev/reference/map.md) that iterate
over multiple arguments simultaneously. They are parallel in the sense
that each input is processed in parallel with the others, not in the
sense of multicore computing, i.e. they share the same notion of
"parallel" as [`base::pmax()`](https://rdrr.io/r/base/Extremes.html) and
[`base::pmin()`](https://rdrr.io/r/base/Extremes.html).

## Usage

``` r
pmap(.l, .f, ..., .progress = FALSE)

pmap_lgl(.l, .f, ..., .progress = FALSE)

pmap_int(.l, .f, ..., .progress = FALSE)

pmap_dbl(.l, .f, ..., .progress = FALSE)

pmap_chr(.l, .f, ..., .progress = FALSE)

pmap_vec(.l, .f, ..., .ptype = NULL, .progress = FALSE)

pwalk(.l, .f, ..., .progress = FALSE)
```

## Arguments

- .l:

  A list of vectors. The length of `.l` determines the number of
  arguments that `.f` will be called with. Arguments will be supply by
  position if unnamed, and by name if named.

  Vectors of length 1 will be recycled to any length; all other elements
  must be have the same length.

  A data frame is an important special case of `.l`. It will cause `.f`
  to be called once for each row.

- .f:

  A function, specified in one of the following ways:

  - A named function.

  - An anonymous function, e.g. `\(x, y, z) x + y / z` or
    `function(x, y, z) x + y / z`

  - A formula, e.g. `~ ..1 + ..2 / ..3`. No longer recommended.

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

The output length is determined by the maximum length of all elements of
`.l`. The output names are determined by the names of the first element
of `.l`. The output type is determined by the suffix:

- No suffix: a list; `.f()` can return anything.

- `_lgl()`, `_int()`, `_dbl()`, `_chr()` return a logical, integer,
  double, or character vector respectively; `.f()` must return a
  compatible atomic vector of length 1.

- `_vec()` return an atomic or S3 vector, the same type that `.f`
  returns. `.f` can return pretty much any type of vector, as long as it
  is length 1.

- `pwalk()` returns the input `.l` (invisibly). This makes it easy to
  use in a pipe. The return value of `.f()` is ignored.

Any errors thrown by `.f` will be wrapped in an error with class
[purrr_error_indexed](https://purrr.tidyverse.org/dev/reference/purrr_error_indexed.md).

## See also

Other map variants:
[`imap()`](https://purrr.tidyverse.org/dev/reference/imap.md),
[`lmap()`](https://purrr.tidyverse.org/dev/reference/lmap.md),
[`map()`](https://purrr.tidyverse.org/dev/reference/map.md),
[`map2()`](https://purrr.tidyverse.org/dev/reference/map2.md),
[`map_depth()`](https://purrr.tidyverse.org/dev/reference/map_depth.md),
[`map_if()`](https://purrr.tidyverse.org/dev/reference/map_if.md),
[`modify()`](https://purrr.tidyverse.org/dev/reference/modify.md)

## Examples

``` r
x <- list(1, 1, 1)
y <- list(10, 20, 30)
z <- list(100, 200, 300)
pmap(list(x, y, z), sum)
#> [[1]]
#> [1] 111
#> 
#> [[2]]
#> [1] 221
#> 
#> [[3]]
#> [1] 331
#> 

# Matching arguments by position
pmap(list(x, y, z), function(first, second, third) (first + third) * second)
#> [[1]]
#> [1] 1010
#> 
#> [[2]]
#> [1] 4020
#> 
#> [[3]]
#> [1] 9030
#> 

# Matching arguments by name
l <- list(a = x, b = y, c = z)
pmap(l, function(c, b, a) (a + c) * b)
#> [[1]]
#> [1] 1010
#> 
#> [[2]]
#> [1] 4020
#> 
#> [[3]]
#> [1] 9030
#> 

# Vectorizing a function over multiple arguments
df <- data.frame(
  x = c("apple", "banana", "cherry"),
  pattern = c("p", "n", "h"),
  replacement = c("P", "N", "H"),
  stringsAsFactors = FALSE
  )
pmap(df, gsub)
#> [[1]]
#> [1] "aPPle"
#> 
#> [[2]]
#> [1] "baNaNa"
#> 
#> [[3]]
#> [1] "cHerry"
#> 
pmap_chr(df, gsub)
#> [1] "aPPle"  "baNaNa" "cHerry"

# Use `...` to absorb unused components of input list .l
df <- data.frame(
  x = 1:3,
  y = 10:12,
  z = letters[1:3]
)
plus <- function(x, y) x + y
if (FALSE) { # \dontrun{
# this won't work
pmap(df, plus)
} # }
# but this will
plus2 <- function(x, y, ...) x + y
pmap_dbl(df, plus2)
#> [1] 11 13 15

# The "p" for "parallel" in pmap() is the same as in base::pmin()
# and base::pmax()
df <- data.frame(
  x = c(1, 2, 5),
  y = c(5, 4, 8)
)
# all produce the same result
pmin(df$x, df$y)
#> [1] 1 2 5
map2_dbl(df$x, df$y, min)
#> [1] 1 2 5
pmap_dbl(df, min)
#> [1] 1 2 5
```
