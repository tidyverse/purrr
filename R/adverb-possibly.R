#' Wrap a function to avoid errors
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
#' list("a", 10, 100) %>%
#'   map_dbl(possibly(log, NA_real_))
possibly <- function(.f, otherwise, quiet = TRUE) {
  .f <- as_mapper(.f)
  force(otherwise)

  function(...) {
    tryCatch(.f(...),
      error = function(e) {
        if (!quiet)
          message("Error: ", e$message)
        otherwise
      },
      interrupt = function(e) {
        stop("Terminated by user", call. = FALSE)
      }
    )
  }
}
