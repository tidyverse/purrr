# Find the value or position of the first match

Find the value or position of the first match

## Usage

``` r
detect(.x, .f, ..., .dir = c("forward", "backward"), .default = NULL)

detect_index(.x, .f, ..., .dir = c("forward", "backward"))
```

## Arguments

- .x:

  A list or vector.

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

- ...:

  Additional arguments passed on to `.p`.

- .dir:

  If `"forward"`, the default, starts at the beginning of the vector and
  move towards the end; if `"backward"`, starts at the end of the vector
  and moves towards the beginning.

- .default:

  The value returned when nothing is detected.

## Value

`detect` the value of the first item that matches the predicate;
`detect_index` the position of the matching item. If not found, `detect`
returns `NULL` and `detect_index` returns 0.

## See also

[`keep()`](https://purrr.tidyverse.org/reference/keep.md) for keeping
all matching values.

## Examples

``` r
is_even <- function(x) x %% 2 == 0

3:10 |> detect(is_even)
#> [1] 4
3:10 |> detect_index(is_even)
#> [1] 2

3:10 |> detect(is_even, .dir = "backward")
#> [1] 10
3:10 |> detect_index(is_even, .dir = "backward")
#> [1] 8


# Since `.f` is passed to as_mapper(), you can supply a pluck object:
x <- list(
  list(1, foo = FALSE),
  list(2, foo = TRUE),
  list(3, foo = TRUE)
)

detect(x, "foo")
#> [[1]]
#> [1] 2
#> 
#> $foo
#> [1] TRUE
#> 
detect_index(x, "foo")
#> [1] 2


# If you need to find all values, use keep():
keep(x, "foo")
#> [[1]]
#> [[1]][[1]]
#> [1] 2
#> 
#> [[1]]$foo
#> [1] TRUE
#> 
#> 
#> [[2]]
#> [[2]][[1]]
#> [1] 3
#> 
#> [[2]]$foo
#> [1] TRUE
#> 
#> 

# If you need to find all positions, use map_lgl():
which(map_lgl(x, "foo"))
#> [1] 2 3
```
