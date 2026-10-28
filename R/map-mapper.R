#' Convert an object into a mapper function
#'
#' `as_mapper` is the powerhouse behind the varied function
#' specifications that most purrr functions allow. It is an S3
#' generic. The default method forwards its arguments to
#' [rlang::as_function()].
#'
#' @param .f A function, specified in one of the following ways:
#'
#'   * A named function, e.g. `mean`.
#'   * An anonymous function, e.g. `\(x) x + 1` or `function(x) x + 1`.

#'   * A string, integer, or list, e.g. `"idx"`, `1`, or `list("idx", 1)` which
#'     are converted to extractor functions, i.e. `\(x) pluck(x, "idx")`,
#'     `\(x) pluck(x, 1)`, and `\(x) pluck(x, "idx", 1)` respectively.
#'     Character vectors index by name and numeric vectors index by position;
#'     use a list to index by position and name at different levels. If a
#'     component is not present, the value of `.default` will be returned.
#' @param .default,.null Optional additional argument for extractor functions
#'   (i.e. when `.f` is character, integer, or list). Returned when
#'   value is absent (does not exist) or empty (has length 0).
#'   `.null` is deprecated; please use `.default` instead.
#' @param ... Additional arguments passed on to methods.
#' @export
#' @examples
#' as_mapper(\(x) x + 1)
#' as_mapper(1)
#'
#' as_mapper(c("a", "b", "c"))
#' # Equivalent to function(x) x[["a"]][["b"]][["c"]]
#'
#' as_mapper(list(1, "a", 2))
#' # Equivalent to function(x) x[[1]][["a"]][[2]]
#'
#' as_mapper(list(1, attr_getter("a")))
#' # Equivalent to function(x) attr(x[[1]], "a")
#'
#' as_mapper(c("a", "b", "c"), .default = NA)
as_mapper <- function(.f, ..., .user_env = caller_env(2)) {
  UseMethod("as_mapper")
}

#' @export
as_mapper.default <- function(.f, ..., .user_env = caller_env(2)) {
  if (inherits(.f, "formula")) {
    lifecycle::deprecate_soft(
      when = "1.3.0",
      what = I("Using a formula in place of a function"),
      with = I("an anonymous function"),
      user_env = .user_env
    )
  }
  rlang::as_function(.f)
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
  x <- NULL # supress global variables check NOTE
  i <- as.list(i)

  # Use metaprogramming to create function that prints nicely
  new_function(
    exprs(x = , ... = ),
    expr(pluck_raw(x, !!i, .default = !!default))
  )
}
