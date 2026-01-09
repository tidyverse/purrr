# Wait for a given time

If the rate's internal counter exceeds the maximum number of times it is
allowed to sleep, `rate_sleep()` throws an error of class
`purrr_error_rate_excess`.

## Usage

``` r
rate_sleep(rate, quiet = TRUE)

rate_reset(rate)
```

## Arguments

- rate:

  A [rate](https://purrr.tidyverse.org/reference/rate-helpers.md) object
  determining the waiting time.

- quiet:

  If `FALSE`, prints a message displaying how long until the next
  request.

## Details

Call `rate_reset()` to reset the internal rate counter to 0.

## See also

[`rate_backoff()`](https://purrr.tidyverse.org/reference/rate-helpers.md),
[`insistently()`](https://purrr.tidyverse.org/reference/insistently.md)
