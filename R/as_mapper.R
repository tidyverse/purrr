
#' Convert an object into a mapper function
#'
#' `as_mapper` is the powerhouse behind the varied function
#' specifications that most purrr functions allow. It is an S3 generic.
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
    "`as_function()` is deprecated; please use `as_mapper()` instead",
    call. = FALSE
  )
  as_mapper(...)
}

#' @export
#' @rdname as_mapper
as_mapper.function <- function(.f, ...) .f

#' @export
#' @rdname as_mapper
as_mapper.formula <- function(.f, ...) {
  if (length(.f) != 2) {
    stop("Formula must be one sided", call. = FALSE)
  }
  new_fn(f_mapper_args(), f_rhs(.f), f_env(.f))
}

f_mapper_args <- function() {
  list(... = arg_missing(), .x = quote(..1), .y = quote(..2), . = quote(..1))
}

#' Extract an element from a vector or environment
#'
#' @param x A vector or environment
#' @param index A list indexing into the object
#' @param default Value to use if target is empty or absent.
#' @keywords internal
#' @useDynLib purrr extract_impl
#' @export
extract <- function(x, index, default = NULL) {
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
  extractor(map(.f, get_attr), .default)
}

#' @export
#' @rdname as_mapper
as_mapper.character <- function(.f, ..., .null, .default = NULL) {
  .default <- find_extract_default(.null, .default)
  extractor(as.list(.f), .default)
}

#' @export
#' @rdname as_mapper
as_mapper.numeric <- function(.f, ..., .null, .default = NULL) {
  .default <- find_extract_default(.null, .default)
  extractor(as.list(.f), .default)
}

#' @export
#' @rdname as_mapper
as_mapper.list <- function(.f, ..., .null, .default = NULL) {
  .default <- find_extract_default(.null, .default)
  extractor(.f, .default)
}

find_extract_default <- function(.null, .default) {
  if (!missing(.null)) {
    warning("`.null` is deprecated; please use `.default` instead", call. = FALSE)
    .null
  } else {
    .default
  }
}

extractor <- function(i, default) {
  stopifnot(is.list(i))

  tidy_interp(function(x, ...) {
    extract(x, !!(i), default = !!(default))
  })
}


# Default -----------------------------------------------------------------

#' @export
as_mapper.default <- function(.f, ...) {
  stop("Don't know how to convert ", paste0(class(.f), collapse = "/"),
       " into a function", call. = FALSE)
}
