# Wrap a function to capture errors

Creates a modified version of `.f` that always succeeds. It returns a
list with components `result` and `error`. If the function succeeds,
`result` contains the returned value and `error` is `NULL`. If an error
occurred, `error` is an `error` object and `result` is either `NULL` or
`otherwise`.

## Usage

``` r
safely(.f, otherwise = NULL, quiet = TRUE)
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
[`possibly()`](https://purrr.tidyverse.org/dev/reference/possibly.md),
[`quietly()`](https://purrr.tidyverse.org/dev/reference/quietly.md),
[`slowly()`](https://purrr.tidyverse.org/dev/reference/slowly.md)

## Examples

``` r
safe_log <- safely(log)
safe_log(10)
#> $result
#> [1] 2.302585
#> 
#> $error
#> NULL
#> 
safe_log("a")
#> $result
#> NULL
#> 
#> $error
#> <simpleError in .f(...): non-numeric argument to mathematical function>
#> 

list("a", 10, 100) |>
  map(safe_log) |>
  transpose()
#> $result
#> $result[[1]]
#> NULL
#> 
#> $result[[2]]
#> [1] 2.302585
#> 
#> $result[[3]]
#> [1] 4.60517
#> 
#> 
#> $error
#> $error[[1]]
#> <simpleError in .f(...): non-numeric argument to mathematical function>
#> 
#> $error[[2]]
#> NULL
#> 
#> $error[[3]]
#> NULL
#> 
#> 

# This is a bit easier to work with if you supply a default value
# of the same type and use the simplify argument to transpose():
safe_log <- safely(log, otherwise = NA_real_)
list("a", 10, 100) |>
  map(safe_log) |>
  transpose() |>
  simplify_all()
#> $result
#> [1]       NA 2.302585 4.605170
#> 
#> $error
#> $error[[1]]
#> <simpleError in .f(...): non-numeric argument to mathematical function>
#> 
#> $error[[2]]
#> NULL
#> 
#> $error[[3]]
#> NULL
#> 
#> 
```
