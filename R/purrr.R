#' @keywords internal
#' @import rlang
#' @useDynLib purrr, .registration = TRUE
"_PACKAGE"


has_force_and_call <- FALSE

.onLoad <- function(lib, pkg) {
  if (getRversion() >= "3.2.3") {
    has_force_and_call <<- TRUE
  }
}
