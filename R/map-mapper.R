#' Convert an object into a mapper function
#'
#' `as_mapper` is the powerhouse behind the varied function
#' specifications that most purrr functions allow. It is an S3
#' generic. The default method forwards its arguments to
#' [rlang::as_function()].
#'
#' @param .f A function, formula, or vector (not necessarily atomic).
#'
#'   If a __function__, it is used as is.
#'
#'   If a __formula__, e.g. `~ .x + 2`, it is converted to a function.
#'   No longer recommended.
#'
#'   If __character vector__, __numeric vector__, or __list__, it is
#'   converted to an extractor function. Character vectors index by
#'   name and numeric vectors index by position; use a list to index
#'   by position and name at different levels. If a component is not
#'   present, the value of `.default` will be returned.
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
as_mapper <- function(.f, ...) {
  UseMethod("as_mapper")
}

#' @export
as_mapper.default <- function(.f, ...) {
  if (typeof(.f) %in% c("special", "builtin")) {
    .f <- rlang::as_closure(.f)

    # Workaround until fixed in rlang
    if (is_reference(fn_env(.f), base_env())) {
      environment(.f) <- global_env()
    }

    .f
  } else {
    rlang::as_function(.f)
  }
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
