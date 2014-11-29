#' Keep or discard elements using a predicate function.
#'
#' \code{keep} and \code{discard} are opposites. \code{compact} is a handy
#' wrapper that removes all elements that are \code{NULL}.
#'
#' These are usually called \code{select} or \code{filter} and \code{reject} or
#' \code{drop}, but those names are already taken. \code{keep} is similar to
#' \code{\link{Filter}} but the argument order is more convenient, and the
#' evaluation of \code{.f} is stricter.
#'
#' @inheritParams map
#' @param .f A predicate function, i.e. a function that either returns
#'   \code{TRUE} or \code{FALSE}
#' @export
#' @examples
#' rep(10, 10) %>%
#'   map(sample, 5) %>%
#'   keep(function(x) mean(x) > 6)
#'
#' # You can also create functions with %>%
#' rep(10, 10) %>%
#'   map(sample, 5) %>%
#'   keep(. %>% {mean(.) > 6})
keep <- function(.x, .f, ...) {
  sel <- vapply(.x, .f, logical(1), ...)
  .x[!is.na(sel) & sel]
}

#' @export
#' @rdname keep
discard <- function(.x, .f, ...) {
  sel <- vapply(.x, .f, logical(1), ...)
  .x[is.na(sel) | sel]
}

#' @export
#' @rdname keep
compact <- function(.x) discard(.x, is.null)
