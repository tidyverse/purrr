# Apply a function to list-elements of a list

`lmap()`, `lmap_at()` and `lmap_if()` are similar to
[`map()`](https://purrr.tidyverse.org/dev/reference/map.md),
[`map_at()`](https://purrr.tidyverse.org/dev/reference/map_if.md) and
[`map_if()`](https://purrr.tidyverse.org/dev/reference/map_if.md),
except instead of mapping over `.x[[i]]`, they instead map over `.x[i]`.

This has several advantages:

- It makes it possible to work with functions that exclusively take a
  list.

- It allows `.f` to access the attributes of the encapsulating list,
  like [`names()`](https://rdrr.io/r/base/names.html).

- It allows `.f` to return a larger or small list than it receives
  changing the size of the output.

## Usage

``` r
lmap(.x, .f, ...)

lmap_if(.x, .p, .f, ..., .else = NULL)

lmap_at(.x, .at, .f, ...)
```

## Arguments

- .x:

  A list or data frame.

- .f:

  A function that takes a length-1 list and returns a list (of any
  length.)

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

- .p:

  A single predicate function, a formula describing such a predicate
  function, or a logical vector of the same length as `.x`.
  Alternatively, if the elements of `.x` are themselves lists of
  objects, a string indicating the name of a logical element in the
  inner lists. Only those elements where `.p` evaluates to `TRUE` will
  be modified.

- .else:

  A function applied to elements of `.x` for which `.p` returns `FALSE`.

- .at:

  A logical, integer, or character vector giving the elements to select.
  Alternatively, a function that takes a vector of names, and returns a
  logical, integer, or character vector of elements to select.

  **\[deprecated\]**: if the tidyselect package is installed, you can
  use [`vars()`](https://dplyr.tidyverse.org/reference/vars.html) and
  tidyselect helpers to select elements.

## Value

A list or data frame, matching `.x`. There are no guarantees about the
length.

## See also

Other map variants:
[`imap()`](https://purrr.tidyverse.org/dev/reference/imap.md),
[`map()`](https://purrr.tidyverse.org/dev/reference/map.md),
[`map2()`](https://purrr.tidyverse.org/dev/reference/map2.md),
[`map_depth()`](https://purrr.tidyverse.org/dev/reference/map_depth.md),
[`map_if()`](https://purrr.tidyverse.org/dev/reference/map_if.md),
[`modify()`](https://purrr.tidyverse.org/dev/reference/modify.md),
[`pmap()`](https://purrr.tidyverse.org/dev/reference/pmap.md)

## Examples

``` r
set.seed(1014)

# Let's write a function that returns a larger list or an empty list
# depending on some condition. It also uses the input name to name the
# output
maybe_rep <- function(x) {
  n <- rpois(1, 2)
  set_names(rep_len(x, n), paste0(names(x), seq_len(n)))
}

# The output size varies each time we map f()
x <- list(a = 1:4, b = letters[5:7], c = 8:9, d = letters[10])
x |> lmap(maybe_rep) |> str()
#> List of 6
#>  $ b1: chr [1:3] "e" "f" "g"
#>  $ b2: chr [1:3] "e" "f" "g"
#>  $ b3: chr [1:3] "e" "f" "g"
#>  $ c1: int [1:2] 8 9
#>  $ c2: int [1:2] 8 9
#>  $ d1: chr "j"

# We can apply f() on a selected subset of x
x |> lmap_at(c("a", "d"), maybe_rep) |> str()
#> List of 4
#>  $ b : chr [1:3] "e" "f" "g"
#>  $ c : int [1:2] 8 9
#>  $ d1: chr "j"
#>  $ d2: chr "j"

# Or only where a condition is satisfied
x |> lmap_if(is.character, maybe_rep) |> str()
#> List of 5
#>  $ a : int [1:4] 1 2 3 4
#>  $ b1: chr [1:3] "e" "f" "g"
#>  $ b2: chr [1:3] "e" "f" "g"
#>  $ c : int [1:2] 8 9
#>  $ d1: chr "j"
```
