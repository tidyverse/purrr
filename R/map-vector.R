#' Map a function and flatten the result by one-level
#'
#' Deprecated: please use \code{map()} followed by \code{flatten()}.
#'
#' @export
#' @keywords internal
flatmap <- function(.x, .f, ..., .type) {
  warning("`flatmap()` has been deprecated. Please use `map()` + `flatten()",
    call. = FALSE)
  out <- map(.x, .f = .f, ...)
  flatten(out)
}
