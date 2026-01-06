# Coerce a list to a vector

**\[superseded\]**

These functions were superseded in purrr 1.0.0 in favour of
[`list_simplify()`](https://purrr.tidyverse.org/dev/reference/list_simplify.md)
which has more consistent semantics based on vctrs principles:

- `as_vector(x)` is now `list_simplify(x)`

- `simplify(x)` is now `list_simplify(x, strict = FALSE)`

- `simplify_all(x)` is `map(x, list_simplify, strict = FALSE)`

Superseded functions will not go away, but will only receive critical
bug fixes.

## Usage

``` r
as_vector(.x, .type = NULL)

simplify(.x, .type = NULL)

simplify_all(.x, .type = NULL)
```

## Arguments

- .x:

  A list of vectors

- .type:

  Can be a vector mold specifying both the type and the length of the
  vectors to be concatenated, such as `numeric(1)` or `integer(4)`.
  Alternatively, it can be a string describing the type, one of:
  "logical", "integer", "double", "complex", "character" or "raw".

## Examples

``` r
# was
as.list(letters) |> as_vector("character")
#>  [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p"
#> [17] "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"
# now
as.list(letters) |> list_simplify(ptype = character())
#>  [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p"
#> [17] "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"

# was:
list(1:2, 3:4, 5:6) |> as_vector(integer(2))
#> [1] 1 2 3 4 5 6
# now:
list(1:2, 3:4, 5:6) |> list_c(ptype = integer())
#> [1] 1 2 3 4 5 6
```
