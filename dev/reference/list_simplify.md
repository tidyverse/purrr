# Simplify a list to an atomic or S3 vector

Simplification maintains a one-to-one correspondence between the input
and output, implying that each element of `x` must contain a one element
vector or a one-row data frame. If you don't want to maintain this
correspondence, then you probably want either
[`list_c()`](https://purrr.tidyverse.org/dev/reference/list_c.md)/[`list_rbind()`](https://purrr.tidyverse.org/dev/reference/list_c.md)
or
[`list_flatten()`](https://purrr.tidyverse.org/dev/reference/list_flatten.md).

## Usage

``` r
list_simplify(x, ..., strict = TRUE, ptype = NULL)
```

## Arguments

- x:

  A list.

- ...:

  These dots are for future extensions and must be empty.

- strict:

  What should happen if simplification fails? If `TRUE` (the default) it
  will error. If `FALSE` and `ptype` is not supplied, it will return `x`
  unchanged.

- ptype:

  An optional prototype to ensure that the output type is always the
  same.

## Value

A vector the same length as `x`.

## Examples

``` r
list_simplify(list(1, 2, 3))
#> [1] 1 2 3

# Only works when vectors are length one and have compatible types:
try(list_simplify(list(1, 2, 1:3)))
#> Error in list_simplify(list(1, 2, 1:3)) : 
#>   `x[[3]]` must have size 1, not size 3.
try(list_simplify(list(1, 2, "x")))
#> Error in list_simplify(list(1, 2, "x")) : 
#>   Can't combine `<list>[[1]]` <double> and `<list>[[3]]` <character>.

# Unless you strict = FALSE, in which case you get the input back:
list_simplify(list(1, 2, 1:3), strict = FALSE)
#> [[1]]
#> [1] 1
#> 
#> [[2]]
#> [1] 2
#> 
#> [[3]]
#> [1] 1 2 3
#> 
list_simplify(list(1, 2, "x"), strict = FALSE)
#> [[1]]
#> [1] 1
#> 
#> [[2]]
#> [1] 2
#> 
#> [[3]]
#> [1] "x"
#> 
```
