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
#' @param .l A list of vectors to zip.
#' @param .fields Fields to use when unzipping - defaults to the names
#'   of the first sub-list.
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
#' # transpose() is useful in conjunction with safe()
#' x <- list("a", 1, 2)
#' y <- x %>% map(safe(log))
#' y %>% str()
#' y %>% transpose() %>% str()
#'
#' # The simplify argument reduces list to atomic vectors where possible
#' x <- list(a = 1:5, b = 5:1)
#' x %>% transpose()
#' x %>% transpose(.simplify = TRUE)
transpose <- function(.l, .fields = NULL, .simplify = FALSE) {
  if (length(.l) == 0) return(list())

  if (is.null(.fields)) {
    if (is.null(names(.l[[1]]))) {
      .fields <- seq_along(.l[[1]])
    } else {
      .fields <- stats::setNames(names(.l[[1]]), names(.l[[1]]))
    }
  } else {
    if (is.character(.fields) && is.null(names(.fields))) {
      names(.fields) <- .fields
    }
  }

  out <- lapply(.fields, function(i) lapply(.l, .subset2, i))
  if (.simplify) out <- lapply(out, simplify_if_possible)
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
  transpose(list(.x, .y), .fields = .fields, .simplify = .simplify)
}

#' @rdname transpose
#' @export
#' @usage NULL
zip3 <- function(.x, .y, .z, .fields = NULL, .simplify = FALSE) {
  warning(
    "`zip2(x, y, z)` is deprecated, please use `transpose(list(x, y, z))` instead.",
    call. = FALSE
  )

  transpose(list(.x, .y, .z), .fields = .fields, .simplify = .simplify)
}
