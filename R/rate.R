#' Create delaying rate settings
#'
#' These helpers create rate settings that you can pass to [insistently()] and
#' [slowly()]. You can also use them in your own functions with [rate_sleep()].
#'
#' @param max_times Maximum number of requests to attempt.
#' @param jitter Whether to introduce a random jitter in the waiting time.
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

# TODO: this doesn't need to be exported, right?
rate <- new_class(
  "rate",
  package = "purrr",
  properties = list(
    jitter = new_property(class_logical,
      default = TRUE,
      validator = function(value) {
        if (!is_bool(value)) {
          "must be a logical of length 1"
        }
      }
    ),
    max_times = new_property(class_numeric,
      default = 3,
      validator = function(value) {
        if (!is_number(value, allow_infinite = TRUE)) {
          "must be a numeric or `Inf`"
        }
      }
    ), state = new_property(class_environment)
  ),
  constructor = function(jitter = class_missing, max_times = class_missing) {
    new_object(S7_object(),
      jitter = jitter, max_times = max_times,
      state = env(i = 0L)
    )
  }
)

#' @rdname rate-helpers
#' @param pause Delay between attempts in seconds.
#' @export
rate_delay <- new_class("rate_delay",
  parent = rate,
  package = "purrr",
  properties = list(
    pause = new_property(class_numeric, default = 1, validator = function(value) {
      check_number_decimal(value, allow_infinite = TRUE, min = 0)
    }),
    max_times = new_property(class_numeric,
      default = Inf,
      validator = function(value) {
        if (!is_number(value, allow_infinite = TRUE)) {
          "must be a numeric or `Inf`"
        }
      }
    )
  ),
  constructor = function(pause = class_missing, jitter = class_missing, max_times = class_missing) {
    max_times <- if (inherits(max_times, "S7_missing")) Inf else max_times # TODO: Change this
    new_object(rate(jitter = jitter),
      pause = pause,
      max_times = max_times
    )
  }
  # TODO: cleaner way of overriding default max_times from super
)

#' @rdname rate-helpers
#' @param pause_base,pause_cap `rate_backoff()` uses an exponential
#'   back-off so that each request waits `pause_base * 2^i` seconds,
#'   up to a maximum of `pause_cap` seconds.
#' @param pause_min Minimum time to wait in the backoff; generally
#'   only necessary if you need pauses less than one second (which may
#'   not be kind to the server, use with caution!).
#' @export
rate_backoff <- new_class(
  "rate_backoff",
  parent = rate,
  package = "purrr",
  properties = list(
    pause_base = new_property(class_numeric, default = 1, validator = function(value) {
      check_number_decimal(value, min = 0) # TODO: maybe allow_infinite needs to be FALSE?
    }),
    pause_cap = new_property(class_numeric, default = 60, validator = function(value) {
      check_number_decimal(value, allow_infinite = TRUE, min = 0)
    }),
    pause_min = new_property(class_numeric, default = 1, validator = function(value) {
      check_number_decimal(value, allow_infinite = TRUE, min = 0)
    })
  ),
  constructor = function(pause_base = class_missing, pause_cap = class_missing,
                         pause_min = class_missing, max_times = class_missing, jitter = class_missing) {
    new_object(rate(jitter = jitter, max_times = max_times),
      pause_base = pause_base, pause_cap = pause_cap, pause_min = pause_min
    )
  }
)

#' @rdname rate-helpers
#' @param x An object to test.
#' @export
is_rate <- function(x) {
  S7_inherits(x, rate)
}

#' @export
method(print, rate_delay) <- function(x, ...) {
  cli::cli_text("<rate: delay>")
  cli::cli_bullets(c(
    " " = "Attempts: {rate_count(x)}/{x@max_times}",
    " " = "{.field pause}: {x@pause}"
  ))

  invisible(x)
}

#' @export
method(print, rate_backoff) <- function(x, ...) {
  cli::cli_text("<rate: backoff>")
  cli::cli_bullets(c(
    " " = "Attempts: {rate_count(x)}/{x@max_times}",
    " " = "{.field pause_base}: {x@pause_base}",
    " " = "{.field pause_cap}: {x@pause_cap}",
    " " = "{.field pause_min}: {x@pause_min}"
  ))

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
#' @keywords internal
#' @export
rate_sleep <- new_generic("rate_sleep", "rate", function(rate, ..., quiet = TRUE) {
  stopifnot(is_rate(rate))

  i <- rate_count(rate)

  if (i > rate@max_times) {
    stop_rate_expired(rate)
  }
  if (i == rate@max_times) {
    stop_rate_excess(rate)
  }

  if (i == 0L) {
    rate_bump_count(rate)
    signal_rate_init(rate)
    return(invisible())
  }

  on.exit(rate_bump_count(rate))
  S7_dispatch()
})

#' @export
method(rate_sleep, rate_backoff) <- function(rate, quiet = TRUE) {
  i <- rate_count(rate)

  pause_max <- min(rate@pause_cap, rate@pause_base * 2^i)
  if (rate@jitter) {
    pause_max <- stats::runif(1, 0, pause_max)
  }

  length <- max(rate@pause_min, pause_max)
  rate_sleep_impl(rate, length, quiet)
}
#' @export
method(rate_sleep, rate_delay) <- function(rate, quiet = TRUE) {
  rate_sleep_impl(rate, rate@pause, quiet)
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

  rate@state$i <- 0L

  invisible(rate)
}

rate_count <- function(rate) {
  rate@state$i
}
rate_bump_count <- function(rate, n = 1L) {
  rate@state$i <- rate@state$i + n
  invisible(rate)
}

signal_rate_init <- function(rate) {
  signal("", "purrr_condition_rate_init", rate = rate)
}
signal_rate_retry <- function(rate, length, quiet) {
  msg <- sprintf("Retrying in %s seconds.", format(length, digits = 2))
  class <- "purrr_message_rate_retry"
  if (quiet) {
    signal(msg, class, rate = rate, length = length)
  } else {
    inform(msg, class, rate = rate, length = length)
  }
}

stop_rate_expired <- function(rate, error_call = caller_env()) {
  cli::cli_abort(
    c(
      "This `rate` object has already be run more than `max_times` allows.",
      i = "Do you need to reset it with `rate_reset()`?"
    ),
    class = "purrr_error_rate_expired",
    call = error_call
  )
}
stop_rate_excess <- function(rate, error_call = caller_env()) {
  i <- rate_count(rate)

  # Bump counter to get an expired error next time around
  rate_bump_count(rate)

  cli::cli_abort(
    "Request failed after {i} attempts.",
    class = "purrr_error_rate_excess",
    call = error_call
  )
}

check_rate <- function(rate, error_call = caller_env()) {
  if (!is_rate(rate)) {
    cli::cli_abort(
      "{.arg rate} must be a rate object, not {.obj_type_friendly {rate}}.",
      arg = "rate",
      call = error_call,
    )
  }
}
