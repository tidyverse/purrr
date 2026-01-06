# Modify a pluck location

- `assign_in()` takes a data structure and a
  [pluck](https://purrr.tidyverse.org/dev/reference/pluck.md) location,
  assigns a value there, and returns the modified data structure.

- `modify_in()` applies a function to a pluck location, assigns the
  result back to that location with `assign_in()`, and returns the
  modified data structure.

## Usage

``` r
modify_in(.x, .where, .f, ...)

assign_in(x, where, value)
```

## Arguments

- .x, x:

  A vector or environment

- .where, where:

  A pluck location, as a numeric vector of positions, a character vector
  of names, or a list combining both. The location must exist in the
  data structure.

- .f:

  A function to apply at the pluck location given by `.where`.

- ...:

  Arguments passed to `.f`.

- value:

  A value to replace in `.x` at the pluck location. Use
  [`zap()`](https://rlang.r-lib.org/reference/zap.html) to instead
  remove the element.

## See also

[`pluck()`](https://purrr.tidyverse.org/dev/reference/pluck.md)

## Examples

``` r
# Recall that pluck() returns a component of a data structure that
# might be arbitrarily deep
x <- list(list(bar = 1, foo = 2))
pluck(x, 1, "foo")
#> [1] 2

# Use assign_in() to modify the pluck location:
str(assign_in(x, list(1, "foo"), 100))
#> List of 1
#>  $ :List of 2
#>   ..$ bar: num 1
#>   ..$ foo: num 100
# Or zap to remove it
str(assign_in(x, list(1, "foo"), zap()))
#> List of 1
#>  $ :List of 1
#>   ..$ bar: num 1

# Like pluck(), this works even when the element (or its parents) don't exist
pluck(x, 1, "baz")
#> NULL
str(assign_in(x, list(2, "baz"), 100))
#> List of 2
#>  $ :List of 2
#>   ..$ bar: num 1
#>   ..$ foo: num 2
#>  $ :List of 1
#>   ..$ baz: num 100

# modify_in() applies a function to that location and update the
# element in place:
modify_in(x, list(1, "foo"), \(x) x * 200)
#> [[1]]
#> [[1]]$bar
#> [1] 1
#> 
#> [[1]]$foo
#> [1] 400
#> 
#> 

# Additional arguments are passed to the function in the ordinary way:
modify_in(x, list(1, "foo"), `+`, 100)
#> [[1]]
#> [[1]]$bar
#> [1] 1
#> 
#> [[1]]$foo
#> [1] 102
#> 
#> 
```
