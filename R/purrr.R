#' @keywords internal
#' @import rlang
#' @import vctrs
#' @importFrom lifecycle deprecated
#' @useDynLib purrr, .registration = TRUE
"_PACKAGE"


has_force_and_call <- FALSE

.onLoad <- function(lib, pkg) {
  if (getRversion() >= "3.2.3") {
    has_force_and_call <<- TRUE
  }
}
