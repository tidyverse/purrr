# Combine list elements into a single data structure

- `list_c()` combines elements into a vector by concatenating them
  together with
  [`vctrs::vec_c()`](https://vctrs.r-lib.org/reference/vec_c.html).

- `list_rbind()` combines elements into a data frame by row-binding them
  together with
  [`vctrs::vec_rbind()`](https://vctrs.r-lib.org/reference/vec_bind.html).

- `list_cbind()` combines elements into a data frame by column-binding
  them together with
  [`vctrs::vec_cbind()`](https://vctrs.r-lib.org/reference/vec_bind.html).

## Usage

``` r
list_c(x, ..., ptype = NULL)

list_cbind(
  x,
  ...,
  name_repair = c("unique", "universal", "check_unique"),
  size = NULL
)

list_rbind(x, ..., names_to = rlang::zap(), ptype = NULL)
```

## Arguments

- x:

  A list. For `list_rbind()` and `list_cbind()` the list must only
  contain only data frames or `NULL`.

- ...:

  These dots are for future extensions and must be empty.

- ptype:

  An optional prototype to ensure that the output type is always the
  same.

- name_repair:

  One of `"unique"`, `"universal"`, or `"check_unique"`. See
  [`vctrs::vec_as_names()`](https://vctrs.r-lib.org/reference/vec_as_names.html)
  for the meaning of these options.

- size:

  An optional integer size to ensure that every input has the same size
  (i.e. number of rows).

- names_to:

  By default, `names(x)` are lost. To keep them, supply a string to
  `names_to` and the names will be saved into a column with that name.
  If `names_to` is supplied and `x` is not named, the position of the
  elements will be used instead of the names.

## Examples

``` r
x1 <- list(a = 1, b = 2, c = 3)
list_c(x1)
#> [1] 1 2 3

x2 <- list(
  a = data.frame(x = 1:2),
  b = data.frame(y = "a")
)
list_rbind(x2)
#>    x    y
#> 1  1 <NA>
#> 2  2 <NA>
#> 3 NA    a
list_rbind(x2, names_to = "id")
#>   id  x    y
#> 1  a  1 <NA>
#> 2  a  2 <NA>
#> 3  b NA    a
list_rbind(unname(x2), names_to = "id")
#>   id  x    y
#> 1  1  1 <NA>
#> 2  1  2 <NA>
#> 3  2 NA    a

list_cbind(x2)
#>   x y
#> 1 1 a
#> 2 2 a
```
