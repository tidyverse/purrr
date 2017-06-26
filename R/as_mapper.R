
#' Convert an object into a mapper function
#'
#' `as_mapper` is the powerhouse behind the varied function
#' specifications that most purrr functions allow. It is an S3
#' generic. The default method forwards its arguments to
#' [rlang::as_function()].
#'
#' @param .f A function, formula, or atomic vector.
#'
#'   If a __function__, it is used as is.
#'
#'   If a __formula__, e.g. `~ .x + 2`, it is converted to a function. There
#'   are three ways to refer to the arguments:
#'
#'   * For a single argument function, use `.`
#'   * For a two argument function, use `.x` and `.y`
#'   * For more arguments, use `..1`, `..2`, `..3` etc
#'
#'   This syntax allows you to create very compact anonymous functions.
#'
#'   If __character vector__, __numeric vector__, or __list__, it
#'   is converted to an extractor function. Character vectors index by name
#'   and numeric vectors index by position; use a list to index by position
#'   and name at different levels. Within a list, wrap strings in `get_attr()`
#'   to extract named attributes. If a component is not present, the value of
#'   `.default` will be returned.
#' @param .default,.null Optional additional argument for extractor functions
#'   (i.e. when `.f` is character, integer, or list). Returned when
#'   value is absent (does not exist) or empty (has length 0).
#'   `.null` is deprecated; please use `.default` instead.
#' @param ... Additional arguments passed on to methods.
#' @export
#' @examples
#' as_mapper(~ . + 1)
#' as_mapper(1)
#'
#' as_mapper(c("a", "b", "c"))
#' # Equivalent to function(x) x[["a"]][["b"]][["c"]]
#'
#' as_mapper(list(1, "a", 2))
#' # Equivalent to function(x) x[[1]][["a"]][[2]]
#'
#' as_mapper(list(1, get_attr("a")))
#' # Equivalent to function(x) attr(x[[1]], "a")
#'
#' as_mapper(c("a", "b", "c"), .null = NA)
as_mapper <- function(.f, ...) {
  UseMethod("as_mapper")
}

#' @export
#' @rdname as_mapper
#' @usage NULL
as_function <- function(...) {
  warning(
    "`as_function()` is deprecated; please use `as_mapper()` or `rlang::as_function()` instead",
    call. = FALSE
  )
  as_mapper(...)
}

#' Pluck out a single an element from a vector or environment
#'
#' This is a generalise form of `[[` which allows you to index by
#' name, position, or attribute.
#'
#' @param x A vector or environment
#' @param index A list indexing into the object
#' @param default Value to use if target is empty or absent.
#' @keywords internal
#' @export
pluck <- function(x, index, default = NULL) {
  .Call(extract_impl, x, index, default)
}


# Vectors -----------------------------------------------------------------

#' @export
#' @rdname as_mapper
#' @param x A string
get_attr <- function(x) {
  stopifnot(is.character(x))
  structure(x, class = "attr")
}

#' @export
#' @rdname as_mapper
as_mapper.attr <- function(.f, ..., .null, .default = NULL) {
  .default <- find_extract_default(.null, .default)
  plucker(map(.f, get_attr), .default)
}

#' @export
#' @rdname as_mapper
as_mapper.character <- function(.f, ..., .null, .default = NULL) {
  .default <- find_extract_default(.null, .default)
  plucker(as.list(.f), .default)
}

#' @export
#' @rdname as_mapper
as_mapper.numeric <- function(.f, ..., .null, .default = NULL) {
  .default <- find_extract_default(.null, .default)
  plucker(as.list(.f), .default)
}

#' @export
#' @rdname as_mapper
as_mapper.list <- function(.f, ..., .null, .default = NULL) {
  .default <- find_extract_default(.null, .default)
  plucker(.f, .default)
}

find_extract_default <- function(.null, .default) {
  if (!missing(.null)) {
    # warning("`.null` is deprecated; please use `.default` instead", call. = FALSE)
    .null
  } else {
    .default
  }
}

plucker <- function(i, default) {
  stopifnot(is.list(i))

  expr_interp(function(x, ...)
    pluck(x, !!(i), default = !!(default))
  )
}


# Default -----------------------------------------------------------------

#' @export
as_mapper.default <- function(.f, ...) {
  rlang::as_closure(.f)
}
