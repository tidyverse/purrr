# Get an element deep within a nested data structure, failing if it doesn't exist

`chuck()` implements a generalised form of `[[` that allow you to index
deeply and flexibly into data structures. If the index you are trying to
access does not exist (or is `NULL`), it will throw (i.e. chuck) an
error.

## Usage

``` r
chuck(.x, ...)
```

## Arguments

- .x:

  A vector or environment

- ...:

  A list of accessors for indexing into the object. Can be an positive
  integer, a negative integer (to index from the right), a string (to
  index into names), or an accessor function (except for the assignment
  variants which only support names and positions). If the object being
  indexed is an S4 object, accessing it by name will return the
  corresponding slot.

  [Dynamic dots](https://rlang.r-lib.org/reference/dyn-dots.html) are
  supported. In particular, if your accessors are stored in a list, you
  can splice that in with `!!!`.

## See also

[`pluck()`](https://purrr.tidyverse.org/reference/pluck.md) for a quiet
equivalent.

## Examples

``` r
x <- list(a = 1, b = 2)

# When indexing an element that doesn't exist `[[` sometimes returns NULL:
x[["y"]]
#> NULL
# and sometimes errors:
try(x[[3]])
#> Error in x[[3]] : subscript out of bounds

# chuck() consistently errors:
try(chuck(x, "y"))
#> Error in chuck(x, "y") : Can't find name `y` in vector.
try(chuck(x, 3))
#> Error in chuck(x, 3) : 
#>   Index 1 exceeds the length of plucked object (3 > 2).
```
