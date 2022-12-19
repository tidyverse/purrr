#' Wrap a function to capture side-effects
#'
#' Create a modified version of `.f` that captures side-effects along with
#' the return value of the function and returns a list containing
#' the `result`, `output`, `messages` and `warnings`.
#'
#' @inheritParams safely
#' @inheritSection safely Adverbs
#' @inherit safely return
#' @family adverbs
#' @export
#' @examples
#' f <- function() {
#'   print("Hi!")
#'   message("Hello")
#'   warning("How are ya?")
#'   "Gidday"
#' }
#' f()
#'
#' f_quiet <- quietly(f)
#' str(f_quiet())
quietly <- function(.f) {
  .f <- as_mapper(.f)
  function(...) capture_output(.f(...))
}

capture_output <- function(code) {
  warnings <- character()
  wHandler <- function(w) {
    warnings <<- c(warnings, conditionMessage(w))
    invokeRestart("muffleWarning")
  }

  messages <- character()
  mHandler <- function(m) {
    messages <<- c(messages, conditionMessage(m))
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
