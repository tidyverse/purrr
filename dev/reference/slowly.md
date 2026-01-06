# Wrap a function to wait between executions

`slowly()` takes a function and modifies it to wait a given amount of
time between each call.

## Usage

``` r
slowly(f, rate = rate_delay(), quiet = TRUE)
```

## Arguments

- f:

  A function to modify, specified in one of the following ways:

  - A named function, e.g. `mean`.

  - An anonymous function, e.g. `\(x) x + 1` or `function(x) x + 1`.

  - A formula, e.g. `~ .x + 1`. No longer recommended.

- rate:

  A [rate](https://purrr.tidyverse.org/dev/reference/rate-helpers.md)
  object. Defaults to a constant delay.

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
[`safely()`](https://purrr.tidyverse.org/dev/reference/safely.md)

## Examples

``` r
# For these example, we first create a custom rate
# with a low waiting time between attempts:
rate <- rate_delay(0.1)

# slowly() causes a function to sleep for a given time between calls:
slow_runif <- slowly(\(x) runif(1), rate = rate, quiet = FALSE)
out <- map(1:5, slow_runif)
#> Retrying in 0.1 seconds.
#> Retrying in 0.1 seconds.
#> Retrying in 0.1 seconds.
#> Retrying in 0.1 seconds.
```
