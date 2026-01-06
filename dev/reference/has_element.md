# Does a list contain an object?

Does a list contain an object?

## Usage

``` r
has_element(.x, .y)
```

## Arguments

- .x:

  A list or atomic vector.

- .y:

  Object to test for

## Examples

``` r
x <- list(1:10, 5, 9.9)
x |> has_element(1:10)
#> [1] TRUE
x |> has_element(3)
#> [1] FALSE
```
