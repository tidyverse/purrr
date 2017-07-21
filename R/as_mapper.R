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
#' as_mapper(list(1, attr_getter("a")))
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
#' @description
#'
#' This is a generalised form of `[[` which allows you to index deeply
#' and flexibly into data structures. It supports R standard accessors
#' like integer positions and string names and accepts any accessor
#' functions.
#'
#' `pluck()` is often more readable than a mix of operators and
#' accessors because it reads linearly and is free of syntactic
#' cruft. Compare: `accessor(x[[1]])$foo` to `pluck(x, 1, accessor,
#' "foo")`.
#'
#' @param .x A vector or environment
#' @param ... A list of accessors for indexing into the object. Can be
#'   an integer position, a string name, or an accessor function.
#'   These dots [splice lists automatically][rlang::dots_splice]. This
#'   means you can supply arguments and lists of arguments
#'   indistinctly.
#' @param .default Value to use if target is empty or absent.
#' @keywords internal
#' @export
#' @examples
#' # pluck() supports integer positions, string names, and functions.
#' # Using functions, you can easily extend pluck(). Let's create a
#' # list of data structures:
#' obj1 <- list("a", list(1, elt = "foobar"))
#' obj2 <- list("b", list(2, elt = "foobaz"))
#' x <- list(obj1, obj2)
#'
#' # And now an accessor for these complex data structures:
#' my_element <- function(x) x[[2]]$elt
#'
#' # The accessor can then be passed to pluck:
#' pluck(x, 1, my_element)
#' pluck(x, 2, my_element)
#'
#' # Even for this simple data structure, this is more readable than
#' # the alternative form:
#' my_element(x[[1]])
#'
#'
#' # This technique is used for plucking into attributes with
#' # attr_getter(). It takes an attribute name and returns a function
#' # to access the attribute:
#' obj1 <- structure("obj", obj_attr = "foo")
#' obj2 <- structure("obj", obj_attr = "bar")
#' x <- list(obj1, obj2)
#'
#' # pluck() is handy for extracting deeply into a data structure.
#' # Here we'll first extract by position, then by attribute:
#' pluck(x, 1, attr_getter("obj_attr"))  # From first object
#' pluck(x, 2, attr_getter("obj_attr"))  # From second object
#'
#'
#' # pluck() splices lists of arguments automatically. The following
#' # pluck is equivalent to the one above:
#' idx <- list(1, attr_getter("obj_attr"))
#' pluck(x, idx)
pluck <- function(.x, ..., .default = NULL) {
  .Call(extract_impl, .x, dots_splice(...), .default)
}

#' @export
#' @rdname pluck
#' @param attr An attribute name as string.
attr_getter <- function(attr) {
  function(x) attr(x, attr)
}


# Vectors -----------------------------------------------------------------

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
    pluck(x, !! i, .default = !! default)
  )
}


# Default -----------------------------------------------------------------

#' @export
as_mapper.default <- function(.f, ...) {
  rlang::as_closure(.f)
}
