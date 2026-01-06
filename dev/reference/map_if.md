# Apply a function to each element of a vector conditionally

The functions `map_if()` and `map_at()` take `.x` as input, apply the
function `.f` to some of the elements of `.x`, and return a list of the
same length as the input.

- `map_if()` takes a predicate function `.p` as input to determine which
  elements of `.x` are transformed with `.f`.

- `map_at()` takes a vector of names or positions `.at` to specify which
  elements of `.x` are transformed with `.f`.

## Usage

``` r
map_if(.x, .p, .f, ..., .else = NULL)

map_at(.x, .at, .f, ..., .progress = FALSE)
```

## Arguments

- .x:

  A list or atomic vector.

- .p:

  A single predicate function, a formula describing such a predicate
  function, or a logical vector of the same length as `.x`.
  Alternatively, if the elements of `.x` are themselves lists of
  objects, a string indicating the name of a logical element in the
  inner lists. Only those elements where `.p` evaluates to `TRUE` will
  be modified.

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
  [`in_parallel()`](https://purrr.tidyverse.org/dev/reference/in_parallel.md)
  to declare that it should be performed in parallel. See
  [`in_parallel()`](https://purrr.tidyverse.org/dev/reference/in_parallel.md)
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

- .else:

  A function applied to elements of `.x` for which `.p` returns `FALSE`.

- .at:

  A logical, integer, or character vector giving the elements to select.
  Alternatively, a function that takes a vector of names, and returns a
  logical, integer, or character vector of elements to select.

  **\[deprecated\]**: if the tidyselect package is installed, you can
  use [`vars()`](https://dplyr.tidyverse.org/reference/vars.html) and
  tidyselect helpers to select elements.

- .progress:

  Whether to show a progress bar. Use `TRUE` to turn on a basic progress
  bar, use a string to give it a name, or see
  [progress_bars](https://purrr.tidyverse.org/dev/reference/progress_bars.md)
  for more details.

## See also

Other map variants:
[`imap()`](https://purrr.tidyverse.org/dev/reference/imap.md),
[`lmap()`](https://purrr.tidyverse.org/dev/reference/lmap.md),
[`map()`](https://purrr.tidyverse.org/dev/reference/map.md),
[`map2()`](https://purrr.tidyverse.org/dev/reference/map2.md),
[`map_depth()`](https://purrr.tidyverse.org/dev/reference/map_depth.md),
[`modify()`](https://purrr.tidyverse.org/dev/reference/modify.md),
[`pmap()`](https://purrr.tidyverse.org/dev/reference/pmap.md)

## Examples

``` r
# Use a predicate function to decide whether to map a function:
iris |> map_if(is.factor, as.character) |> str()
#> List of 5
#>  $ Sepal.Length: num [1:150] 5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
#>  $ Sepal.Width : num [1:150] 3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
#>  $ Petal.Length: num [1:150] 1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
#>  $ Petal.Width : num [1:150] 0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
#>  $ Species     : chr [1:150] "setosa" "setosa" "setosa" "setosa" ...

# Specify an alternative with the `.else` argument:
iris |> map_if(is.factor, as.character, .else = as.integer) |> str()
#> List of 5
#>  $ Sepal.Length: int [1:150] 5 4 4 4 5 5 4 5 4 4 ...
#>  $ Sepal.Width : int [1:150] 3 3 3 3 3 3 3 3 2 3 ...
#>  $ Petal.Length: int [1:150] 1 1 1 1 1 1 1 1 1 1 ...
#>  $ Petal.Width : int [1:150] 0 0 0 0 0 0 0 0 0 0 ...
#>  $ Species     : chr [1:150] "setosa" "setosa" "setosa" "setosa" ...

# Use numeric vector of positions select elements to change:
iris |> map_at(c(4, 5), is.numeric) |> str()
#> List of 5
#>  $ Sepal.Length: num [1:150] 5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
#>  $ Sepal.Width : num [1:150] 3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
#>  $ Petal.Length: num [1:150] 1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
#>  $ Petal.Width : logi TRUE
#>  $ Species     : logi FALSE

# Use vector of names to specify which elements to change:
iris |> map_at("Species", toupper) |> str()
#> List of 5
#>  $ Sepal.Length: num [1:150] 5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
#>  $ Sepal.Width : num [1:150] 3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
#>  $ Petal.Length: num [1:150] 1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
#>  $ Petal.Width : num [1:150] 0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
#>  $ Species     : chr [1:150] "SETOSA" "SETOSA" "SETOSA" "SETOSA" ...
```
