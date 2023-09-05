#' @keywords internal
#' @import rlang
#' @import vctrs
#' @importFrom cli cli_progress_bar
#' @importFrom lifecycle deprecated
#' @useDynLib purrr, .registration = TRUE
"_PACKAGE"

the <- new_environment()
the$last_map_results <- NULL
the$last_map_index <- NULL
the$last_map <- NULL
