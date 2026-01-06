# Wrap a function to capture side-effects

Create a modified version of `.f` that captures side-effects along with
the return value of the function and returns a list containing the
`result`, `output`, `messages` and `warnings`.

## Usage

``` r
quietly(.f)
```

## Arguments

- .f:

  A function to modify, specified in one of the following ways:

  - A named function, e.g. `mean`.

  - An anonymous function, e.g. `\(x) x + 1` or `function(x) x + 1`.

  - A formula, e.g. `~ .x + 1`. No longer recommended.

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
[`safely()`](https://purrr.tidyverse.org/dev/reference/safely.md),
[`slowly()`](https://purrr.tidyverse.org/dev/reference/slowly.md)

## Examples

``` r
f <- function() {
  print("Hi!")
  message("Hello")
  warning("How are ya?")
  "Gidday"
}
f()
#> [1] "Hi!"
#> Hello
#> Warning: How are ya?
#> [1] "Gidday"

f_quiet <- quietly(f)
str(f_quiet())
#> List of 4
#>  $ result  : chr "Gidday"
#>  $ output  : chr "[1] \"Hi!\""
#>  $ warnings: chr "How are ya?"
#>  $ messages: chr "Hello\n"
```
