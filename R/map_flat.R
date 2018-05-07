#' Map a function then flatten the result by one-level
#'
#' @description
#'
#' The map_flap functions are equivalent to applying [map()]
#' followed by a flatten function to remove one level of hierarchy
#' from the list obtained by using [map()].
#'
#' * `map_flat()` is equivalent to [map()] followed by [flatten()].
#'
#' * `map_flat_lgl()`, `map_flat_int()`, `map_flap_dbl()`, `map_flat_chr()` and
#'   `map_flat_raw` is equivalent to [map()] followed respectively by
#'   [flatten_lgl()], [flatten_int()], [flatten_dbl()], [flatten_chr()] and
#'   [flatten_raw()]
#'
#' * `map_flat_dfr()` and `map_flat_dfc()` is equivalent to [map()] followed
#'   respectively by [flatten_dfr()] and [flatten_dfc()]
#'
#' Compared to [map_lgl()], [map_chr()], etc,
#' map_flat functions are adapted to functions returning a variable
#' number of elements.
#'
#' @return `map_flat` returns a list, `map_flat_lgl()` a logical
#'   vector, `map_flat_int()` an integer vector, `map_flat_dbl()` a
#'   double vector, and `map_flat_chr()` a character vector.
#'
#'   `map_flat_dfr()` and `map_flat_dfc()` return data frames created by
#'   row-binding and column-binding respectively. They require dplyr to
#'   be installed.
#'
#' @inheritParams map
#' @export
#' @family map variants
#' @seealso [map_lgl()], [map_chr()], [map_dbl()], [map_int()], [map_dfr()],
#'   [map_dfc()], [map_raw()]
#' @examples
#' # Sample a variable number of elements from each column and
#' # concatenate the results
#' var_select <- function(x) sample(x, size = rdunif(1, 5))
#' # map var_select on each mtcars column then flatten the result
#' # by on level
#' c(mtcars) %>% map_flat(var_select) # a list
#' c(mtcars) %>% map_flat_dbl(var_select) # a numeric vector
#' c(mtcars) %>% map_flat_chr(var_select) # a character vector
#' # equivalent to
#' c(mtcars) %>% map(var_select) %>% flatten_dbl()
#' # as number of value is different in each element
#' # map_dbl won't work
#' \dontrun{
#' c(mtcars) %>% map_dbl(var_select)
#' }
map_flat <- function(.x, .f, ...) {
  out <- map(.x, .f = .f, ...)
  flatten(out)
}

#' @rdname map_flat
#' @export
map_flat_lgl <- function(.x, .f, ...) {
  out <- map(.x, .f = .f, ...)
  flatten_lgl(out)
}

#' @rdname map_flat
#' @export
map_flat_int <- function(.x, .f, ...) {
  out <- map(.x, .f = .f, ...)
  flatten_int(out)
}

#' @rdname map_flat
#' @export
map_flat_chr <- function(.x, .f, ...) {
  out <- map(.x, .f = .f, ...)
  flatten_chr(out)
}

#' @rdname map_flat
#' @export
map_flat_dbl <- function(.x, .f, ...) {
  out <- map(.x, .f = .f, ...)
  flatten_dbl(out)
}

#' @rdname map_flat
#' @export
map_flat_dfr <- function(.x, .f, ..., .id = NULL) {
  out <- map(.x, .f = .f, ...)
  flatten_dfr(out, .id = .id)
}

#' @rdname map_flat
#' @export
map_flat_dfc <- function(.x, .f, ...) {
  out <- map(.x, .f = .f, ...)
  flatten_dfc(out)
}

#' @rdname map_flat
#' @export
map_flat_raw <- function(.x, .f, ...) {
  out <- map(.x, .f = .f, ...)
  flatten_raw(out)
}
