#' Transpose a list.
#'
#' Tranpose turns a list-of-lists "inside-out"; it turns a pair of lists into a
#' list of pairs, or a list of pairs into pair of lists. For example,
#' If you had a list of length n where each component had values \code{a} and
#' \code{b}, \code{transpose()} would make a list with elements \code{a} and
#' \code{b} that contained lists of length n. It's called transpose because
#' \code{x[[1]][[2]]} is equivalent to \code{transpose(x)[[2]][[1]]}.
#'
#' Note that \code{transpose()} is its own inverse, much like the
#' transpose operation on a matrix. You can get back the original
#' input by zipping it twice.
#'
#' @param .l A list of vectors to zip. The first element is used as the
#'   template; you'll get a warning if a sub-list is not the same length as
#'   the first element. For efficiency, elements are matched by position, not
#'   by name.
#' @param .simplify If \code{TRUE}, lists containing atomic scalars of
#'   the same type will be converted to a vector.
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
#' # The simplify argument reduces list to atomic vectors where possible
#' x <- list(list(a = 1, b = 2), list(a = 3, b = 4), list(a = 5, b = 6))
#' x %>% transpose()
#' x %>% transpose(.simplify = TRUE)
#' @useDynLib purrr transpose_impl
transpose <- function(.l, .simplify = FALSE) {
  out <- .Call(transpose_impl, .l)
  if (.simplify) out <- map(out, simplify_if_possible)
  out
}

#' @rdname transpose
#' @export
#' @usage NULL
zip_n <- function(...) {
  warning("`zip_n()` is deprecated; please use `transpose()` instead.",
    call. = FALSE)
  transpose(...)
}

#' @rdname transpose
#' @export
#' @usage NULL
zip2 <- function(.x, .y, .fields = NULL, .simplify = FALSE) {
  warning(
    "`zip2(x, y)` is deprecated, please use `transpose(list(x, y))` instead.",
    call. = FALSE
  )
  transpose(list(.x, .y), .simplify = .simplify)
}

#' @rdname transpose
#' @export
#' @usage NULL
zip3 <- function(.x, .y, .z, .fields = NULL, .simplify = FALSE) {
  warning(
    "`zip2(x, y, z)` is deprecated, please use `transpose(list(x, y, z))` instead.",
    call. = FALSE
  )

  transpose(list(.x, .y, .z), .simplify = .simplify)
}
