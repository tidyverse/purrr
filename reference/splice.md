# Splice objects and lists of objects into a list

**\[deprecated\]**

This function was deprecated in purrr 1.0.0 because we no longer believe
that this style of implicit/automatic splicing is a good idea; instead
use [`rlang::list2()`](https://rlang.r-lib.org/reference/list2.html) +
`!!!` or
[`list_flatten()`](https://purrr.tidyverse.org/reference/list_flatten.md).

`splice()` splices all arguments into a list. Non-list objects and lists
with a S3 class are encapsulated in a list before concatenation.

## Usage

``` r
splice(...)
```

## Arguments

- ...:

  Objects to concatenate.

## Value

A list.

## Examples

``` r
inputs <- list(arg1 = "a", arg2 = "b")

# splice() concatenates the elements of inputs with arg3
splice(inputs, arg3 = c("c1", "c2")) |> str()
#> Warning: `splice()` was deprecated in purrr 1.0.0.
#> ℹ Please use `list_flatten()` instead.
#> List of 3
#>  $ arg1: chr "a"
#>  $ arg2: chr "b"
#>  $ arg3: chr [1:2] "c1" "c2"
list(inputs, arg3 = c("c1", "c2")) |> str()
#> List of 2
#>  $     :List of 2
#>   ..$ arg1: chr "a"
#>   ..$ arg2: chr "b"
#>  $ arg3: chr [1:2] "c1" "c2"
c(inputs, arg3 = c("c1", "c2")) |> str()
#> List of 4
#>  $ arg1 : chr "a"
#>  $ arg2 : chr "b"
#>  $ arg31: chr "c1"
#>  $ arg32: chr "c2"
```
