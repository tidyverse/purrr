#' Wrap a function to return a value instead of an error
#'
#' Create a modified version of `.f` that return a default value (`otherwise`)
#' whenever an error occurs.
#'
#' @inheritParams safely
#' @inheritSection safely Adverbs
#' @inherit safely return
#' @family adverbs
#' @export
#' @examples
#' # To replace errors with a default value, use possibly().
#' list("a", 10, 100) |>
#'   map_dbl(possibly(log, NA_real_))
#'
#' # The default, NULL, will be discarded with `list_c()`
#' list("a", 10, 100) |>
#'   map(possibly(log)) |>
#'   list_c()
possibly <- function(.f, otherwise = NULL, quiet = TRUE) {
  .f <- as_mapper(.f)
  force(otherwise)
  check_bool(quiet)

  function(...) {
    tryCatch(.f(...), error = function(e) {
      if (!quiet) {
        message("Error: ", conditionMessage(e))
      }
      otherwise
    })
  }
}
