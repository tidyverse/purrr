#' Reduce a list to a single value by iteratively applying a binary function.
#'
#' \code{reduce} combines from the left, \code{reduce_right} combines from
#' the right.
#'
#' @inheritParams map
#' @param .f A two-argument function.
#' @param .init If supplied, will be used as the first value to start
#'   the accumulation, rather than using \code{x[[1]]}. This is useful if
#'   you want to ensure that \code{reduce} returns the correct value when
#'   \code{.x} is \code{\link{empty}()}.
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
#'
#' # Use init when you want reduce to return a consistent type when
#' # given an empty lists
#' list() %>% reduce(`+`)
#' list() %>% reduce(`+`, .init = 0)
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
