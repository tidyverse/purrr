#' Pipe operator
#'
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @export
#' @importFrom magrittr %>%
#' @usage lhs \%>\% rhs
NULL


as_function <- function(f) {
  if (is.function(f)) {
    f
  } else if (is.character(f) || is.numeric(f)) {
    function(g) .subset2(g, f)
  } else if (inherits(f, "formula")) {
    if (length(f) != 2) {
      stop("Formula must be one sided", call. = FALSE)
    }
    make_function(alist(x = ), f[[2]], environment(f))
  } else {
    stop("Don't know how to convert ", paste0(class(f), collapse = "/"),
      " into a function", call. = FALSE)
  }
}
