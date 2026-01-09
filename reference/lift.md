# Lift the domain of a function

**\[deprecated\]**

`lift_xy()` is a composition helper. It helps you compose functions by
lifting their domain from a kind of input to another kind. The domain
can be changed from and to a list (l), a vector (v) and dots (d). For
example, `lift_ld(fun)` transforms a function taking a list to a
function taking dots.

The most important of those helpers is probably `lift_dl()` because it
allows you to transform a regular function to one that takes a list.
This is often essential for composition with purrr functional tools.
Since this is such a common function, `lift()` is provided as an alias
for that operation.

These functions were superseded in purrr 1.0.0 because we no longer
believe "lifting" to be a mainstream operation, and we are striving to
reduce purrr to its most useful core. Superseded functions will not go
away, but will only receive critical bug fixes.

## Usage

``` r
lift(..f, ..., .unnamed = FALSE)

lift_dl(..f, ..., .unnamed = FALSE)

lift_dv(..f, ..., .unnamed = FALSE)

lift_vl(..f, ..., .type)

lift_vd(..f, ..., .type)

lift_ld(..f, ...)

lift_lv(..f, ...)
```

## Arguments

- ..f:

  A function to lift.

- ...:

  Default arguments for `..f`. These will be evaluated only once, when
  the lifting factory is called.

- .unnamed:

  If `TRUE`, `ld` or `lv` will not name the parameters in the lifted
  function signature. This prevents matching of arguments by name and
  match by position instead.

- .type:

  Can be a vector mold specifying both the type and the length of the
  vectors to be concatenated, such as `numeric(1)` or `integer(4)`.
  Alternatively, it can be a string describing the type, one of:
  "logical", "integer", "double", "complex", "character" or "raw".

## Value

A function.

## from ... to `list(...)` or `c(...)`

Here dots should be taken here in a figurative way. The lifted functions
does not need to take dots per se. The function is simply wrapped a
function in [`do.call()`](https://rdrr.io/r/base/do.call.html), so
instead of taking multiple arguments, it takes a single named list or
vector which will be interpreted as its arguments. This is particularly
useful when you want to pass a row of a data frame or a list to a
function and don't want to manually pull it apart in your function.

## from `c(...)` to `list(...)` or `...`

These factories allow a function taking a vector to take a list or dots
instead. The lifted function internally transforms its inputs back to an
atomic vector. purrr does not obey the usual R casting rules (e.g.,
`c(1, "2")` produces a character vector) and will produce an error if
the types are not compatible. Additionally, you can enforce a particular
vector type by supplying `.type`.

## from list(...) to c(...) or ...

`lift_ld()` turns a function that takes a list into a function that
takes dots. `lift_vd()` does the same with a function that takes an
atomic vector. These factory functions are the inverse operations of
`lift_dl()` and `lift_dv()`.

`lift_vd()` internally coerces the inputs of `..f` to an atomic vector.
The details of this coercion can be controlled with `.type`.

## See also

[`invoke()`](https://purrr.tidyverse.org/reference/invoke.md)

## Examples

``` r
### Lifting from ... to list(...) or c(...)

x <- list(x = c(1:100, NA, 1000), na.rm = TRUE, trim = 0.9)
lift_dl(mean)(x)
#> [1] 51
# You can also use the lift() alias for this common operation:
lift(mean)(x)
#> [1] 51
# now:
exec(mean, !!!x)
#> [1] 51

# Default arguments can also be specified directly in lift_dl()
list(c(1:100, NA, 1000)) |> lift_dl(mean, na.rm = TRUE)()
#> [1] 59.90099
# now:
mean(c(1:100, NA, 1000), na.rm = TRUE)
#> [1] 59.90099

# lift_dl() and lift_ld() are inverse of each other.
# Here we transform sum() so that it takes a list
fun <- sum |> lift_dl()
fun(list(3, NA, 4, na.rm = TRUE))
#> [1] 7
# now:
fun <- function(x) exec("sum", !!!x)
exec(sum, 3, NA, 4, na.rm = TRUE)
#> [1] 7
### Lifting from c(...) to list(...) or ...

# In other situations we need the vector-valued function to take a
# variable number of arguments as with pmap(). This is a job for
# lift_vd():
pmap_dbl(mtcars, lift_vd(mean))
#> Warning: `lift_vd()` was deprecated in purrr 1.0.0.
#>  [1] 29.90727 29.98136 23.59818 38.73955 53.66455 35.04909 59.72000
#>  [8] 24.63455 27.23364 31.86000 31.78727 46.43091 46.50000 46.35000
#> [15] 66.23273 66.05855 65.97227 19.44091 17.74227 18.81409 24.88864
#> [22] 47.24091 46.00773 58.75273 57.37955 18.92864 24.77909 24.88027
#> [29] 60.97182 34.50818 63.15545 26.26273
# now
pmap_dbl(mtcars, \(...) mean(c(...)))
#>  [1] 29.90727 29.98136 23.59818 38.73955 53.66455 35.04909 59.72000
#>  [8] 24.63455 27.23364 31.86000 31.78727 46.43091 46.50000 46.35000
#> [15] 66.23273 66.05855 65.97227 19.44091 17.74227 18.81409 24.88864
#> [22] 47.24091 46.00773 58.75273 57.37955 18.92864 24.77909 24.88027
#> [29] 60.97182 34.50818 63.15545 26.26273
### Lifting from list(...) to c(...) or ...

# This kind of lifting is sometimes needed for function
# composition. An example would be to use pmap() with a function
# that takes a list. In the following, we use some() on each row of
# a data frame to check they each contain at least one element
# satisfying a condition:
mtcars |> pmap_lgl(lift_ld(some, partial(`<`, 200)))
#> Warning: `lift_ld()` was deprecated in purrr 1.0.0.
#>  [1] FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
#> [12]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE
#> [23]  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE  TRUE FALSE
# now
mtcars |> pmap_lgl(\(...) any(c(...) > 200))
#>  [1] FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
#> [12]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE
#> [23]  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE  TRUE FALSE
```
