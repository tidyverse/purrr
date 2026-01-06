# Modify a list

- `list_assign()` modifies the elements of a list by name or position.

- `list_modify()` modifies the elements of a list recursively.

- `list_merge()` merges the elements of a list recursively.

`list_modify()` is inspired by
[`utils::modifyList()`](https://rdrr.io/r/utils/modifyList.html).

## Usage

``` r
list_assign(.x, ..., .is_node = NULL)

list_modify(.x, ..., .is_node = NULL)

list_merge(.x, ..., .is_node = NULL)
```

## Arguments

- .x:

  List to modify.

- ...:

  New values of a list. Use
  [`zap()`](https://rlang.r-lib.org/reference/zap.html) to remove
  values.

  These values should be either all named or all unnamed. When inputs
  are all named, they are matched to `.x` by name. When they are all
  unnamed, they are matched by position.

  [Dynamic dots](https://rlang.r-lib.org/reference/dyn-dots.html) are
  supported. In particular, if your replacement values are stored in a
  list, you can splice that in with `!!!`.

- .is_node:

  A predicate function that determines whether an element is a node (by
  returning `TRUE`) or a leaf (by returning `FALSE`). The default value,
  `NULL`, treats simple lists as nodes and everything else (including
  richer objects like data frames and linear models) as leaves, using
  [`vctrs::obj_is_list()`](https://vctrs.r-lib.org/reference/obj_is_list.html).
  To recurse into all objects built on lists use
  [`is.list()`](https://rdrr.io/r/base/list.html).

## Examples

``` r
x <- list(x = 1:10, y = 4, z = list(a = 1, b = 2))
str(x)
#> List of 3
#>  $ x: int [1:10] 1 2 3 4 5 6 7 8 9 10
#>  $ y: num 4
#>  $ z:List of 2
#>   ..$ a: num 1
#>   ..$ b: num 2

# Update values
str(list_assign(x, a = 1))
#> List of 4
#>  $ x: int [1:10] 1 2 3 4 5 6 7 8 9 10
#>  $ y: num 4
#>  $ z:List of 2
#>   ..$ a: num 1
#>   ..$ b: num 2
#>  $ a: num 1

# Replace values
str(list_assign(x, z = 5))
#> List of 3
#>  $ x: int [1:10] 1 2 3 4 5 6 7 8 9 10
#>  $ y: num 4
#>  $ z: num 5
str(list_assign(x, z = NULL))
#> List of 3
#>  $ x: int [1:10] 1 2 3 4 5 6 7 8 9 10
#>  $ y: num 4
#>  $ z: NULL
str(list_assign(x, z = list(a = 1:5)))
#> List of 3
#>  $ x: int [1:10] 1 2 3 4 5 6 7 8 9 10
#>  $ y: num 4
#>  $ z:List of 1
#>   ..$ a: int [1:5] 1 2 3 4 5

# Replace recursively with list_modify(), leaving the other elements of z alone
str(list_modify(x, z = list(a = 1:5)))
#> List of 3
#>  $ x: int [1:10] 1 2 3 4 5 6 7 8 9 10
#>  $ y: num 4
#>  $ z:List of 2
#>   ..$ a: int [1:5] 1 2 3 4 5
#>   ..$ b: num 2

# Remove values
str(list_assign(x, z = zap()))
#> List of 2
#>  $ x: int [1:10] 1 2 3 4 5 6 7 8 9 10
#>  $ y: num 4

# Combine values with list_merge()
str(list_merge(x, x = 11, z = list(a = 2:5, c = 3)))
#> List of 3
#>  $ x: num [1:11] 1 2 3 4 5 6 7 8 9 10 ...
#>  $ y: num 4
#>  $ z:List of 3
#>   ..$ a: num [1:5] 1 2 3 4 5
#>   ..$ b: num 2
#>   ..$ c: num 3

# All these functions support dynamic dots features. Use !!! to splice
# a list of arguments:
l <- list(new = 1, y = zap(), z = 5)
str(list_assign(x, !!!l))
#> List of 3
#>  $ x  : int [1:10] 1 2 3 4 5 6 7 8 9 10
#>  $ z  : num 5
#>  $ new: num 1
```
