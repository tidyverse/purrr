#' Apply a function to each element of a vector
#'
#' @description
#' The map function transform the input, returning a vector the same length
#' as the input. `map()` returns a list or a data frame; `map_lgl()`,
#' `map_int()`, `map_dbl()` and `map_chr()` return vectors of the
#' corresponding type (or die trying).
#'
#' `map_dfr()` and `map_dfc()` return data frames created by row-binding and
#' column-binding respectively. They require dplyr to be installed.
#'
#' `walk()` calls `.f` for its side-effect and returns the input `.x`.
#'
#' @inheritParams as_mapper
#' @param .x A list or atomic vector.
#' @param ... Additional arguments passed on to `.f`.
#' @return All functions return a vector the same length as `.x`.
#'
#'   `map()` returns a list, `map_lgl()` a logical vector, `map_int()` an
#'   integer vector, `map_dbl()` a double vector, and `map_chr()` a character
#'   vector. The output of `.f` will be automatically typed upwards,
#'   e.g. logical -> integer -> double -> character.
#'
#'   `walk()` returns the input `.x` (invisibly). This makes it easy to
#'   use in pipe.
#' @export
#' @family map variants
#' @examples
#' 1:10 %>%
#'   map(rnorm, n = 10) %>%
#'   map_dbl(mean)
#'
#' # Or use an anonymous function
#' 1:10 %>%
#'   map(function(x) rnorm(10, x))
#'
#' # Or a formula
#' 1:10 %>%
#'   map(~ rnorm(10, .x))
#'
#' # Extract by name or position
#' # .default specifies value for elements that are missing or NULL
#' l1 <- list(list(a = 1L), list(a = NULL, b = 2L), list(b = 3L))
#' l1 %>% map("a", .default = "???")
#' l1 %>% map_int("b", .default = NA)
#' l1 %>% map_int(2, .default = NA)
#'
#' # Supply multiple values to index deeply into a list
#' l2 <- list(
#'   list(num = 1:3,     letters[1:3]),
#'   list(num = 101:103, letters[4:6]),
#'   list()
#' )
#' l2 %>% map(c(2, 2))
#'
#' # Use a list to build an extractor that mixes numeric indices and names,
#' # and .default to provide a default value if the element does not exist
#' l2 %>% map(list("num", 3))
#' l2 %>% map_int(list("num", 3), .default = NA)
#'
#' # A more realistic example: split a data frame into pieces, fit a
#' # model to each piece, summarise and extract R^2
#' mtcars %>%
#'   split(.$cyl) %>%
#'   map(~ lm(mpg ~ wt, data = .x)) %>%
#'   map(summary) %>%
#'   map_dbl("r.squared")
#'
#' # Use map_lgl(), map_dbl(), etc to reduce to a vector.
#' # * list
#' mtcars %>% map(sum)
#' # * vector
#' mtcars %>% map_dbl(sum)
#'
#' # If each element of the output is a data frame, use
#' # map_df to row-bind them together:
#' mtcars %>%
#'   split(.$cyl) %>%
#'   map(~ lm(mpg ~ wt, data = .x)) %>%
#'   map_df(~ as.data.frame(t(as.matrix(coef(.)))))
#' # (if you also want to preserve the variable names see
#' # the broom package)
map <- function(.x, .f, ...) {
  .f <- as_mapper(.f, ...)
  .Call(map_impl, environment(), ".x", ".f", "list")
}

#' @rdname map
#' @export
map_lgl <- function(.x, .f, ...) {
  .f <- as_mapper(.f, ...)
  .Call(map_impl, environment(), ".x", ".f", "logical")
}

#' @rdname map
#' @export
map_chr <- function(.x, .f, ...) {
  .f <- as_mapper(.f, ...)
  .Call(map_impl, environment(), ".x", ".f", "character")
}

#' @rdname map
#' @export
map_int <- function(.x, .f, ...) {
  .f <- as_mapper(.f, ...)
  .Call(map_impl, environment(), ".x", ".f", "integer")
}

#' @rdname map
#' @export
map_dbl <- function(.x, .f, ...) {
  .f <- as_mapper(.f, ...)
  .Call(map_impl, environment(), ".x", ".f", "double")
}

#' @rdname map
#' @param .id If not `NULL` a variable with this name will be created
#'   giving either the name or the index of the data frame.
#' @export
map_dfr <- function(.x, .f, ..., .id = NULL) {
  .f <- as_mapper(.f, ...)
  res <- map(.x, .f, ...)
  dplyr::bind_rows(res, .id = .id)
}

#' @rdname map
#' @export
#' @usage NULL
map_df <- map_dfr

#' @rdname map
#' @export
map_dfc <- function(.x, .f, ...) {
  .f <- as_mapper(.f, ...)
  res <- map(.x, .f, ...)
  dplyr::bind_cols(res)
}

#' @export
#' @rdname map
walk <- function(.x, .f, ...) {
  .f <- as_mapper(.f, ...)
  for (i in seq_along(.x)) {
    .f(.x[[i]], ...)
  }
  invisible(.x)
}
