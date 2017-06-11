#' Transform a function to make it run insistently
#'
#' @inheritParams safely
#' @param max_attempts Positive integer. Functions wrapped by `insistently()`
#'   will try to run this many times before giving up.
#' @param wait_seconds Positive number. Base multiplier for time in seconds to
#'   wait between attempts. The time increases exponentially, with a wait time
#'   randomly chosen from a uniform distribution between `0` and
#'   `wait_seconds * 2 ^ (i - 1)` seconds, between the `i`th and
#'   `i + 1`th attempts.
#' @return Wrapped function attempts to run `max_attempts` times; an
#'   error occurs if all attempts fail.
#' @seealso [httr::RETRY()] is a special case of [insistently()]
#' for HTTP verbs.
#'
#' @examples
#' # insistently() makes a function repeatedly try to work
#' risky_runif <- function(lo = 0, hi = 1) {
#'   y <- runif(1, lo, hi)
#'   if(y < 0.9) {
#'     stop(y, " is too small")
#'   }
#'   y
#' }
#' insistent_risky_runif <- insistently(
#'   risky_runif, quiet = FALSE, wait_seconds = 0.01)
#' set.seed(1)
#' insistent_risky_runif()
#' set.seed(3)
#' try(insistent_risky_runif())
#'
#' # insistently() and possibly() are a useful combination
#' possibly_insistent_risky_runif <- possibly(
#'   insistently(risky_runif, quiet = FALSE, wait_seconds = 0.01),
#'   otherwise = -99)
#'
#' set.seed(1)
#' possibly_insistent_risky_runif()
#' set.seed(3)
#' possibly_insistent_risky_runif()
#' @export
insistently <- function(.f, quiet = TRUE, max_attempts = 5, wait_seconds = 0.1) {
  .f <- purrr::as_mapper(.f)

  force(quiet)
  force(max_attempts)
  force(wait_seconds)

  function(...) {
    for (i in seq_len(max_attempts)) {
      answer <- capture_error(.f(...), quiet = quiet)
      if (is.null(answer$error)) {
        return(answer$result)
      }
      if (wait_seconds > 0) {
        actual_wait_seconds <- stats::runif(1, 0, wait_seconds * 2 ^ (i - 1))
        if (!quiet) {
          message(sprintf("Retrying in %.3g seconds.", actual_wait_seconds))
        }
        Sys.sleep(actual_wait_seconds)
      }
    }
    if (!quiet) {
      msg <- sprintf(
        "%s failed after %d tries",
        deparse(match.call()),
        max_attempts
      )
      message(msg)
    }
    stop(answer$error)
  }
}
