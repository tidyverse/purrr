#' Pipe operator
#'
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @export
#' @importFrom magrittr %>%
#' @usage lhs \%>\% rhs
NULL


#' Modify a list
#'
#' @param _data A list.
#' @param ... New values of a list. Use `NULL` to remove values.
#'   Use a formula to evaluate in the context of the list values.
#' @export
#' @examples
#' x <- list(x = 1:10, y = 4)
#' update_list(x, z = 10)
#' update_list(x, z = ~ x + y)
update_list <- function(`_data`, ...) {
  new_values <- list(...)

  is_formula <- map_lgl(new_values, ~inherits(., "formula"))

  new_values[is_formula] <- lapply(new_values[is_formula], function(f) {
    stopifnot(length(f) == 2)
    eval(f[[2]], `_data`, environment(f))
  })

  utils::modifyList(`_data`, new_values)
}

maybe_as_data_frame <- function(out, x) {
  if (is.data.frame(x)) {
    tibble::as_tibble(out)
  } else {
    out
  }
}

recycle_args <- function(args) {
  lengths <- map_int(args, length)
  n <- max(lengths)

  stopifnot(all(lengths == 1L | lengths == n))
  to_recycle <- lengths == 1L
  args[to_recycle] <- lapply(args[to_recycle], function(x) rep.int(x, n))
  args
}

names2 <- function(x) {
  names(x) %||% rep("", length(x))
}

#' Default value for `NULL`.
#'
#' This infix function makes it easy to replace `NULL`s with a
#' default value. It's inspired by the way that Ruby's or operation (`||`)
#' works.
#'
#' @param x,y If `x` is NULL, will return `y`; otherwise returns
#'   `x`.
#' @export
#' @name null-default
#' @examples
#' 1 %||% 2
#' NULL %||% 2
`%||%` <- function(x, y) {
  if (is.null(x)) {
    y
  } else {
    x
  }
}

#' Infix attribute accessor
#'
#' @param x Object
#' @param name Attribute name
#' @export
#' @name get-attr
#' @examples
#' factor(1:3) %@% "levels"
#' mtcars %@% "class"
`%@%` <- function(x, name) attr(x, name, exact = TRUE)


#' Generate random samples from a Bernoulli distribution
#'
#' @param n Number of samples
#' @param p Probability of getting `TRUE`
#' @return A logical vector
#' @export
#' @examples
#' rbernoulli(10)
#' rbernoulli(100, 0.1)
rbernoulli <- function(n, p = 0.5) {
  sample(c(TRUE, FALSE), n, replace = TRUE, prob = c(p, 1 - p))
}

#' Generate random samples from a discrete uniform distribution
#'
#' @param n Number of samples to draw.
#' @param a,b Range of the distribution (inclusive).
#' @export
#' @examples
#' table(rdunif(1e3, 10))
#' table(rdunif(1e3, 10, -5))
rdunif <- function(n, b, a = 1) {
  stopifnot(is.numeric(a), length(a) == 1)
  stopifnot(is.numeric(b), length(b) == 1)

  a1 <- min(a, b)
  b1 <- max(a, b)

  sample(b1 - a1 + 1, n, replace = TRUE) + a1 - 1
}

# magrittr placeholder
globalVariables(".")


has_names <- function(x) {
  nms <- names(x)
  if (is.null(nms)) {
    rep_along(x, FALSE)
  } else {
    !(is.na(nms) | nms == "")
  }
}

isFALSE <- function(x) identical(x, FALSE)

ndots <- function(...) nargs()
