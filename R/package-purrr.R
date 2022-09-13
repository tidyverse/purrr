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

.onAttach <- function(...) {
  if (interactive() && getRversion() < "4.1") {
    packageStartupMessage(
      "purrr examples use features only available in R 4.1 and greater"
    )
  }
}
