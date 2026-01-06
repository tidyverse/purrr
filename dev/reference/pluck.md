# Safely get or set an element deep within a nested data structure

`pluck()` implements a generalised form of `[[` that allow you to index
deeply and flexibly into data structures. (If you're looking for an
equivalent of `[`, see
[`keep_at()`](https://purrr.tidyverse.org/dev/reference/keep_at.md).)
`pluck()` always succeeds, returning `.default` if the index you are
trying to access does not exist or is `NULL`. (If you're looking for a
variant that errors, try
[`chuck()`](https://purrr.tidyverse.org/dev/reference/chuck.md).)

`pluck<-()` is the assignment equivalent, allowing you to modify an
object deep within a nested data structure.

`pluck_exists()` tells you whether or not an object exists using the
same rules as pluck (i.e. a `NULL` element is equivalent to an absent
element).

## Usage

``` r
pluck(.x, ..., .default = NULL)

pluck(.x, ...) <- value

pluck_exists(.x, ...)
```

## Arguments

- .x, x:

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

- .default:

  Value to use if target is `NULL` or absent.

- value:

  A value to replace in `.x` at the pluck location. Use
  [`zap()`](https://rlang.r-lib.org/reference/zap.html) to instead
  remove the element.

## Details

- You can pluck or chuck with standard accessors like integer positions
  and string names, and also accepts arbitrary accessor functions, i.e.
  functions that take an object and return some internal piece.

  This is often more readable than a mix of operators and accessors
  because it reads linearly and is free of syntactic cruft. Compare:
  `accessor(x[[1]])$foo` to `pluck(x, 1, accessor, "foo")`.

- These accessors never partial-match. This is unlike `$` which will
  select the `disp` object if you write `mtcars$di`.

## See also

- [`attr_getter()`](https://purrr.tidyverse.org/dev/reference/attr_getter.md)
  for creating attribute getters suitable for use with `pluck()` and
  [`chuck()`](https://purrr.tidyverse.org/dev/reference/chuck.md).

- [`modify_in()`](https://purrr.tidyverse.org/dev/reference/modify_in.md)
  for applying a function to a plucked location.

- [`keep_at()`](https://purrr.tidyverse.org/dev/reference/keep_at.md) is
  similar to `pluck()`, but retain the structure of the list instead of
  converting it into a vector.

## Examples

``` r
# Let's create a list of data structures:
obj1 <- list("a", list(1, elt = "foo"))
obj2 <- list("b", list(2, elt = "bar"))
x <- list(obj1, obj2)

# pluck() provides a way of retrieving objects from such data
# structures using a combination of numeric positions, vector or
# list names, and accessor functions.

# Numeric positions index into the list by position, just like `[[`:
pluck(x, 1)
#> [[1]]
#> [1] "a"
#> 
#> [[2]]
#> [[2]][[1]]
#> [1] 1
#> 
#> [[2]]$elt
#> [1] "foo"
#> 
#> 
# same as x[[1]]

# Index from the back
pluck(x, -1)
#> [[1]]
#> [1] "b"
#> 
#> [[2]]
#> [[2]][[1]]
#> [1] 2
#> 
#> [[2]]$elt
#> [1] "bar"
#> 
#> 
# same as x[[2]]

pluck(x, 1, 2)
#> [[1]]
#> [1] 1
#> 
#> $elt
#> [1] "foo"
#> 
# same as x[[1]][[2]]

# Supply names to index into named vectors:
pluck(x, 1, 2, "elt")
#> [1] "foo"
# same as x[[1]][[2]][["elt"]]

# By default, pluck() consistently returns `NULL` when an element
# does not exist:
pluck(x, 10)
#> NULL
try(x[[10]])
#> Error in x[[10]] : subscript out of bounds

# You can also supply a default value for non-existing elements:
pluck(x, 10, .default = NA)
#> [1] NA

# The map() functions use pluck() by default to retrieve multiple
# values from a list:
map_chr(x, 1)
#> [1] "a" "b"
map_int(x, c(2, 1))
#> [1] 1 2

# pluck() also supports accessor functions:
my_element <- function(x) x[[2]]$elt
pluck(x, 1, my_element)
#> [1] "foo"
pluck(x, 2, my_element)
#> [1] "bar"

# Even for this simple data structure, this is more readable than
# the alternative form because it requires you to read both from
# right-to-left and from left-to-right in different parts of the
# expression:
my_element(x[[1]])
#> [1] "foo"

# If you have a list of accessors, you can splice those in with `!!!`:
idx <- list(1, my_element)
pluck(x, !!!idx)
#> [1] "foo"
```
