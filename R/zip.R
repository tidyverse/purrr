#' Zip lists.
#'
#' Zip turns a list-of-lists "inside-out".  For example, if you had a
#' list of length n where each component had values \code{a} and
#' \code{b}, \code{zip_n()} would make a with elements \code{a} and
#' \code{b} that contained lists of length n.
#'
#' Note that \code{zip_n()} is its own inverse, much like the
#' transpose operation on a matrix. You can get back the original
#' input by zipping it twice. \code{zip2(x, y)} is a shortcut for
#' \code{zip_n(list(x, y))}.
#'
#' @param .x,.y,.z Lists or vectors
#' @param .fields Fields to use when unzipping - defaults to the names
#'   of the first sub-list.
#' @param .simplify If \code{TRUE}, lists containing atomic scalars of
#'   the same type will be converted to a vector.
#' @export
#' @examples
#' x <- rerun(5, x = runif(1), y = runif(5))
#' x %>% str()
#' x %>% zip_n() %>% str()
#' x %>% zip_n() %>% zip_n() %>% str()
#'
#' x <- list(a = 1:5, b = 5:1)
#' x %>% zip_n()
#' x %>% zip_n(.simplify = TRUE)
#'
#' # Zipping is its own inverse operation
#' x %>% str()
#' x %>% zip_n(.simplify = TRUE) %>% zip_n(.simplify = TRUE) %>% str()
#'
#' # zip2(x, y) is a shortcut for zip_n(list(x, y)). It can be handy
#' # but doesn't handle names and is not its own inverse.
#' x %>% zip_n() %>% str()
#' zip2(1:5, 5:1) %>% str()
zip_n <- function(.x, .fields = NULL, .simplify = FALSE) {
  if (length(.x) == 0) return(list())

  if (is.null(.fields)) {
    if (is.null(names(.x[[1]]))) {
      .fields <- seq_along(.x[[1]])
    } else {
      .fields <- setNames(names(.x[[1]]), names(.x[[1]]))
    }
  } else {
    if (is.character(.fields) && is.null(names(.fields))) {
      names(.fields) <- .fields
    }
  }

  out <- lapply(.fields, function(i) lapply(.x, .subset2, i))
  if (.simplify) out <- lapply(out, simplify_if_possible)
  out
}

#' @rdname zip_n
#' @export
zip2 <- function(.x, .y, .fields = NULL, .simplify = FALSE) {
  zip_n(list(.x, .y), .fields = .fields, .simplify = .simplify)
}

#' @rdname zip_n
#' @export
zip3 <- function(.x, .y, .z, .fields = NULL, .simplify = FALSE) {
  zip_n(list(.x, .y, .z), .fields = .fields, .simplify = .simplify)
}
