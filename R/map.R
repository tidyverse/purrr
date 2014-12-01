#' Apply a function to each element of a list.
#'
#' \code{map} returns the transformed input; \code{each} calls \code{.f} for
#' its side-effect and returns the original input.
#'
#' @param .x A list or vector.
#' @param .f A function, formula or string.
#'
#'   If a function, it is used as is.
#'
#'   If a formula, e.g. \code{~ x + 2}, it is converted to a function with
#'   a single argument, \code{x}, e.g. \code{function(x) x + 2}. This is less
#'   typing for very simple anonymous functions.
#'
#'   If a string, e.g. \code{"y"}, it is converted to an extractor function,
#'   \code{function(x) x[["y"]]}.
#' @param ... Additional arguments passed on to \code{.f}.
#' @param .type Specifies the type of result of \code{.f}, if known.
#'   If supplied, the result of \code{map} will be a vector or matrix.
#'   If omitted, the result of \code{map} will be a list.
#' @return \code{map} the transformed input; \code{each} the input \code{.x}.
#' @seealso \code{\link{pluck}} for a wrapper around a common use case:
#'   extracting an element from each component; \code{\link{map2}()} and
#'   \code{\link{map3}()} to map over multiple inputs simulatenously
#' @export
#' @examples
#' 1:10 %>%
#'   map(rnorm, n = 10) %>%
#'   map(mean, .type = numeric(1))
#'
#' # Or use an anonymous function
#' 1:10 %>%
#'   map(function(x) rnorm(10, x))
#'
#' # Or a formula
#' 1:10 %>%
#'   map(~ rnorm(10, x))
#'
#' # A more realistic example: split a data frame into pieces, fit a
#' # model to each piece, summarise and extract R^2
#' mtcars %>%
#'   split(.$cyl) %>%
#'   map(~ lm(mpg ~ wt, data = x)) %>%
#'   map(summary) %>%
#'   map("r.squared", .type = numeric(1))
map <- function(.x, .f, ..., .type) {
  .f <- as_function(.f)

  if (missing(.type)) {
    lapply(.x, .f, ...)
  } else {
    vapply(.x, .f, ..., FUN.VALUE = .type)
  }
}

#' @export
#' @rdname map
each <- function(.x, .f, ...) {
  for (i in seq_along(.x)) {
    .f(.x[[i]], ...)
  }
  .x
}


#' Map over multiple inputs simultaneously.
#'
#' @inheritParams map
#' @param .f A function of two (for \code{map2}) or three (\code{map3})
#'   arguments.
#' @param .x,.y,.z Lists, usually of the same length. If not, lists will
#'   be recycled to the length of the longest, using R's regular recycling
#'   rules.
#' @export
#' @examples
#' x <- list(1, 10, 100)
#' y <- list(1, 2, 3)
#' map2(x, y, `+`)
map2 <- function(.x, .y, .f, ...) {
  force(.f)
  f <- function(x, y) {
    .f(x, y, ...)
  }
  Map(f, .x, .y)
}

#' @export
#' @rdname map2
map3 <- function(.x, .y, .z, .f, ...) {
  force(.f)
  f <- function(x, y, z) {
    .f(x, y, ...)
  }
  Map(f, .x, .y, .z)
}
