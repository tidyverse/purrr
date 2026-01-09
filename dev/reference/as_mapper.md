# Convert an object into a mapper function

`as_mapper` is the powerhouse behind the varied function specifications
that most purrr functions allow. It is an S3 generic. The default method
forwards its arguments to
[`rlang::as_function()`](https://rlang.r-lib.org/reference/as_function.html).

## Usage

``` r
as_mapper(.f, ...)

# S3 method for class 'character'
as_mapper(.f, ..., .null, .default = NULL)

# S3 method for class 'numeric'
as_mapper(.f, ..., .null, .default = NULL)

# S3 method for class 'list'
as_mapper(.f, ..., .null, .default = NULL)
```

## Arguments

- .f:

  A function, formula, or vector (not necessarily atomic).

  If a **function**, it is used as is.

  If a **formula**, e.g. `~ .x + 2`, it is converted to a function. No
  longer recommended.

  If **character vector**, **numeric vector**, or **list**, it is
  converted to an extractor function. Character vectors index by name
  and numeric vectors index by position; use a list to index by position
  and name at different levels. If a component is not present, the value
  of `.default` will be returned.

- ...:

  Additional arguments passed on to methods.

- .default, .null:

  Optional additional argument for extractor functions (i.e. when `.f`
  is character, integer, or list). Returned when value is absent (does
  not exist) or empty (has length 0). `.null` is deprecated; please use
  `.default` instead.

## Examples

``` r
as_mapper(\(x) x + 1)
#> function (x) 
#> x + 1
#> <environment: 0x563a73804100>
as_mapper(1)
#> function (x, ...) 
#> pluck_raw(x, list(1), .default = NULL)
#> <environment: 0x563a7383f7a0>

as_mapper(c("a", "b", "c"))
#> function (x, ...) 
#> pluck_raw(x, list("a", "b", "c"), .default = NULL)
#> <environment: 0x563a73877d58>
# Equivalent to function(x) x[["a"]][["b"]][["c"]]

as_mapper(list(1, "a", 2))
#> function (x, ...) 
#> pluck_raw(x, list(1, "a", 2), .default = NULL)
#> <environment: 0x563a738c0550>
# Equivalent to function(x) x[[1]][["a"]][[2]]

as_mapper(list(1, attr_getter("a")))
#> function (x, ...) 
#> pluck_raw(x, list(1, function (x) 
#> attr(x, attr, exact = TRUE)), .default = NULL)
#> <environment: 0x563a73903818>
# Equivalent to function(x) attr(x[[1]], "a")

as_mapper(c("a", "b", "c"), .default = NA)
#> function (x, ...) 
#> pluck_raw(x, list("a", "b", "c"), .default = NA)
#> <environment: 0x563a73948620>
```
