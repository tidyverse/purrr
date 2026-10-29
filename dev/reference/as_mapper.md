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

  A function, specified in one of the following ways:

  - A named function, e.g. `mean`.

  - An anonymous function, e.g. `\(x) x + 1` or `function(x) x + 1`.

  - A string, integer, or list, e.g. `"idx"`, `1`, or `list("idx", 1)`
    which are converted to extractor functions, i.e.
    `\(x) pluck(x, "idx")`, `\(x) pluck(x, 1)`, and
    `\(x) pluck(x, "idx", 1)` respectively. Character vectors index by
    name and numeric vectors index by position; use a list to index by
    position and name at different levels. If a component is not
    present, the value of `.default` will be returned.

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
#> <environment: 0x5570b1e2b900>
as_mapper(1)
#> function (x, ...) 
#> pluck_raw(x, list(1), .default = NULL)
#> <environment: 0x5570b1c68aa8>

as_mapper(c("a", "b", "c"))
#> function (x, ...) 
#> pluck_raw(x, list("a", "b", "c"), .default = NULL)
#> <environment: 0x5570b1bf92b8>
# Equivalent to function(x) x[["a"]][["b"]][["c"]]

as_mapper(list(1, "a", 2))
#> function (x, ...) 
#> pluck_raw(x, list(1, "a", 2), .default = NULL)
#> <environment: 0x5570b18ebb00>
# Equivalent to function(x) x[[1]][["a"]][[2]]

as_mapper(list(1, attr_getter("a")))
#> function (x, ...) 
#> pluck_raw(x, list(1, function (x) 
#> attr(x, attr, exact = TRUE)), .default = NULL)
#> <environment: 0x5570b183b5e8>
# Equivalent to function(x) attr(x[[1]], "a")

as_mapper(c("a", "b", "c"), .default = NA)
#> function (x, ...) 
#> pluck_raw(x, list("a", "b", "c"), .default = NA)
#> <environment: 0x5570b173c1e8>
```
