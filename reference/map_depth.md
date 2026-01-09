# Map/modify elements at given depth

`map_depth()` calls `map(.y, .f)` on all `.y` at the specified `.depth`
in `.x`. `modify_depth()` calls `modify(.y, .f)` on `.y` at the
specified `.depth` in `.x`.

## Usage

``` r
map_depth(.x, .depth, .f, ..., .ragged = .depth < 0, .is_node = NULL)

modify_depth(.x, .depth, .f, ..., .ragged = .depth < 0, .is_node = NULL)
```

## Arguments

- .x:

  A list or atomic vector.

- .depth:

  Level of `.x` to map on. Use a negative value to count up from the
  lowest level of the list.

  - `map_depth(x, 0, fun)` is equivalent to `fun(x)`.

  - `map_depth(x, 1, fun)` is equivalent to `x <- map(x, fun)`

  - `map_depth(x, 2, fun)` is equivalent to
    `x <- map(x, \(y) map(y, fun))`

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

  **\[experimental\]**

  Wrap a function with
  [`in_parallel()`](https://purrr.tidyverse.org/reference/in_parallel.md)
  to declare that it should be performed in parallel. See
  [`in_parallel()`](https://purrr.tidyverse.org/reference/in_parallel.md)
  for more details. Use of `...` is not permitted in this context.

- ...:

  Additional arguments passed on to the mapped function.

  We now generally recommend against using `...` to pass additional
  (constant) arguments to `.f`. Instead use a shorthand anonymous
  function:

      # Instead of
      x |> map(f, 1, 2, collapse = ",")
      # do:
      x |> map(\(x) f(x, 1, 2, collapse = ","))

  This makes it easier to understand which arguments belong to which
  function and will tend to yield better error messages.

- .ragged:

  If `TRUE`, will apply to leaves, even if they're not at depth
  `.depth`. If `FALSE`, will throw an error if there are no elements at
  depth `.depth`.

- .is_node:

  A predicate function that determines whether an element is a node (by
  returning `TRUE`) or a leaf (by returning `FALSE`). The default value,
  `NULL`, treats simple lists as nodes and everything else (including
  richer objects like data frames and linear models) as leaves, using
  [`vctrs::obj_is_list()`](https://vctrs.r-lib.org/reference/obj_is_list.html).
  To recurse into all objects built on lists use
  [`is.list()`](https://rdrr.io/r/base/list.html).

## See also

[`modify_tree()`](https://purrr.tidyverse.org/reference/modify_tree.md)
for a recursive version of `modify_depth()` that allows you to apply a
function to every leaf or every node.

Other map variants:
[`imap()`](https://purrr.tidyverse.org/reference/imap.md),
[`lmap()`](https://purrr.tidyverse.org/reference/lmap.md),
[`map()`](https://purrr.tidyverse.org/reference/map.md),
[`map2()`](https://purrr.tidyverse.org/reference/map2.md),
[`map_if()`](https://purrr.tidyverse.org/reference/map_if.md),
[`modify()`](https://purrr.tidyverse.org/reference/modify.md),
[`pmap()`](https://purrr.tidyverse.org/reference/pmap.md)

Other modify variants:
[`modify()`](https://purrr.tidyverse.org/reference/modify.md),
[`modify_tree()`](https://purrr.tidyverse.org/reference/modify_tree.md)

## Examples

``` r
# map_depth() -------------------------------------------------
# Use `map_depth()` to recursively traverse nested vectors and map
# a function at a certain depth:
x <- list(a = list(foo = 1:2, bar = 3:4), b = list(baz = 5:6))
x |> str()
#> List of 2
#>  $ a:List of 2
#>   ..$ foo: int [1:2] 1 2
#>   ..$ bar: int [1:2] 3 4
#>  $ b:List of 1
#>   ..$ baz: int [1:2] 5 6
x |> map_depth(2, \(y) paste(y, collapse = "/")) |> str()
#> List of 2
#>  $ a:List of 2
#>   ..$ foo: chr "1/2"
#>   ..$ bar: chr "3/4"
#>  $ b:List of 1
#>   ..$ baz: chr "5/6"

# Equivalent to:
x |> map(\(y) map(y, \(z) paste(z, collapse = "/"))) |> str()
#> List of 2
#>  $ a:List of 2
#>   ..$ foo: chr "1/2"
#>   ..$ bar: chr "3/4"
#>  $ b:List of 1
#>   ..$ baz: chr "5/6"

# When ragged is TRUE, `.f()` will also be passed leaves at depth < `.depth`
x <- list(1, list(1, list(1, list(1, 1))))
x |> str()
#> List of 2
#>  $ : num 1
#>  $ :List of 2
#>   ..$ : num 1
#>   ..$ :List of 2
#>   .. ..$ : num 1
#>   .. ..$ :List of 2
#>   .. .. ..$ : num 1
#>   .. .. ..$ : num 1
x |> map_depth(4, \(x) length(unlist(x)), .ragged = TRUE) |> str()
#> List of 2
#>  $ :List of 1
#>   ..$ : int 1
#>  $ :List of 2
#>   ..$ :List of 1
#>   .. ..$ : int 1
#>   ..$ :List of 2
#>   .. ..$ :List of 1
#>   .. .. ..$ : int 1
#>   .. ..$ :List of 2
#>   .. .. ..$ : int 1
#>   .. .. ..$ : int 1
x |> map_depth(3, \(x) length(unlist(x)), .ragged = TRUE) |> str()
#> List of 2
#>  $ :List of 1
#>   ..$ : int 1
#>  $ :List of 2
#>   ..$ :List of 1
#>   .. ..$ : int 1
#>   ..$ :List of 2
#>   .. ..$ : int 1
#>   .. ..$ : int 2
x |> map_depth(2, \(x) length(unlist(x)), .ragged = TRUE) |> str()
#> List of 2
#>  $ :List of 1
#>   ..$ : int 1
#>  $ :List of 2
#>   ..$ : int 1
#>   ..$ : int 3
x |> map_depth(1, \(x) length(unlist(x)), .ragged = TRUE) |> str()
#> List of 2
#>  $ : int 1
#>  $ : int 4
x |> map_depth(0, \(x) length(unlist(x)), .ragged = TRUE) |> str()
#>  int 5

# modify_depth() -------------------------------------------------
l1 <- list(
  obj1 = list(
    prop1 = list(param1 = 1:2, param2 = 3:4),
    prop2 = list(param1 = 5:6, param2 = 7:8)
  ),
  obj2 = list(
    prop1 = list(param1 = 9:10, param2 = 11:12),
    prop2 = list(param1 = 12:14, param2 = 15:17)
  )
)

# In the above list, "obj" is level 1, "prop" is level 2 and "param"
# is level 3. To apply sum() on all params, we map it at depth 3:
l1 |> modify_depth(3, sum) |> str()
#> List of 2
#>  $ obj1:List of 2
#>   ..$ prop1:List of 2
#>   .. ..$ param1: int 3
#>   .. ..$ param2: int 7
#>   ..$ prop2:List of 2
#>   .. ..$ param1: int 11
#>   .. ..$ param2: int 15
#>  $ obj2:List of 2
#>   ..$ prop1:List of 2
#>   .. ..$ param1: int 19
#>   .. ..$ param2: int 23
#>   ..$ prop2:List of 2
#>   .. ..$ param1: int 39
#>   .. ..$ param2: int 48

# modify() lets us pluck the elements prop1/param2 in obj1 and obj2:
l1 |> modify(c("prop1", "param2")) |> str()
#> List of 2
#>  $ obj1: int [1:2] 3 4
#>  $ obj2: int [1:2] 11 12

# But what if we want to pluck all param2 elements? Then we need to
# act at a lower level:
l1 |> modify_depth(2, "param2") |> str()
#> List of 2
#>  $ obj1:List of 2
#>   ..$ prop1: int [1:2] 3 4
#>   ..$ prop2: int [1:2] 7 8
#>  $ obj2:List of 2
#>   ..$ prop1: int [1:2] 11 12
#>   ..$ prop2: int [1:3] 15 16 17

# modify_depth() can be with other purrr functions to make them operate at
# a lower level. Here we ask pmap() to map paste() simultaneously over all
# elements of the objects at the second level. paste() is effectively
# mapped at level 3.
l1 |> modify_depth(2, \(x) pmap(x, paste, sep = " / ")) |> str()
#> List of 2
#>  $ obj1:List of 2
#>   ..$ prop1:List of 2
#>   .. ..$ : chr "1 / 3"
#>   .. ..$ : chr "2 / 4"
#>   ..$ prop2:List of 2
#>   .. ..$ : chr "5 / 7"
#>   .. ..$ : chr "6 / 8"
#>  $ obj2:List of 2
#>   ..$ prop1:List of 2
#>   .. ..$ : chr "9 / 11"
#>   .. ..$ : chr "10 / 12"
#>   ..$ prop2:List of 3
#>   .. ..$ : chr "12 / 15"
#>   .. ..$ : chr "13 / 16"
#>   .. ..$ : chr "14 / 17"
```
