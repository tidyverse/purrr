# Recursively modify a list

`modify_tree()` allows you to recursively modify a list, supplying
functions that either modify each leaf or each node (or both).

## Usage

``` r
modify_tree(
  x,
  ...,
  leaf = identity,
  is_node = NULL,
  pre = identity,
  post = identity
)
```

## Arguments

- x:

  A list.

- ...:

  Reserved for future use. Must be empty

- leaf:

  A function applied to each leaf.

- is_node:

  A predicate function that determines whether an element is a node (by
  returning `TRUE`) or a leaf (by returning `FALSE`). The default value,
  `NULL`, treats simple lists as nodes and everything else (including
  richer objects like data frames and linear models) as leaves, using
  [`vctrs::obj_is_list()`](https://vctrs.r-lib.org/reference/obj_is_list.html).
  To recurse into all objects built on lists use
  [`is.list()`](https://rdrr.io/r/base/list.html).

- pre, post:

  Functions applied to each node. `pre` is applied on the way "down",
  i.e. before the leaves are transformed with `leaf`, while `post` is
  applied on the way "up", i.e. after the leaves are transformed.

## See also

Other modify variants:
[`map_depth()`](https://purrr.tidyverse.org/reference/map_depth.md),
[`modify()`](https://purrr.tidyverse.org/reference/modify.md)

## Examples

``` r
x <- list(list(a = 2:1, c = list(b1 = 2), b = list(c2 = 3, c1 = 4)))
x |> str()
#> List of 1
#>  $ :List of 3
#>   ..$ a: int [1:2] 2 1
#>   ..$ c:List of 1
#>   .. ..$ b1: num 2
#>   ..$ b:List of 2
#>   .. ..$ c2: num 3
#>   .. ..$ c1: num 4

# Transform each leaf
x |> modify_tree(leaf = \(x) x + 100) |>  str()
#> List of 1
#>  $ :List of 3
#>   ..$ a: num [1:2] 102 101
#>   ..$ c:List of 1
#>   .. ..$ b1: num 102
#>   ..$ b:List of 2
#>   .. ..$ c2: num 103
#>   .. ..$ c1: num 104

# Recursively sort the nodes
sort_named <- function(x) {
  nms <- names(x)
  if (!is.null(nms)) {
    x[order(nms)]
  } else {
    x
   }
}
x |> modify_tree(post = sort_named) |> str()
#> List of 1
#>  $ :List of 3
#>   ..$ a: int [1:2] 2 1
#>   ..$ b:List of 2
#>   .. ..$ c1: num 4
#>   .. ..$ c2: num 3
#>   ..$ c:List of 1
#>   .. ..$ b1: num 2
```
