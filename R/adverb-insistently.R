#' Transform a function to wait then retry after an error
#'
#' @description
#' `insistently()` takes a function and modifies it to retry after given
#' amount of time whenever it errors.
#'
#' @inheritParams safely
#' @param rate A [rate][rate-helpers] object. Defaults to jittered exponential
#'   backoff.
#' @inheritParams rate_sleep
#' @seealso [httr::RETRY()] is a special case of [insistently()] for
#'   HTTP verbs.
#' @inheritSection safely Adverbs
#' @inherit safely return
#' @family adverbs
#' @export
#' @examples
#' # For the purpose of this example, we first create a custom rate
#' # object with a low waiting time between attempts:
#' rate <- rate_delay(0.1)
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
#' # You can also use other types of rate settings, like a delay rate
#' # that waits for a fixed amount of time. Be aware that a delay rate
#' # has an infinite amount of attempts by default:
#' rate <- rate_delay(0.2, max_times = 3)
#' insistent_risky_runif <- insistently(risky_runif, rate = rate, quiet = FALSE)
#' try(insistent_risky_runif())
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
insistently <- function(f, rate = rate_backoff(), quiet = TRUE) {
  f <- as_mapper(f)
  check_rate(rate)
  check_bool(quiet)

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
