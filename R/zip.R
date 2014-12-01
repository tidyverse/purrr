#' Zip and unzip lists.
#'
#' Zip and unzip are useful transforms for turning a list-of-lists "inside-out".
#' For example, if you had a list of length n where each component had values
#' \code{a} and \code{b}, \code{unzip} would make a with elements \code{a}
#' and \code{b} that contained lists of length n.
#'
#' @param .x A list.
#' @param fields Fields to use when unzipping - defaults to the names
#'   of the first sub-list.
#' @export
#' @examples
#' x <- rerun(10, x = runif(1), y = runif(5))
#' unzip(x)
#'
#' zip(list(a = 1:5, b = 5:1))
zip <- function(.x) {

  n <- unique(map(.x, length, .type = integer(1)))
  if (length(n) != 1) {
    stop("All elements must be same length", call. = FALSE)
  }

  lapply(seq_len(n), function(i) {
    lapply(.x, .subset2, i)
  })
}

#' @export
#' @rdname zip
unzip <- function(.x, fields = NULL) {
  if (length(.x) == 0) return(list())

  if (is.null(fields)) {
    fields <- seq_along(.x[[1]])
    names(fields) <- names(.x[[1]])
  } else {
    if (is.character(fields) && is.null(names(fields))) {
      names(fields) <- fields
    }
  }

  lapply(fields, function(i) lapply(.x, .subset2, i))
}
