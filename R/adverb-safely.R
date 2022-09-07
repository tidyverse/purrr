#' Wrap a function to capture errors
#'
#' Creates a modified version of `.f` that always succeeds. It returns a list
#' with components `result` and `error`. If the function succeeds, `result`
#' contains the returned value and `error` is `NULL`. If an error occurred,
#' `error` is an `error` object and `result` is either `NULL` or `otherwise`.
#'
#' # Adverbs
#' This function is called an adverb because it modifies the effect of a
#' function (a verb). If you'd like to include a function created an adverb
#' in a package, be sure to read [faq-adverbs-export].
#'
#' @param .f A function to modify, specified in one of the following ways:
#'   * A named function, e.g. `mean`.
#'   * An anonymous function, e.g. `\(x) x + 1` or `function(x) x + 1`.
#'   * A formula, e.g. `~ .x + 1`. Only appropriate for simple tasks.
#' @param otherwise Default value to use when an error occurs.
#' @param quiet Hide errors (`TRUE`, the default), or display them
#'   as they occur?
#' @returns A function that takes the same arguments as `.f`, but returns
#'   a different value, as described above.
#' @family adverbs
#' @export
#' @examples
#' safe_log <- safely(log)
#' safe_log(10)
#' safe_log("a")
#'
#' list("a", 10, 100) %>%
#'   map(safe_log) %>%
#'   transpose()
#'
#' # This is a bit easier to work with if you supply a default value
#' # of the same type and use the simplify argument to transpose():
#' safe_log <- safely(log, otherwise = NA_real_)
#' list("a", 10, 100) %>%
#'   map(safe_log) %>%
#'   transpose() %>%
#'   simplify_all()
safely <- function(.f, otherwise = NULL, quiet = TRUE) {
  .f <- as_mapper(.f)
  function(...) capture_error(.f(...), otherwise, quiet)
}

capture_error <- function(code, otherwise = NULL, quiet = TRUE) {
  tryCatch(
    list(result = code, error = NULL),
    error = function(e) {
      if (!quiet)
        message("Error: ", e$message)

      list(result = otherwise, error = e)
    },
    interrupt = function(e) {
      stop("Terminated by user", call. = FALSE)
    }
  )
}
