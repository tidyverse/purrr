# Transform a function to wait then retry after an error

`insistently()` takes a function and modifies it to retry after given
amount of time whenever it errors.

## Usage

``` r
insistently(f, rate = rate_backoff(), quiet = TRUE)
```

## Arguments

- f:

  A function to modify, specified in one of the following ways:

  - A named function, e.g. `mean`.

  - An anonymous function, e.g. `\(x) x + 1` or `function(x) x + 1`.

  - A formula, e.g. `~ .x + 1`. No longer recommended.

- rate:

  A [rate](https://purrr.tidyverse.org/reference/rate-helpers.md)
  object. Defaults to jittered exponential backoff.

- quiet:

  Hide errors (`TRUE`, the default), or display them as they occur?

## Value

A function that takes the same arguments as `.f`, but returns a
different value, as described above.

## Adverbs

This function is called an adverb because it modifies the effect of a
function (a verb). If you'd like to include a function created an adverb
in a package, be sure to read
[faq-adverbs-export](https://purrr.tidyverse.org/reference/faq-adverbs-export.md).

## See also

[`httr::RETRY()`](https://httr.r-lib.org/reference/RETRY.html) is a
special case of `insistently()` for HTTP verbs.

Other adverbs:
[`auto_browse()`](https://purrr.tidyverse.org/reference/auto_browse.md),
[`compose()`](https://purrr.tidyverse.org/reference/compose.md),
[`negate()`](https://purrr.tidyverse.org/reference/negate.md),
[`partial()`](https://purrr.tidyverse.org/reference/partial.md),
[`possibly()`](https://purrr.tidyverse.org/reference/possibly.md),
[`quietly()`](https://purrr.tidyverse.org/reference/quietly.md),
[`safely()`](https://purrr.tidyverse.org/reference/safely.md),
[`slowly()`](https://purrr.tidyverse.org/reference/slowly.md)

## Examples

``` r
# For the purpose of this example, we first create a custom rate
# object with a low waiting time between attempts:
rate <- rate_delay(0.1)

# insistently() makes a function repeatedly try to work
risky_runif <- function(lo = 0, hi = 1) {
  y <- runif(1, lo, hi)
  if(y < 0.9) {
    stop(y, " is too small")
  }
  y
}

# Let's now create an exponential backoff rate with a low waiting
# time between attempts:
rate <- rate_backoff(pause_base = 0.1, pause_min = 0.005, max_times = 4)

# Modify your function to run insistently.
insistent_risky_runif <- insistently(risky_runif, rate, quiet = FALSE)

set.seed(6) # Succeeding seed
insistent_risky_runif()
#> Error: 0.606268297648057 is too small
#> Retrying in 0.19 seconds.
#> Error: 0.264352067606524 is too small
#> Retrying in 0.15 seconds.
#> Error: 0.807483389042318 is too small
#> Retrying in 0.78 seconds.
#> [1] 0.9579337

set.seed(3) # Failing seed
try(insistent_risky_runif())
#> Error: 0.168041526339948 is too small
#> Retrying in 0.16 seconds.
#> Error: 0.384942351374775 is too small
#> Retrying in 0.13 seconds.
#> Error: 0.602100674761459 is too small
#> Retrying in 0.48 seconds.
#> Error: 0.124633444240317 is too small
#> Error in rate_sleep(rate, quiet = quiet) : 
#>   Request failed after 4 attempts.

# You can also use other types of rate settings, like a delay rate
# that waits for a fixed amount of time. Be aware that a delay rate
# has an infinite amount of attempts by default:
rate <- rate_delay(0.2, max_times = 3)
insistent_risky_runif <- insistently(risky_runif, rate = rate, quiet = FALSE)
try(insistent_risky_runif())
#> Error: 0.294600924244151 is too small
#> Retrying in 0.2 seconds.
#> Error: 0.577609919011593 is too small
#> Retrying in 0.2 seconds.
#> Error: 0.630979274399579 is too small
#> Error in rate_sleep(rate, quiet = quiet) : 
#>   Request failed after 3 attempts.

# insistently() and possibly() are a useful combination
rate <- rate_backoff(pause_base = 0.1, pause_min = 0.005)
possibly_insistent_risky_runif <- possibly(insistent_risky_runif, otherwise = -99)

set.seed(6)
possibly_insistent_risky_runif()
#> Error: 0.606268297648057 is too small
#> Retrying in 0.2 seconds.
#> [1] 0.937642

set.seed(3)
possibly_insistent_risky_runif()
#> Error: 0.168041526339948 is too small
#> Retrying in 0.2 seconds.
#> Error: 0.807516399072483 is too small
#> Retrying in 0.2 seconds.
#> Error: 0.384942351374775 is too small
#> [1] -99
```
