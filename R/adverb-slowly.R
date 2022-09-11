#' Wrap a function to wait between executions
#'
#' `slowly()` takes a function and modifies it to wait a given
#' amount of time between each call.
#'
#' @inheritParams insistently
#' @param rate A [rate][rate-helpers] object. Defaults to a constant delay.
#' @inheritSection safely Adverbs
#' @inherit safely return
#' @family adverbs
#' @export
#' @examples
#' # For these example, we first create a custom rate
#' # with a low waiting time between attempts:
#' rate <- rate_delay(0.1)
#'
#' # slowly() causes a function to sleep for a given time between calls:
#' slow_runif <- slowly(~ runif(1), rate = rate, quiet = FALSE)
#' out <- map(1:5, slow_runif)
slowly <- function(f, rate = rate_delay(), quiet = TRUE) {
  f <- as_mapper(f)
  force(quiet)

  if (!is_rate(rate)) {
    cli::cli_abort(
      "{.arg rate} must be a rate object, not {.obj_type_friendly {rate}}."
    )
  }

  function(...) {
    rate_sleep(rate, quiet = quiet)
    f(...)
  }
}
