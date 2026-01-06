# Wrap a function to return a value instead of an error

Create a modified version of `.f` that return a default value
(`otherwise`) whenever an error occurs.

## Usage

``` r
possibly(.f, otherwise = NULL, quiet = TRUE)
```

## Arguments

- .f:

  A function to modify, specified in one of the following ways:

  - A named function, e.g. `mean`.

  - An anonymous function, e.g. `\(x) x + 1` or `function(x) x + 1`.

  - A formula, e.g. `~ .x + 1`. No longer recommended.

- otherwise:

  Default value to use when an error occurs.

- quiet:

  Hide errors (`TRUE`, the default), or display them as they occur?

## Value

A function that takes the same arguments as `.f`, but returns a
different value, as described above.

## Adverbs

This function is called an adverb because it modifies the effect of a
function (a verb). If you'd like to include a function created an adverb
in a package, be sure to read
[faq-adverbs-export](https://purrr.tidyverse.org/dev/reference/faq-adverbs-export.md).

## See also

Other adverbs:
[`auto_browse()`](https://purrr.tidyverse.org/dev/reference/auto_browse.md),
[`compose()`](https://purrr.tidyverse.org/dev/reference/compose.md),
[`insistently()`](https://purrr.tidyverse.org/dev/reference/insistently.md),
[`negate()`](https://purrr.tidyverse.org/dev/reference/negate.md),
[`partial()`](https://purrr.tidyverse.org/dev/reference/partial.md),
[`quietly()`](https://purrr.tidyverse.org/dev/reference/quietly.md),
[`safely()`](https://purrr.tidyverse.org/dev/reference/safely.md),
[`slowly()`](https://purrr.tidyverse.org/dev/reference/slowly.md)

## Examples

``` r
# To replace errors with a default value, use possibly().
list("a", 10, 100) |>
  map_dbl(possibly(log, NA_real_))
#> [1]       NA 2.302585 4.605170

# The default, NULL, will be discarded with `list_c()`
list("a", 10, 100) |>
  map(possibly(log)) |>
  list_c()
#> [1] 2.302585 4.605170
```
