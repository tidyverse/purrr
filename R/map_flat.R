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
#'   `map_flat_raw` are equivalent to [map()] followed respectively by
#'   [flatten_lgl()], [flatten_int()], [flatten_dbl()], [flatten_chr()] and
#'   [flatten_raw()]
#'
#' * `map_flat_dfr()` and `map_flat_dfc()` are equivalent to [map()] followed
#'   respectively by [flatten_dfr()] and [flatten_dfc()]
#'
#' @section About map vs map_flat Variants:
#'
#' Compared to [map_lgl()], [map_chr()], etc,
#' map_flat functions are adapted to functions returning a variable
#' number of elements.
#'
#' The map variants works by coercing the list to
#' a vector of corresponding type - for that each element of the list resulting
#' map must be a length 1 atomic vector, otherwise it will return an error.
#'
#' map_flat variants don't have that limitation as they unlist one level before
#' trying to return a vector - it is more like concatenating map results, whatever the size
#' of each elements in the resulting list after applying the function.
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
#' # It can be useful to map a function but flatten the result
#' # to a vector. It is like concatenating map results.
#' c("one piece", "four red pieces") %>%
#'   map_flat_chr(~strsplit(.x, " ")[[1]])
#' # this is equivalent to
#' c("one piece", "four red pieces") %>%
#'   map(~strsplit(.x, " ")[[1]]) %>%
#'   flatten_chr()
#' # Using map_chr() does not work here because resulting
#' # elements before coercion is not of length 1,
#' # so coercion failed.
#' \dontrun{
#' c("one piece", "four red pieces") %>%
#'   map_chr(~strsplit(.x, " ")[[1]])
#' }
#'
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
