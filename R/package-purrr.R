#' @keywords internal
#' @import rlang
#' @import vctrs
#' @importFrom cli cli_progress_bar
#' @importFrom lifecycle deprecated
#' @useDynLib purrr, .registration = TRUE
"_PACKAGE"


.onLoad <- function(lib, pkg) {
  .Call(purrr_init_library, ns_env(pkg))
}
