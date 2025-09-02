#' Transpose a list.
#'
#' @description
#' `r lifecycle::badge("superseded")`
#'
#' `transpose()` turns a list-of-lists "inside-out"; it turns a pair of lists
#' into a list of pairs, or a list of pairs into pair of lists. For example,
#' if you had a list of length n where each component had values `a` and
#' `b`, `transpose()` would make a list with elements `a` and
#' `b` that contained lists of length n. It's called transpose because
#' \code{x[[1]][[2]]} is equivalent to \code{transpose(x)[[2]][[1]]}.
#'
#' This function was superseded in purrr 1.0.0 because [list_transpose()]
#' has a better name and can automatically simplify the output, as is commonly
#' needed. Superseded functions will not go away, but will only receive critical
#' bug fixes.
#'
#' @param .l A list of vectors to transpose. The first element is used as the
#'   template; you'll get a warning if a subsequent element has a different
#'   length.
#' @param .names For efficiency, `transpose()` bases the return structure on
#'   the first component of `.l` by default. Specify `.names` to override this.
#' @return A list with indexing transposed compared to `.l`.
#'
#'   `transpose()` is its own inverse, much like the transpose operation on a
#'    matrix. You can get back the original input by transposing it twice.
#' @keywords internal
#' @export
#' @examples
#' x <- map(1:5, \(i) list(x = runif(1), y = runif(5)))
#' # was
#' x |> transpose() |> str()
#' # now
#' x |> list_transpose(simplify = FALSE) |> str()
#'
#' # transpose() is useful in conjunction with safely() & quietly()
#' x <- list("a", 1, 2)
#' y <- x |> map(safely(log))
#' # was
#' y |> transpose() |> str()
#' # now:
#' y |> list_transpose() |> str()
#'
#' # Previously, output simplification required a call to another function
#' x <- list(list(a = 1, b = 2), list(a = 3, b = 4), list(a = 5, b = 6))
#' x |> transpose() |> simplify_all()
#' # Now can take advantage of automatic simplification
#' x |> list_transpose()
#'
#' # Provide explicit component names to prevent loss of those that don't
#' # appear in first component
#' ll <- list(
#'   list(x = 1, y = "one"),
#'   list(z = "deux", x = 2)
#' )
#' ll |> transpose()
#' nms <- ll |> map(names) |> reduce(union)
#' # was
#' ll |> transpose(.names = nms)
#' # now
#' ll |> list_transpose(template = nms)
#' # and can supply default value
#' ll |> list_transpose(template = nms, default = NA)
transpose <- function(.l, .names = NULL) {
  # 1.0.0
  if (!isTRUE(the$transpose_signalled)) {
    lifecycle::signal_stage("superseded", "transpose()", "list_transpose()")
    the$transpose_signalled <- TRUE
  }
  .Call(transpose_impl, .l, .names)
}
