# Splice objects and lists of objects into a list

**\[defunct\]**

This function was deprecated in purrr 1.0.0 and is now defunct because
we no longer believe that this style of implicit/automatic splicing is a
good idea; instead use
[`rlang::list2()`](https://rlang.r-lib.org/reference/list2.html) + `!!!`
or
[`list_flatten()`](https://purrr.tidyverse.org/dev/reference/list_flatten.md).

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

# Instead of splice(inputs, arg3 = c("c1", "c2")), use:
list(inputs, arg3 = c("c1", "c2")) |> list_flatten() |> str()
#> List of 3
#>  $ arg1: chr "a"
#>  $ arg2: chr "b"
#>  $ arg3: chr [1:2] "c1" "c2"
rlang::list2(!!!inputs, arg3 = c("c1", "c2")) |> str()
#> List of 3
#>  $ arg1: chr "a"
#>  $ arg2: chr "b"
#>  $ arg3: chr [1:2] "c1" "c2"
```
