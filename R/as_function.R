
#' Convert an object into a function
#'
#' `as_function` is the powerhouse behind the varied function
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
#'   `.null` will be returned.
#' @param .null Optional additional argument for extractor functions
#'   (i.e. when `.f` is character, integer, or list). Returned when
#'   value does not exist or is `NULL`.
#' @param ... Additional arguments passed on to methods.
#' @export
#' @examples
#' as_function(~ . + 1)
#' as_function(1)
#'
#' as_function(c("a", "b", "c"))
#' # Equivalent to function(x) x[["a"]][["b"]][["c"]]
#'
#' as_function(list(1, "a", 2))
#' # Equivalent to function(x) x[[1]][["a"]][[2]]
#'
#' as_function(list(1, get_attr("a")))
#' # Equivalent to function(x) attr(x[[1]], "a")
#'
#' as_function(c("a", "b", "c"), .null = NA)
as_function <- function(.f, ...) {
  UseMethod("as_function")
}

#' @export
#' @rdname as_function
as_function.function <- function(.f, ...) .f

#' @export
#' @rdname as_function
as_function.formula <- function(.f, ...) {
  if (length(.f) != 2) {
    stop("Formula must be one sided", call. = FALSE)
  }
  args <- alist(... = ..., .x = ..1, .y = ..2, . = ..1)
  new_fn(args, f_rhs(.f), f_env(.f))
}

#' @useDynLib purrr extract_impl
extract <- function(x, index, .null = NULL) {
  .Call(extract_impl, x, index, .null)
}

#' @export
#' @rdname as_function
#' @param x A string
get_attr <- function(x) {
  stopifnot(is.character(x))
  structure(x, class = "attr")
}

#' @export
#' @rdname as_function
as_function.attr <- function(.f, ..., .null = NULL) {
  as_function(map(.f, get_attr), ..., .null = .null)
}

#' @export
#' @rdname as_function
as_function.character <- function(.f, ..., .null = NULL) {
  as_function(as.list(.f), ..., .null = .null)
}

#' @export
#' @rdname as_function
as_function.numeric <- function(.f, ..., .null = NULL) {
  as_function(as.list(.f), ..., .null = .null)
}

#' @export
#' @rdname as_function
as_function.list <- function(.f, ..., .null = NULL) {
  idx <- .f
  function(g, ...) {
    extract(g, idx, .null)
  }
}

#' @export
as_function.default <- function(.f, ...) {
  stop("Don't know how to convert ", paste0(class(.f), collapse = "/"),
       " into a function", call. = FALSE)
}
