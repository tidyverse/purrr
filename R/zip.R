#' Zip lists.
#'
#' Zip turns a list-of-lists "inside-out".  For example, if you had a list of
#' length n where each component had values \code{a} and \code{b}, \code{unzip}
#' would make a with elements \code{a} and \code{b} that contained lists of
#' length n.
#'
#' @param .x A list.
#' @param .fields Fields to use when unzipping - defaults to the names
#'   of the first sub-list.
#' @param .simplify If \code{TRUE}, lists containing atomic scalars of the
#'   same type will be converted to a vector.
#' @export
#' @examples
#' x <- rerun(5, x = runif(1), y = runif(5))
#' x %>% str()
#' x %>% zip() %>% str()
#' x %>% zip() %>% zip() %>% str()
#'
#' list(a = 1:5, b = 5:1) %>% zip()
#' list(a = 1:5, b = 5:1) %>% zip(.simplify = TRUE)
zip <- function(.x, .fields = NULL, .simplify = FALSE) {
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

# Simplify a list of atomic vectors of the same type to a vector
#
# simplify_list(list(1, 2, 3))
can_simplify <- function(x) {
  is_atomic <- vapply(x, is.atomic, logical(1))
  if (!all(is_atomic)) return(FALSE)

  n <- vapply(x, length, integer(1))
  if (!all(n == 1)) return(FALSE)

  mode <- unique(vapply(x, typeof, character(1)))
  if (length(mode) > 1) return(FALSE)

  TRUE
}
simplify_if_possible <- function(x) {
  if (!can_simplify(x)) return(x)
  unlist(x)
}
