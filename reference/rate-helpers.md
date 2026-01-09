# Create delaying rate settings

These helpers create rate settings that you can pass to
[`insistently()`](https://purrr.tidyverse.org/reference/insistently.md)
and [`slowly()`](https://purrr.tidyverse.org/reference/slowly.md). You
can also use them in your own functions with
[`rate_sleep()`](https://purrr.tidyverse.org/reference/rate_sleep.md).

## Usage

``` r
rate_delay(pause = 1, max_times = Inf)

rate_backoff(
  pause_base = 1,
  pause_cap = 60,
  pause_min = 1,
  max_times = 3,
  jitter = TRUE
)

is_rate(x)
```

## Arguments

- pause:

  Delay between attempts in seconds.

- max_times:

  Maximum number of requests to attempt.

- pause_base, pause_cap:

  `rate_backoff()` uses an exponential back-off so that each request
  waits `pause_base * 2^i` seconds, up to a maximum of `pause_cap`
  seconds.

- pause_min:

  Minimum time to wait in the backoff; generally only necessary if you
  need pauses less than one second (which may not be kind to the server,
  use with caution!).

- jitter:

  Whether to introduce a random jitter in the waiting time.

- x:

  An object to test.

## Examples

``` r
# A delay rate waits the same amount of time:
rate <- rate_delay(0.02)
for (i in 1:3) rate_sleep(rate, quiet = FALSE)
#> Retrying in 0.02 seconds.
#> Retrying in 0.02 seconds.

# A backoff rate waits exponentially longer each time, with random
# jitter by default:
rate <- rate_backoff(pause_base = 0.2, pause_min = 0.005)
for (i in 1:3) rate_sleep(rate, quiet = FALSE)
#> Retrying in 0.25 seconds.
#> Retrying in 0.66 seconds.
```
