#' Apply a function to each element of a vector
#'
#' @description
#' The map function transform the input, returning a vector the same length
#' as the input. `map()` returns a list or a data frame; `map_lgl()`,
#' `map_int()`, `map_dbl()` and `map_chr()` return vectors of the
#' corresponding type (or die trying); `map_df()` returns a data frame by
#' row-binding the individual elements.
#'
#' `walk()` calls `.f` for its side-effect and returns the input `.x`.
#'
#' @inheritParams as_function
#' @param .x A list or atomic vector.
#' @param ... Additional arguments passed on to `.f`.
#' @return `map()` always returns a list the same length as `.x`.
#'
#'   `map_lgl()` returns a logical vector, `map_int()` an integer
#'   vector, `map_dbl()`, a double vector, `map_chr()`, a character
#'   vector. The output of `.f` will be automatically typed upwards,
#'   e.g. logical -> integer -> double -> character. The output
#'   is always the same length as the input.
#'
#'   `walk()` (invisibly) the input `.x`. It's called primarily for
#'   its side effects, but this makes it easier to combine in a pipe.
#' @seealso [map2()] and [pmap()] to map over multiple
#'   inputs simulatenously
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
#' # .null specifies value for elements that are missing or NULL
#' l1 <- list(list(a = 1L), list(a = NULL, b = 2L), list(b = 3L))
#' l1 %>% map("a", .null = "???")
#' l1 %>% map_int("b", .null = NA)
#' l1 %>% map_int(2, .null = NA)
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
#' # and .null to provide a default value if the element does not exist
#' l2 %>% map(list("num", 3))
#' l2 %>% map_int(list("num", 3), .null = NA)
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
#' @useDynLib purrr map_impl map_by_slice_impl
map <- function(.x, .f, ...) {
  .f <- as_function(.f, ...)
  .Call(map_impl, environment(), ".x", ".f", "list")
}

#' @rdname map
#' @export
map_lgl <- function(.x, .f, ...) {
  .f <- as_function(.f, ...)
  .Call(map_impl, environment(), ".x", ".f", "logical")
}

#' @rdname map
#' @export
map_chr <- function(.x, .f, ...) {
  .f <- as_function(.f, ...)
  .Call(map_impl, environment(), ".x", ".f", "character")
}

#' @rdname map
#' @export
map_int <- function(.x, .f, ...) {
  .f <- as_function(.f, ...)
  .Call(map_impl, environment(), ".x", ".f", "integer")
}

#' @rdname map
#' @export
map_dbl <- function(.x, .f, ...) {
  .f <- as_function(.f, ...)
  .Call(map_impl, environment(), ".x", ".f", "double")
}

#' @rdname map
#' @param .id If not `NULL` a variable with this name will be created
#'   giving either the name or the index of the data frame.
#' @export
map_df <- function(.x, .f, ..., .id = NULL) {
  .f <- as_function(.f, ...)
  res <- map(.x, .f, ...)
  dplyr::bind_rows(res, .id = .id)
}


#' @export
#' @rdname map
walk <- function(.x, .f, ...) {
  .f <- as_function(.f, ...)
  for (i in seq_along(.x)) {
    .f(.x[[i]], ...)
  }
  invisible(.x)
}
