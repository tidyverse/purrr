#' Transform a function to make it run insistently or slowly
#'
#' @description
#'
#' * `insistently()` takes a function and modifies it to retry a given
#'   amount of time on error.
#'
#' * `slowly()` takes a function and modifies it to wait a given
#'   amount of time between each call.
#'
#' The number and rate of attempts is determined by a
#' [rate][rate-helpers] object (by default a jittered exponential
#' backoff rate for `insistently()`, and a constant rate for
#' `slowly()`).
#'
#' If you would like to include a function created with `safely`, `slowly`, or
#' `insistently` in a package, see [faq-adverbs-export].
#'
#' @param f A function to modify.
#' @inheritParams rate_sleep
#'
#' @seealso [httr::RETRY()] is a special case of [insistently()] for
#'   HTTP verbs. [rate_backoff()] and [rate_delay()] for creating
#'   custom backoff rates. [rate_sleep()] for the function powering
#'   `insistently()` and `slowly()`. [safely()] for another useful
#'   function operator.
#' @examples
#' # For the purpose of this example, we first create a custom rate
#' # object with a low waiting time between attempts:
#' rate <- rate_delay(0.1)
#'
#' # slowly() causes a function to sleep for a given time between calls:
#' slow_runif <- slowly(~ runif(1), rate = rate, quiet = FALSE)
#' map(1:5, slow_runif)
#'
#'
#' # insistently() makes a function repeatedly try to work
#' risky_runif <- function(lo = 0, hi = 1) {
#'   y <- runif(1, lo, hi)
#'   if(y < 0.9) {
#'     stop(y, " is too small")
#'   }
#'   y
#' }
#'
#' # Let's now create an exponential backoff rate with a low waiting
#' # time between attempts:
#' rate <- rate_backoff(pause_base = 0.1, pause_min = 0.005, max_times = 4)
#'
#' # Modify your function to run insistently.
#' insistent_risky_runif <- insistently(risky_runif, rate, quiet = FALSE)
#'
#' set.seed(6) # Succeeding seed
#' insistent_risky_runif()
#'
#' set.seed(3) # Failing seed
#' try(insistent_risky_runif())
#'
#'
#' # You can also use other types of rate settings, like a delay rate
#' # that waits for a fixed amount of time. Be aware that a delay rate
#' # has an infinite amount of attempts by default:
#' rate <- rate_delay(0.2, max_times = 3)
#' insistent_risky_runif <- insistently(risky_runif, rate = rate, quiet = FALSE)
#' try(insistent_risky_runif())
#'
#'
#' # insistently() and possibly() are a useful combination
#' rate <- rate_backoff(pause_base = 0.1, pause_min = 0.005)
#' possibly_insistent_risky_runif <- possibly(insistent_risky_runif, otherwise = -99)
#'
#' set.seed(6)
#' possibly_insistent_risky_runif()
#'
#' set.seed(3)
#' possibly_insistent_risky_runif()
#' @export
insistently <- function(f, rate = rate_backoff(), quiet = TRUE) {
  f <- as_mapper(f)
  force(quiet)

  if (!is_rate(rate)) {
    stop_bad_type(rate, "a rate", arg = "rate")
  }

  function(...) {
    rate_reset(rate)

    repeat {
      rate_sleep(rate, quiet = quiet)
      out <- capture_error(f(...), quiet = quiet)

      if (is_null(out$error)) {
        return(out$result)
      }
    }
  }
}
#' @rdname insistently
#' @export
slowly <- function(f, rate = rate_delay(), quiet = TRUE) {
  f <- as_mapper(f)
  force(quiet)

  if (!is_rate(rate)) {
    stop_bad_type(rate, "a rate", arg = "rate")
  }

  function(...) {
    rate_sleep(rate, quiet = quiet)
    f(...)
  }
}

#' Create delaying rate settings
#'
#' These helpers create rate settings that you can pass to
#' [insistently()]. You can also use them in your own functions with
#' [rate_sleep()].
#'
#' @param max_times Maximum number of requests to attempt.
#' @param jitter Whether to introduce a random jitter in the waiting time.
#'
#' @seealso [rate_sleep()], [insistently()]
#' @examples
#' # A delay rate waits the same amount of time:
#' rate <- rate_delay(0.02)
#' for (i in 1:3) rate_sleep(rate, quiet = FALSE)
#'
#' # A backoff rate waits exponentially longer each time, with random
#' # jitter by default:
#' rate <- rate_backoff(pause_base = 0.2, pause_min = 0.005)
#' for (i in 1:3) rate_sleep(rate, quiet = FALSE)
#' @name rate-helpers
NULL

#' @rdname rate-helpers
#' @param pause Delay between attempts in seconds.
#' @export
rate_delay <- function(pause = 1,
                       max_times = Inf) {
  stopifnot(is_quantity(pause))
  new_rate(
    "purrr_rate_delay",
    pause = pause,
    max_times = max_times,
    jitter = FALSE
  )
}

