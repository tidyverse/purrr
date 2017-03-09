#' Capture side effects.
#'
#' These functions wrap functions so that instead of generating side effects
#' through printed output, messages, warnings, and errors, they return enhanced
#' output. They are all adverbs because they modify the action of a verb (a
#' function).
#'
#' @inheritParams map
#' @param quiet Hide errors (`TRUE`, the default), or display them
#'   as they occur?
#' @param otherwise Default value to use when an error occurs.
#'
#' @return `safely`: wrapped function instead returns a list with
#'   components `result` and `error`. One value is always `NULL`.
#'
#'   `quietly`: wrapped function instead returns a list with components
#'   `result`, `output`, `messages` and `warnings`.
#'
#'   `possibly`: wrapped function uses a default value (`otherwise`)
#'   whenever an error occurs.
#'
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
#'
#' # To replace errors with a default value, use possibly().
#' list("a", 10, 100) %>%
#'   map_dbl(possibly(log, NA_real_))
safely <- function(.f, otherwise = NULL, quiet = TRUE) {
  .f <- as_mapper(.f)
  function(...) capture_error(.f(...), otherwise, quiet)
}

#' @export
#' @rdname safely
quietly <- function(.f) {
  .f <- as_mapper(.f)
  function(...) capture_output(.f(...))
}

#' @export
#' @rdname safely
possibly <- function(.f, otherwise, quiet = TRUE) {
  .f <- as_mapper(.f)
  force(otherwise)

  function(...) {
    tryCatch(.f(...),
      error = function(e) {
        if (!quiet)
          message("Error: ", e$message)
        otherwise
      }
    )
  }
}


capture_error <- function(code, otherwise = NULL, quiet = TRUE) {
  tryCatch(
    list(result = code, error = NULL),
    error = function(e) {
      if (!quiet)
        message("Error: ", e$message)

      list(result = otherwise, error = e)
    }
  )
}

capture_output <- function(code) {
  warnings <- character()
  wHandler <- function(w) {
    warnings <<- c(warnings, w$message)
    invokeRestart("muffleWarning")
  }

  messages <- character()
  mHandler <- function(m) {
    messages <<- c(messages, m$message)
    invokeRestart("muffleMessage")
  }

  temp <- file()
  sink(temp)
  on.exit({
    sink()
    close(temp)
  })

  result <- withCallingHandlers(
    code,
    warning = wHandler,
    message = mHandler
  )

  output <- paste0(readLines(temp, warn = FALSE), collapse = "\n")

  list(
    result = result,
    output = output,
    warnings = warnings,
    messages = messages
  )
}
