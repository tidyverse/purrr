#' Apply a function to each element of a vector
#'
#' @description
#'
#' The map functions transform their input by applying a function to
#' each element and returning a vector the same length as the input.
#'
#' * `map()`, `map_if()` and `map_at()` always return a list. See the
#'   [modify()] family for versions that return an object of the same
#'   type as the input.
#'
#'   The `_if` and `_at` variants take a predicate function `.p` that
#'   determines which elements of `.x` are transformed with `.f`.
#'
#' * `map_lgl()`, `map_int()`, `map_dbl()` and `map_chr()` each return
#'    an atomic vector of the indicated type (or die trying).
#'
#'    The return value of `.f` must be of length one for each element of
#'    `.x`. If `.f` uses an extractor function shortcut, `.default`
#'    can be specified to handle values that are absent or empty.  See
#'    [as_mapper()] for more on `.default`.
#'
#' * `map_dfr()` and `map_dfc()` return data frames created by
#'   row-binding and column-binding respectively. They require dplyr
#'   to be installed.
#'
#' * `walk()` calls `.f` for its side-effect and returns the input `.x`.
#'
#' @inheritParams as_mapper
#' @param .x A list or atomic vector.
#' @param .p A single predicate function, a formula describing such a
#'   predicate function, or a logical vector of the same length as `.x`.
#'   Alternatively, if the elements of `.x` are themselves lists of
#'   objects, a string indicating the name of a logical element in the
#'   inner lists. Only those elements where `.p` evaluates to
#'   `TRUE` will be modified.
#' @param .at A character vector of names, positive numeric vector of
#'   positions to include, or a negative numeric vector of positions to
#'   exlude. Only those elements corresponding to `.at` will be modified.
#'   If the `tidyselect` package is installed, you can use `vars()` and
#'   the `tidyselect` helpers to select elements.
#' @param ... Additional arguments passed on to the mapped function.
#' @return All functions return a vector the same length as `.x`.
#'
#'   `map()` returns a list, `map_lgl()` a logical vector, `map_int()` an
#'   integer vector, `map_dbl()` a double vector, and `map_chr()` a character
#'   vector. `map_df()`, `map_dfc()`, `map_dfr()` all return a data frame.
#'   The output of `.f` will be automatically typed upwards,
#'   e.g. logical -> integer -> double -> character.
#'
#'   If `.x` has `names()`, the return value preserves those names.
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
#' # The names of the input are preserved in the output:
#' list(foo = 1, bar = 2) %>% map(`+`, 10)
#'
#' # Using set_names() with character vectors is handy to keep track
#' # of the original inputs:
#' set_names(c("foo", "bar")) %>% map_chr(paste0, ":suffix")
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
#'
#' # Use a predicate function to decide whether to map a function:
#' map_if(iris, is.factor, as.character)
#'
#' # Specify an alternative with the `.else` argument:
#' map_if(iris, is.factor, as.character, .else = as.integer)
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
#' # map_dfr to row-bind them together:
#' mtcars %>%
#'   split(.$cyl) %>%
#'   map(~ lm(mpg ~ wt, data = .x)) %>%
#'   map_dfr(~ as.data.frame(t(as.matrix(coef(.)))))
#' # (if you also want to preserve the variable names see
#' # the broom package)
#'
#' # Use `map_depth()` to recursively traverse nested vectors and map
#' # a function at a certain depth:
#' x <- list(a = list(foo = 1:2, bar = 3:4), b = list(baz = 5:6))
#' str(x)
#' map_depth(x, 2, paste, collapse = "/")
#'
#' # Equivalent to:
#' map(x, map, paste, collapse = "/")
map <- function(.x, .f, ...) {
  .f <- as_mapper(.f, ...)
  .Call(map_impl, environment(), ".x", ".f", "list")
}
#' @rdname map
#' @param .else A function applied to elements of `.x` for which `.p`
#'   returns `FALSE`.
#' @export
map_if <- function(.x, .p, .f, ..., .else = NULL) {
  sel <- probe(.x, .p)

  out <- list_along(.x)
  out[sel]  <- map(.x[sel], .f, ...)

  if (is_null(.else)) {
    out[!sel] <- .x[!sel]
  } else {
    out[!sel]  <- map(.x[!sel], .else, ...)
  }

  set_names(out, names(.x))
}

#' @rdname map
#' @export
map_at <- function(.x, .at, .f, ...) {

  where <- at_selection(names(.x), .at)
  sel <- inv_which(.x, where)

  out <- list_along(.x)
  out[sel]  <- map(.x[sel], .f, ...)
  out[!sel] <- .x[!sel]

  set_names(out, names(.x))
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
#' @export
map_raw <- function(.x, .f, ...) {
  .f <- as_mapper(.f, ...)
  .Call(map_impl, environment(), ".x", ".f", "raw")
}

#' @rdname map
#' @param .id Either a string or `NULL`. If a string, the output will contain
#'   a variable with that name, storing either the name (if `.x` is named) or
#'   the index (if `.x` is unnamed) of the input. If `NULL`, the default, no
#'   variable will be created.
#'
#'   Only applies to `_dfr` variant.
#' @export
map_dfr <- function(.x, .f, ..., .id = NULL) {
  if (!is_installed("dplyr")) {
    abort("`map_df()` requires dplyr")
  }

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
  if (!is_installed("dplyr")) {
    abort("`map_dfc()` requires dplyr")
  }

  .f <- as_mapper(.f, ...)
  res <- map(.x, .f, ...)
  dplyr::bind_cols(res)
}

#' @export
#' @rdname map
walk <- function(.x, .f, ...) {
  map(.x, .f, ...)
  invisible(.x)
}

#' @rdname map
#' @param .depth Level of `.x` to map on. Use a negative value to count up
#'   from the lowest level of the list.
#'
#'   * `map_depth(x, 0, fun)` is equivalent to `fun(x)`.
#'   * `map_depth(x, 1, fun)` is equivalent to `x <- map(x, fun)`
#'   * `map_depth(x, 2, fun)` is equivalent to `x <- map(x, ~ map(., fun))`
#' @param .ragged If `TRUE`, will apply to leaves, even if they're not
#'   at depth `.depth`. If `FALSE`, will throw an error if there are
#'   no elements at depth `.depth`.
#' @export
map_depth <- function(.x, .depth, .f, ..., .ragged = FALSE) {
  if (!is_integerish(.depth, n = 1, finite = TRUE)) {
    abort("`.depth` must be a single number")
  }
  if (.depth < 0) {
    .depth <- vec_depth(.x) + .depth
  }

  .f <- as_mapper(.f, ...)
  map_depth_rec(.x, .depth, .f, ..., .ragged = .ragged, .atomic = FALSE)
}

map_depth_rec <- function(.x,
                          .depth,
                          .f,
                          ...,
                          .ragged,
                          .atomic) {
  if (.depth < 0) {
    abort("Invalid depth")
  }

  if (.atomic) {
    if (!.ragged) {
      abort("List not deep enough")
    }
    return(map(.x, .f, ...))
  }

  if (.depth == 0) {
    return(.f(.x, ...))
  }

  if (.depth == 1) {
    return(map(.x, .f, ...))
  }

  # Should this be replaced with a generic way of figuring out atomic
  # types?
  .atomic <- is_atomic(.x)

  map(.x, function(x) {
    map_depth_rec(x, .depth - 1, .f, ..., .ragged = .ragged, .atomic = .atomic)
  })
}
