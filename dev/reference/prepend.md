# Prepend a vector

**\[defunct\]**

This function was deprecated in purrr 1.0.0 and is now defunct because
it's not related to the core purpose of purrr.

This is a companion to [`append()`](https://rdrr.io/r/base/append.html)
to help merging two lists or atomic vectors. `prepend()` is a clearer
semantic signal than [`c()`](https://rdrr.io/r/base/c.html) that a
vector is to be merged at the beginning of another, especially in a pipe
chain.

## Usage

``` r
prepend(x, values, before = NULL)
```

## Arguments

- x:

  the vector to be modified.

- values:

  to be included in the modified vector.

- before:

  a subscript, before which the values are to be appended. If `NULL`,
  values will be appended at the beginning even for `x` of length 0.

## Value

A merged vector.

## Examples

``` r
x <- as.list(1:3)

# Instead of prepend(), use append():
x |> append("a", after = 0)
#> [[1]]
#> [1] "a"
#> 
#> [[2]]
#> [1] 1
#> 
#> [[3]]
#> [1] 2
#> 
#> [[4]]
#> [1] 3
#> 
x |> append(list("a", "b"), after = 2)
#> [[1]]
#> [1] 1
#> 
#> [[2]]
#> [1] 2
#> 
#> [[3]]
#> [1] "a"
#> 
#> [[4]]
#> [1] "b"
#> 
#> [[5]]
#> [1] 3
#> 
```
