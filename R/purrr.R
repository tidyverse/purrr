#' @keywords internal
#' @import rlang
#' @import vctrs
#' @importFrom cli cli_progress_bar
#' @useDynLib purrr, .registration = TRUE
"_PACKAGE"


has_force_and_call <- FALSE

.onLoad <- function(lib, pkg) {
  if (getRversion() >= "3.2.3") {
    has_force_and_call <<- TRUE
  }

  .Call(purrr_init_library, ns_env(pkg))
}
