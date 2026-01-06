# Flatten a list

Flattening a list removes a single layer of internal hierarchy, i.e. it
inlines elements that are lists leaving non-lists alone.

## Usage

``` r
list_flatten(
  x,
  ...,
  is_node = NULL,
  name_spec = "{outer}_{inner}",
  name_repair = c("minimal", "unique", "check_unique", "universal")
)
```

## Arguments

- x:

  A list.

- ...:

  These dots are for future extensions and must be empty.

- is_node:

  A predicate function that determines whether an element is a node (by
  returning `TRUE`) or a leaf (by returning `FALSE`). The default value,
  `NULL`, treats simple lists as nodes and everything else (including
  richer objects like data frames and linear models) as leaves, using
  [`vctrs::obj_is_list()`](https://vctrs.r-lib.org/reference/obj_is_list.html).
  To recurse into all objects built on lists use
  [`is.list()`](https://rdrr.io/r/base/list.html).

- name_spec:

  If both inner and outer names are present, control how they are
  combined. Should be a glue specification that uses variables `inner`
  and `outer`.

- name_repair:

  One of `"minimal"`, `"unique"`, `"universal"`, or `"check_unique"`.
  See
  [`vctrs::vec_as_names()`](https://vctrs.r-lib.org/reference/vec_as_names.html)
  for the meaning of these options.

## Value

A list of the same type as `x`. The list might be shorter if `x`
contains empty lists, the same length if it contains lists of length 1
or no sub-lists, or longer if it contains lists of length \> 1.

## Examples

``` r
x <- list(1, list(2, 3), list(4, list(5)))
x |> list_flatten() |> str()
#> List of 5
#>  $ : num 1
#>  $ : num 2
#>  $ : num 3
#>  $ : num 4
#>  $ :List of 1
#>   ..$ : num 5
x |> list_flatten() |> list_flatten() |> str()
#> List of 5
#>  $ : num 1
#>  $ : num 2
#>  $ : num 3
#>  $ : num 4
#>  $ : num 5

# Flat lists are left as is
list(1, 2, 3, 4, 5) |> list_flatten() |> str()
#> List of 5
#>  $ : num 1
#>  $ : num 2
#>  $ : num 3
#>  $ : num 4
#>  $ : num 5

# Empty lists will disappear
list(1, list(), 2, list(3)) |> list_flatten() |> str()
#> List of 3
#>  $ : num 1
#>  $ : num 2
#>  $ : num 3

# Another way to see this is that it reduces the depth of the list
x <- list(
  list(),
  list(list())
)
x |> pluck_depth()
#> [1] 3
x |> list_flatten() |> pluck_depth()
#> [1] 2

# Use name_spec to control how inner and outer names are combined
x <- list(x = list(a = 1, b = 2), y = list(c = 1, d = 2))
x |> list_flatten() |> names()
#> [1] "x_a" "x_b" "y_c" "y_d"
x |> list_flatten(name_spec = "{outer}") |> names()
#> [1] "x" "x" "y" "y"
x |> list_flatten(name_spec = "{inner}") |> names()
#> [1] "a" "b" "c" "d"

# Set `is_node = is.list` to also flatten richer objects built on lists like
# data frames and linear models
df <- data.frame(x = 1:3, y = 4:6)
x <- list(
  a_string = "something",
  a_list = list(1:3, "else"),
  a_df = df
)
x |> list_flatten(is_node = is.list)
#> $a_string
#> [1] "something"
#> 
#> $a_list_1
#> [1] 1 2 3
#> 
#> $a_list_2
#> [1] "else"
#> 
#> $a_df_x
#> [1] 1 2 3
#> 
#> $a_df_y
#> [1] 4 5 6
#> 

# Note that objects that are already "flat" retain their classes
list_flatten(df, is_node = is.list)
#>   x y
#> 1 1 4
#> 2 2 5
#> 3 3 6
```
