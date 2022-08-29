#' @keywords internal
#' @import rlang
#' @import vctrs
#' @importFrom lifecycle deprecated
#' @useDynLib purrr, .registration = TRUE
"_PACKAGE"


.onLoad <- function(lib, pkg) {
  .Call(purrr_init_library, ns_env(pkg))
}
