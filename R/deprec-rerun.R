#' Re-run expressions multiple times
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' This function was deprecated in purrr 1.0.0 because we believe that NSE
#' functions are not a  good fit for purrr. Also, `rerun(n, x)` can just as
#' easily be expressed as `map(1:n, \(i) x)`
#'
#' `rerun()` is a convenient way of generating sample data. It works similarly to
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
#' @export
#' @keywords internal
#' @examples
#' # old
#' 5 |> rerun(rnorm(5)) |> str()
#' # new
#' 1:5 |> map(\(i) rnorm(5)) |> str()
#'
#' # old
#' 5 |>
#'   rerun(x = rnorm(5), y = rnorm(5)) |>
#'   map_dbl(\(l) cor(l$x, l$y))
#' # new
#' 1:5 |>
#'   map(\(i) list(x = rnorm(5), y = rnorm(5))) |>
#'   map_dbl(\(l) cor(l$x, l$y))
rerun <- function(.n, ...) {
  deprec_rerun(.n, ..., .purrr_user_env = caller_env())

  dots <- quos(...)

  # Special case: if single unnamed argument, insert directly into the output
  # rather than wrapping in a list.
  if (length(dots) == 1 && !is_named(dots)) {
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

deprec_rerun <- function(.n, ..., .purrr_user_env) {
  n <- .n
  old <- substitute(rerun(n, ...))
  if (dots_n(...) == 1) {
    new <- substitute(map(1:n, ~...))
  } else {
    new <- substitute(map(1:n, ~ list(...)))
  }

  lifecycle::deprecate_soft(
    when = "1.0.0",
    what = "rerun()",
    with = "map()",
    details = c(
      " " = "# Previously",
      " " = expr_deparse(old),
      "",
      " " = "# Now",
      " " = expr_deparse(new)
    ),
    user_env = .purrr_user_env
  )
}
