#' Re-run expressions multiple times.
#'
#' @description
#'
#' \Sexpr[results=rd, stage=render]{purrr:::lifecycle("questioning")}
#'
#' This is a convenient way of generating sample data. It works similarly to
#' \code{\link{replicate}(..., simplify = FALSE)}.
#'
#' @param .n Number of times to run expressions
#' @param ... Expressions to re-run.
#' @return A list of length `.n`. Each element of `...` will be
#'   re-run once for each `.n`.
#'
#'   There is one special case: if there's a single unnamed input, the second
#'   level list will be dropped. In this case, `rerun(n, x)` behaves like
#'   `replicate(n, x, simplify = FALSE)`.
#'
#' @section Lifecycle:
#'
#' `rerun()` is in the questioning lifecycle stage because we are no
#' longer convinced NSE functions are a good fit for purrr. Also,
#' `rerun(n, x)` can just as easily be expressed as `map(1:n, ~ x)`
#' (with the added benefit of being passed the current index as
#' argument to the lambda).
#'
#' @export
#' @examples
#' 10 %>% rerun(rnorm(5))
#' 10 %>%
#'   rerun(x = rnorm(5), y = rnorm(5)) %>%
#'   map_dbl(~ cor(.x$x, .x$y))
rerun <- function(.n, ...) {
  dots <- quos(...)

  # Special case: if single unnamed argument, insert directly into the output
  # rather than wrapping in a list.
  if (length(dots) == 1 && !has_names(dots)) {
    dots <- dots[[1]]
    eval_dots <- eval_tidy
  } else {
    eval_dots <- function(x) lapply(x, eval_tidy)
  }

  out <- vector("list", .n)
  for (i in seq_len(.n)) {
    out[[i]] <- eval_dots(dots)
  }
  out
}
