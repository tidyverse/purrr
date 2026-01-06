# Do every, some, or none of the elements of a list satisfy a predicate?

- `some()` returns `TRUE` when `.p` is `TRUE` for at least one element.

- `every()` returns `TRUE` when `.p` is `TRUE` for all elements.

- `none()` returns `TRUE` when `.p` is `FALSE` for all elements.

## Usage

``` r
every(.x, .p, ...)

some(.x, .p, ...)

none(.x, .p, ...)
```

## Arguments

- .x:

  A list or vector.

- .p:

  A predicate function (i.e. a function that returns either `TRUE` or
  `FALSE`) specified in one of the following ways:

  - A named function, e.g. `is.character`.

  - An anonymous function, e.g. `\(x) all(x < 0)` or
    `function(x) all(x < 0)`.

  - A formula, e.g. `~ all(.x < 0)`. Use `.x` to refer to the first
    argument. No longer recommended.

- ...:

  Additional arguments passed on to `.p`.

## Value

A logical vector of length 1.

## Examples

``` r
x <- list(0:10, 5.5)
x |> every(is.numeric)
#> [1] TRUE
x |> every(is.integer)
#> [1] FALSE
x |> some(is.integer)
#> [1] TRUE
x |> none(is.character)
#> [1] TRUE

# Missing values are propagated:
some(list(NA, FALSE), identity)
#> [1] NA

# If you need to use these functions in a context where missing values are
# unsafe (e.g. in `if ()` conditions), make sure to use safe predicates:
if (some(list(NA, FALSE), rlang::is_true)) "foo" else "bar"
#> [1] "bar"
```
