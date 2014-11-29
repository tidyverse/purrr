#' Reduce a list to a single value by iteratively applying a binary function.
#'
#' \code{reduce} combines from the left, \code{reduce_right} combines from
#' the right.
#'
#' @inheritParams map
#' @param .init If supplied, will be used as the first value to start
#'   the accumulation, rather than using \code{x[[1]]}.
#' @export
#' @examples
#' 1:3 %>% reduce(`+`)
#' 1:10 %>% reduce(`*`)
#'
#' 5 %>%
#'   replicate(sample(10, 5), simplify = FALSE) %>%
#'   reduce(intersect)
#'
#' x <- list(c(0, 1), c(2, 3), c(4, 5))
#' x %>% reduce(c)
#' x %>% reduce_right(c)
#' # Equivalent to:
#' x %>% rev() %>% reduce(c)
reduce <- function(.x, .f, ..., .init) {
  force(.f)
  f <- function(x, y) .f(x, y, ...)

  Reduce(f, .x, init = .init)
}

#' @export
#' @rdname reduce
reduce_right <- function(.x, .f, ..., .init) {
  force(.f)
  # Note the order of arguments is switched
  f <- function(x, y) {
    .f(y, x, ...)
  }

  Reduce(f, .x, init = .init, right = TRUE)
}
