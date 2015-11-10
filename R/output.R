#' Capture side effects
#'
#' These functions wrap functions so instead generating side effects through
#' output, messages, warnings, and errors, they instead return enchanced
#' output.
#'
#' @inheritParams map
#' @param quiet Hide errors (\code{TRUE}, the default), or display them
#'   as they occur?
#' @param otherwise Default value to use when an error occurs.
#' @return \code{safe}: a list with components \code{result} and \code{error}.
#'   One value is always \code{NULL}
#'
#' \code{outputs}: a list with components \code{result}, \code{output},
#'   \code{messages} and \code{warnings}.
#' @export
#' @examples
#' safe_log <- safe(log)
#' safe_log(10)
#' safe_log("a")
#'
#' list("a", 10, 100) %>%
#'   map(safe_log) %>%
#'   zip_n()
#'
#' # To replace errors with a default value, use maybe().
#' list("a", 10, 100) %>%
#'   map_dbl(maybe(log, NA))
safe <- function(.f, quiet = TRUE) {
  .f <- as_function(.f)
  function(...) capture_error(.f(...))
}

#' @export
#' @rdname safe
outputs <- function(.f) {
  .f <- as_function(.f)
  function(...) capture_output(.f(...))
}

#' @export
#' @rdname safe
maybe <- function(.f, otherwise, quiet = TRUE) {
  .f <- as_function(.f)
  force(otherwise)

  function(...) {
    tryCatch(f(...),
      error = function(e) {
        if (!quiet)
          message("Error: ", e$message)
        otherwise
      }
    )
  }
}


capture_error <- function(code, quiet = TRUE) {
  tryCatch(
    list(result = code, error = NULL),
    error = function(e) {
      if (!quiet)
        message("Error: ", e$message)

      list(result = NULL, error = e)
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
