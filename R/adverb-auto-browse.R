#' Wrap a function so it will automatically `browse()` on error
#'
#' A function wrapped with `auto_browse()` will automatically enter an
#' interactive debugger using [browser()] when ever it encounters an error.
#'
#' @inheritParams safely
#' @inheritSection safely Adverbs
#' @inherit safely return
#' @family adverbs
#' @export
#' @examples
#' # For interactive usage, auto_browse() is useful because it automatically
#' # starts a browser() in the right place.
#' f <- function(x) {
#'   y <- 20
#'   if (x > 5) {
#'     stop("!")
#'   } else {
#'     x
#'   }
#' }
#' if (interactive()) {
#'   map(1:6, auto_browse(f))
#' }
#'
auto_browse <- function(.f) {
  if (is_primitive(.f)) {
    cli::cli_abort(
      "{.arg .f} must not be a primitive function.",
      arg = ".f"
    )
  }

  function(...) {
    withCallingHandlers(
      .f(...),
      error = function(e) {
        # 1: h(simpleError(msg, call))
        # 2: .handleSimpleError(function (e)  <...>
        # 3: stop(...)
        frame <- sys.frame(4)
        browse_in_frame(frame)
      },
      warning = function(e) {
        if (getOption("warn") >= 2) {
          frame <- sys.frame(7)
          browse_in_frame(frame)
        }
      }
    )
  }
}

browse_in_frame <- function(frame) {
  # ESS should problably set `.Platform$GUI == "ESS"`
  # In the meantime, check that ESSR is attached
  if (is_attached("ESSR")) {
    # Workaround ESS issue
    with_env(
      frame,
      on.exit({
        browser()
        NULL
      })
    )
    return_from(frame)
  } else {
    eval_bare(quote(browser()), env = frame)
  }
}