#' @rdname rate-helpers
#' @param pause_base,pause_cap `rate_backoff()` uses an exponential
#'   back-off so that each request waits `pause_base * 2^i` seconds,
#'   up to a maximum of `pause_cap` seconds.
#' @param pause_min Minimum time to wait in the backoff; generally
#'   only necessary if you need pauses less than one second (which may
#'   not be kind to the server, use with caution!).
#' @export
rate_backoff <- function(pause_base = 1,
                         pause_cap = 60,
                         pause_min = 1,
                         max_times = 3,
                         jitter = TRUE) {
  stopifnot(
    is_quantity(pause_base),
    is_quantity(pause_cap),
    is_quantity(pause_min)
  )
  new_rate(
    "purrr_rate_backoff",
    pause_base = pause_base,
    pause_cap = pause_cap,
    pause_min = pause_min,
    max_times = max_times,
    jitter = jitter
  )
}

new_rate <- function(.subclass, ..., jitter = TRUE, max_times = 3) {
  stopifnot(
    is_bool(jitter),
    is_number(max_times) || identical(max_times, Inf)
  )

  rate <- list(
    ...,
    state = env(i = 0L),
    jitter = jitter,
    max_times = max_times
  )

  structure(
    rate,
    class = c(.subclass, "purrr_rate")
  )
}
#' @rdname rate-helpers
#' @param x An object to test.
#' @export
is_rate <- function(x) {
  inherits(x, "purrr_rate")
}

#' @export
print.purrr_rate_delay <- function(x, ...) {
  cat_line(bold("<rate: delay>"))
  print_purrr_rate(x)

  cat_line(bullet("`pause`: %.2f", x$pause))

  invisible(x)
}
#' @export
print.purrr_rate_backoff <- function(x, ...) {
  cat_line(bold("<rate: backoff>"))
  print_purrr_rate(x)

  cat_line(
    bullet("`pause_base`: %d", x$pause_base),
    bullet("`pause_cap`: %d", x$pause_cap),
    bullet("`pause_min`: %d", x$pause_min)
  )

  invisible(x)
}
print_purrr_rate <- function(x, ...) {
  cat_line(
    # Using `%s` to convert `Inf` to character
    sprintf("Attempts: %d/%s", rate_count(x), x$max_times),
    "Fields:"
  )
  invisible(x)
}

#' Wait for a given time
#'
#' If the rate's internal counter exceeds the maximum number of times
#' it is allowed to sleep, `rate_sleep()` throws an error of class
#' `purrr_error_rate_excess`.
#'
#' Call `rate_reset()` to reset the internal rate counter to 0.
#'
#' @param rate A [rate][rate_backoff] object determining the waiting time.
#' @param quiet If `FALSE`, prints a message displaying how long until
#'   the next request.
#'
#' @seealso [rate_backoff()], [insistently()]
#' @export
rate_sleep <- function(rate, quiet = TRUE) {
  stopifnot(is_rate(rate))

  i <- rate_count(rate)

  if (i > rate$max_times) {
    stop_rate_expired(rate)
  }
  if (i == rate$max_times) {
    stop_rate_excess(rate)
  }

  if (i == 0L) {
    rate_bump_count(rate)
    signal_rate_init(rate)
    return(invisible())
  }

  on.exit(rate_bump_count(rate))
  UseMethod("rate_sleep")
}

#' @export
rate_sleep.purrr_rate_backoff <- function(rate, quiet = TRUE) {
  i <- rate_count(rate)

  pause_max <- min(rate$pause_cap, rate$pause_base * 2^i)
  if (rate$jitter) {
    pause_max <- stats::runif(1, 0, pause_max)
  }

  length <- max(rate$pause_min, pause_max)
  rate_sleep_impl(rate, length, quiet)
}
#' @export
rate_sleep.purrr_rate_delay <- function(rate, quiet = TRUE) {
  rate_sleep_impl(rate, rate$pause, quiet)
}

rate_sleep_impl <- function(rate, length, quiet) {
  if (!quiet) {
    signal_rate_retry(rate, length, quiet)
  }
  Sys.sleep(length)
}

#' @rdname rate_sleep
#' @export
rate_reset <- function(rate) {
  stopifnot(is_rate(rate))

  rate$state$i <- 0L

  invisible(rate)
}

rate_count <- function(rate) {
  rate$state$i
}
rate_bump_count <- function(rate, n = 1L) {
  rate$state$i <- rate$state$i + n
  invisible(rate)
}

signal_rate_init <- function(rate) {
  signal("", "purrr_condition_rate_init", rate = rate)
}
signal_rate_retry <- function(rate, length, quiet) {
  msg <- sprintf("Retrying in %.1g seconds.", length)
  class <- "purrr_message_rate_retry"
  if (quiet) {
    signal(msg, class, rate = rate, length = length)
  } else {
    inform(msg, class, rate = rate, length = length)
  }
}

stop_rate_expired <- function(rate) {
  msg <- paste_line(
    "This `rate` object has already be run more than `max_times` allows.",
    "Do you need to reset it with `rate_reset()`?"
  )
  abort(msg, "purrr_error_rate_expired", rate = rate)
}
stop_rate_excess <- function(rate) {
  i <- rate_count(rate)

  # Bump counter to get an expired error next time around
  rate_bump_count(rate)

  msg <- sprintf("Request failed after %d attempts", i)
  abort(msg, "purrr_error_rate_excess", rate = rate)
}
