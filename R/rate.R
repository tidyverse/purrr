#' Transform a function to make it run insistently
#'
#' @param f A function to modify.
#' @inheritParams rate_sleep
#' @return Wrapped function attempts to run `max_times` times; an
#'   error occurs if all attempts fail.
#'
#' @seealso [httr::RETRY()] is a special case of [insistently()] for
#'   HTTP verbs. [rate_backoff()] for creating custom backoff
#'   rates. [rate_sleep()] for the function powering `insistently()`.
#'   [safely()] for another useful function operator.
#' @examples
#' # insistently() makes a function repeatedly try to work
#' risky_runif <- function(lo = 0, hi = 1) {
#'   y <- runif(1, lo, hi)
#'   if(y < 0.9) {
#'     stop(y, " is too small")
#'   }
#'   y
#' }
#'
#' # For the purpose of this example, we first create a custom rate
#' # object with a low waiting time between attempts:
#' rate <- rate_backoff(pause_base = 0.2, pause_min = 0.005)
#'
#' # Modify your function to run insistently.
#' insistent_risky_runif <- insistently(risky_runif, rate, quiet = FALSE)
#'
#' set.seed(1)
#' insistent_risky_runif()
#'
#' set.seed(3)
#' try(insistent_risky_runif())
#'
#'
#' # Create a custom rate object to modify the parameters of the delay rate:
#'
#' # insistently() and possibly() are a useful combination
#' rate <- rate_backoff(pause_base = 0.2, pause_min = 0.005)
#' insistent_risky_runif <- insistently(risky_runif, quiet = FALSE)
#' possibly_insistent_risky_runif <- possibly(insistent_risky_runif, otherwise = -99)
#'
#' set.seed(1)
#' possibly_insistent_risky_runif()
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
    repeat {
      out <- capture_error(f(...), quiet = quiet)

      if (is_null(out$error)) {
        return(out$result)
      }

      rate_sleep(rate, quiet = quiet)
    }
  }
}

#' Create delaying rate settings
#'
#' These helpers create rate settings that you can pass to
#' [insistently()]. You can use them in your own functions with
#' [rate_sleep()].
#'
#' @param max_times Maximum number of requests to attempt.
#' @param pause_base,pause_cap `rate_backoff()` uses an exponential
#'   back-off so that each request waits `pause_base * 2^i` seconds,
#'   up to a maximum of `pause_cap` seconds.
#' @param pause_min Minimum time to wait in the backoff; generally
#'   only necessary if you need pauses less than one second (which may
#'   not be kind to the server, use with caution!).
#' @param jitter Whether to introduce a random jitter in the waiting time.
#'
#' @seealso [rate_sleep()], [insistently()]
#' @examples
#' # With a lower backoff base rate, the waiting time between requests
#' # will be shorter:
#' rate_backoff(pause_base = 0.5)
#'
#' # Pass a minimum waiting time of 5 seconds:
#' rate_backoff(pause_min = 5)
#' @export
rate_backoff <- function(pause_base = 1,
                         pause_cap = 60,
                         pause_min = 1,
                         max_times = 3,
                         jitter = TRUE) {
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
  stopifnot(is_bool(jitter))

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
#' @rdname rate_backoff
#' @param x An object to test.
#' @export
is_rate <- function(x) {
  inherits(x, "purrr_rate")
}

#' @export
print.purrr_rate_backoff <- function(x, ...) {
  cat_line(bold("<rate: backoff>"))
  NextMethod()
}
#' @export
print.purrr_rate <- function(x, ...) {
  cat_line(
    bullet("`i`: %d", rate_count(x)),
    bullet("`max_times`: %d", x$max_times)
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
#' @examples
#' rate <- rate_backoff(pause_base = 0.5, pause_min = 0.005)
#' rate_sleep(rate, quiet = FALSE)
#' rate_sleep(rate, quiet = FALSE)
#' rate_sleep(rate, quiet = FALSE)
#' @export
rate_sleep <- function(rate, quiet = TRUE) {
  stopifnot(is_rate(rate))

  i <- rate_count(rate)
  if (i >= rate$max_times) {
    abort(
      sprintf("Request failed after %d attempts", i),
      "purrr_error_rate_excess",
      i = i
    )
  }
  rate_bump_count(rate)

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

  if (!quiet) {
    inform_rate(length)
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

inform_rate <- function(length) {
  inform(
    sprintf("Retrying in %.1g seconds.", length),
    "purrr_message_rate_retry",
    length = length
  )
}
