#' @keywords internal
#' @import rlang
#' @import vctrs
#' @importFrom carrier crate
#' @importFrom cli cli_progress_bar
#' @importFrom lifecycle deprecated
#' @importFrom mirai daemons
#' @useDynLib purrr, .registration = TRUE
"_PACKAGE"

the <- new_environment()

#' @export
carrier::crate

#' @export
mirai::daemons
