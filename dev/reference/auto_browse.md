# Wrap a function so it will automatically `browse()` on error

A function wrapped with `auto_browse()` will automatically enter an
interactive debugger using
[`browser()`](https://rdrr.io/r/base/browser.html) when ever it
encounters an error.

## Usage

``` r
auto_browse(.f)
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
[`compose()`](https://purrr.tidyverse.org/dev/reference/compose.md),
[`insistently()`](https://purrr.tidyverse.org/dev/reference/insistently.md),
[`negate()`](https://purrr.tidyverse.org/dev/reference/negate.md),
[`partial()`](https://purrr.tidyverse.org/dev/reference/partial.md),
[`possibly()`](https://purrr.tidyverse.org/dev/reference/possibly.md),
[`quietly()`](https://purrr.tidyverse.org/dev/reference/quietly.md),
[`safely()`](https://purrr.tidyverse.org/dev/reference/safely.md),
[`slowly()`](https://purrr.tidyverse.org/dev/reference/slowly.md)

## Examples

``` r
# For interactive usage, auto_browse() is useful because it automatically
# starts a browser() in the right place.
f <- function(x) {
  y <- 20
  if (x > 5) {
    stop("!")
  } else {
    x
  }
}
if (interactive()) {
  map(1:6, auto_browse(f))
}
```
