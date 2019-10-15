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
#'   If a __formula__, e.g. `~ .x + 2`, it is converted to a function. There
#'   are three ways to refer to the arguments:
#'
#'   * For a single argument function, use `.`
#'   * For a two argument function, use `.x` and `.y`
#'   * For more arguments, use `..1`, `..2`, `..3` etc
#'
#'   This syntax allows you to create very compact anonymous functions.
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
#' as_mapper(~ . + 1)
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
#' @rdname as_mapper
#' @usage NULL
as_function <- function(...) {
  stop_defunct(paste_line(
    "`as_function()` is defunct as of purrr 0.3.0.",
    "Please use `as_mapper()` or `rlang::as_function()` instead"
  ))
  as_mapper(...)
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

  new_function(
    exprs(x = , ... = ),
    expr(pluck(x, !!!i, .default = !!default)),
    env = caller_env()
  )
}

as_predicate <- function(.fn, ..., .mapper, .deprecate = FALSE) {
  if (.mapper) {
    .fn <- as_mapper(.fn, ...)
  }

  function(...) {
    out <- .fn(...)

    if (!is_bool(out)) {
      msg <- sprintf(
        "Predicate functions must return a single `TRUE` or `FALSE`, not %s",
        as_predicate_friendly_type_of(out)
      )
      if (.deprecate) {
        msg <- paste_line(
          "Returning complex values from a predicate function is soft-deprecated as of purrr 0.3.0.",
          msg
        )
        signal_soft_deprecated(msg)
      } else {
        abort(msg)
      }
    }

    out
  }
}

as_predicate_friendly_type_of <- function(x) {
  if (is_na(x)) {
    "a missing value"
  } else {
    friendly_type_of(x, length = TRUE)
  }
}
