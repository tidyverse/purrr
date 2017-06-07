#' Transpose a list.
#'
#' Transpose turns a list-of-lists "inside-out"; it turns a pair of lists into a
#' list of pairs, or a list of pairs into pair of lists. For example,
#' if you had a list of length n where each component had values `a` and
#' `b`, `transpose()` would make a list with elements `a` and
#' `b` that contained lists of length n. It's called transpose because
#' \code{x[[1]][[2]]} is equivalent to \code{transpose(x)[[2]][[1]]}.
#'
#' Note that `transpose()` is its own inverse, much like the
#' transpose operation on a matrix. You can get back the original
#' input by transposing it twice.
#'
#' @param .l A list of vectors to zip. The first element is used as the
#'   template; you'll get a warning if a sub-list is not the same length as
#'   the first element.
#' @param .names For efficiency, `transpose()` usually inspects the
#'   first component of `.l` to determine the structure. Use `.names`
#'   if you want to override this default.
#' @return A list with indexing transposed compared to `.l`.
#' @export
#' @examples
#' x <- rerun(5, x = runif(1), y = runif(5))
#' x %>% str()
#' x %>% transpose() %>% str()
#' # Back to where we started
#' x %>% transpose() %>% transpose() %>% str()
#'
#' # transpose() is useful in conjunction with safely() & quietly()
#' x <- list("a", 1, 2)
#' y <- x %>% map(safely(log))
#' y %>% str()
#' y %>% transpose() %>% str()
#'
#' # Use simplify_all() to reduce to atomic vectors where possible
#' x <- list(list(a = 1, b = 2), list(a = 3, b = 4), list(a = 5, b = 6))
#' x %>% transpose()
#' x %>% transpose() %>% simplify_all()
#'
#' # Provide explicit component names to prevent loss of those that don't
#' # appear in first component
#' ll <- list(
#'   list(x = 1, y = "one"),
#'   list(z = "deux", x = 2)
#' )
#' ll %>% transpose()
#' nms <- ll %>% map(names) %>% reduce(union)
#' ll %>% transpose(.names = nms)
transpose <- function(.l, .names = NULL) {
  .Call(transpose_impl, .l, .names)
}
