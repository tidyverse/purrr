#' Re-run expressions multiple times.
#'
#' This is a convenient way of generating sample data. It works similarly to
#' \code{\link{replicate}(..., simplify = FALSE)}.
#'
#' @param .n Number of times to run expressions
#' @param ... Expressions to re-run.
#' @return A list of length \code{.n}. Each element of \code{...} will be
#'   re-run once for each \code{.n}. It
#'
#'   There is one special case: if there's a single unnamed input, the second
#'   level list will be dropped. In this case, \code{rerun(n, x)} behaves like
#'   \code{replicate(n, x, simplify = FALSE)}.
#' @export
#' @examples
#' 10 %>% rerun(rnorm(5))
#' 10 %>%
#'   rerun(x = rnorm(5), y = rnorm(5)) %>%
#'   map_dbl(~ cor(.x$x, .x$y))
rerun <- function(.n, ...) {
  dots <- lazyeval::lazy_dots(...)

  # Special case: if single unnamed argument, insert directly into the output
  # rather than wrapping in a list.
  if (length(dots) == 1 && !has_names(dots)) {
    dots <- dots[[1]]
  }

  out <- vector("list", .n)
  for (i in seq_len(.n)) {
    out[[i]] <- lazyeval::lazy_eval(dots)
  }
  out
}
