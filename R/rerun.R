#' Re-run expressions multiple times.
#'
#' This is a convenient way of generating sample data. It works similarly to
#' \code{\link{replicate}(..., simplify = FALSE)}.
#'
#' @param n Number of times to run expressions
#' @param ... Expressions to re-run.
#' @return A list of length \code{n}. Each element of \code{...} will be
#'   re-run once for each \code{n}. It
#'
#'   There is one special case: if there's a single unnamed input, the second
#'   level list will be dropped. In this case, \code{rerun(n, x)} behaves like
#'   \code{replicate(n, x, simplify = FALSE)}.
#' @export
#' @examples
#' 10 %>% rerun(rnorm(5))
#' 10 %>%
#'   rerun(x = rnorm(5), y = rnorm(5)) %>%
#'   map(~ cor(x$x, x$y), .type = numeric(1))
rerun <- function(n, ...) {
  dots <- substitute(list(...))

  out <- vector("list", n)

  # Special case: if single unnamed argument, insert directly into the output
  # rather than wrapping in a list.
  if (nargs() == 2 && is.null(names(dots))) {
    dots <- dots[[2]]
  }

  for (i in seq_len(n)) {
    out[[i]] <- eval(dots)
  }

  out
}
