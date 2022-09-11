#' Safely get or set an element deep within a nested data structure
#'
#' @description
#' `pluck()` implements a generalised form of `[[` that allow you to index
#' deeply and flexibly into data structures. It always succeeds, returning
#' `.default` if the index you are trying to access does not exist or is `NULL`.
#'
#' `pluck<-()` is the assignment equivalent, allowing you to modify an object
#' deped within a nested data structure.
#'
#' `pluck_exists()` tells you whether or not an object exists using the
#' same rules as pluck (i.e. a `NULL` element is equivalent to an absent
#' element).
#'
#' @param .x,x A vector or environment
#' @param ... A list of accessors for indexing into the object. Can be
#'   an positive integer, a negative integer (to index from the right),
#'   a string (to index into names), or an accessor function
#'   (except for the assignment variants which only support names and
#'   positions). If the object being indexed is an S4 object,
#'   accessing it by name will return the corresponding slot.
#'
#'   [Dynamic dots][rlang::dyn-dots] are supported. In particular, if
#'   your accessors are stored in a list, you can splice that in with
#'   `!!!`.
#' @param .default Value to use if target is `NULL` or absent.
#'
#' @details
#' * You can pluck or chuck with standard accessors like integer
#'   positions and string names, and also accepts arbitrary accessor
#'   functions, i.e. functions that take an object and return some
#'   internal piece.
#'
#'   This is often more readable than a mix of operators and accessors
#'   because it reads linearly and is free of syntactic
#'   cruft. Compare: \code{accessor(x[[1]])$foo} to `pluck(x, 1,
#'   accessor, "foo")`.
#'
#' * These accessors never partial-match. This is unlike `$` which
#'   will select the `disp` object if you write `mtcars$di`.
#'
#' @seealso [attr_getter()] for creating attribute getters suitable
#'   for use with `pluck()` and `chuck()`. [modify_in()] for
#'   applying a function to a pluck location.
#' @export
#' @examples
#' # Let's create a list of data structures:
#' obj1 <- list("a", list(1, elt = "foo"))
#' obj2 <- list("b", list(2, elt = "bar"))
#' x <- list(obj1, obj2)
#'
#' # pluck() provides a way of retrieving objects from such data
#' # structures using a combination of numeric positions, vector or
#' # list names, and accessor functions.
#'
#' # Numeric positions index into the list by position, just like `[[`:
#' pluck(x, 1)
#' # same as x[[1]]
#'
#' # Index from the back
#' pluck(x, -1)
#' # same as x[[2]]
#'
#' pluck(x, 1, 2)
#' # same as x[[1]][[2]]
#'
#' # Supply names to index into named vectors:
#' pluck(x, 1, 2, "elt")
#' # same as x[[1]][[2]][["elt"]]
#'
#' # By default, pluck() consistently returns `NULL` when an element
#' # does not exist:
#' pluck(x, 10)
#' try(x[[10]])
#'
#' # You can also supply a default value for non-existing elements:
#' pluck(x, 10, .default = NA)
#'
#' # The map() functions use pluck() by default to retrieve multiple
#' # values from a list:
#' map_chr(x, 1)
#' map_int(x, c(2, 1))
#'
#' # pluck() also supports accessor functions:
#' my_element <- function(x) x[[2]]$elt
#' pluck(x, 1, my_element)
#' pluck(x, 2, my_element)
#'
#' # Even for this simple data structure, this is more readable than
#' # the alternative form because it requires you to read both from
#' # right-to-left and from left-to-right in different parts of the
#' # expression:
#' my_element(x[[1]])
#'
#' # If you have a list of accessors, you can splice those in with `!!!`:
#' idx <- list(1, my_element)
#' pluck(x, !!!idx)
pluck <- function(.x, ..., .default = NULL) {
  check_dots_unnamed()
  pluck_raw(.x, list2(...), .default = .default)
}

#' @rdname pluck
#' @inheritParams modify_in
#' @export
`pluck<-` <- function(.x, ..., value) {
  assign_in(.x, list2(...), value)
}

#' @rdname pluck
#' @export
pluck_exists <- function(.x, ...) {
  check_dots_unnamed()

  !is_zap(pluck_raw(.x, list2(...), .default = zap()))
}

pluck_raw <- function(.x, index, .default = NULL, .error_call = caller_env()) {
  .Call(
    pluck_impl,
    x = .x,
    index = index,
    missing = .default,
    strict = FALSE,
    error_call = .error_call
  )
}

#' Get an element deep within a nested data structure, failing if it doesn't
#' exist
#'
#' `chuck()` implements a generalised form of `[[` that allow you to index
#' deeply and flexibly into data structures. If the index you are trying to
#' access does not exist (or is `NULL`), it will throw (i.e. chuck) an error.
#'
#' @seealso [pluck()] for a quiet equivalent.
#' @inheritParams pluck
#' @export
#' @examples
#' x <- list(a = 1, b = 2)
#'
#' # When indexing an element that doesn't exist `[[` sometimes returns NULL:
#' x[["y"]]
#' # and sometimes errors:
#' try(x[[3]])
#'
#' # chuck() consistently errors:
#' try(chuck(x, "y"))
#' try(chuck(x, 3))
chuck <- function(.x, ...) {
  check_dots_unnamed()

  .Call(
    pluck_impl,
    x = .x,
    index = list2(...),
    missing = NULL,
    strict = TRUE,
    error_call = current_env()
  )
}

#' Create an attribute getter function
#'
#' `attr_getter()` generates an attribute accessor function; i.e., it
#' generates a function for extracting an attribute with a given
#' name. Unlike the base R `attr()` function with default options, it
#' doesn't use partial matching.
#'
#' @param attr An attribute name as string.
#'
#' @seealso [pluck()]
#' @examples
#' # attr_getter() takes an attribute name and returns a function to
#' # access the attribute:
#' get_rownames <- attr_getter("row.names")
#' get_rownames(mtcars)
#'
#' # These getter functions are handy in conjunction with pluck() for
#' # extracting deeply into a data structure. Here we'll first
#' # extract by position, then by attribute:
#' obj1 <- structure("obj", obj_attr = "foo")
#' obj2 <- structure("obj", obj_attr = "bar")
#' x <- list(obj1, obj2)
#'
#' pluck(x, 1, attr_getter("obj_attr"))  # From first object
#' pluck(x, 2, attr_getter("obj_attr"))  # From second object
#' @export
attr_getter <- function(attr) {
  force(attr)
  function(x) attr(x, attr, exact = TRUE)
}


#' Modify a pluck location
#'
#' @description
#'
#' * `assign_in()` takes a data structure and a [pluck] location,
#'   assigns a value there, and returns the modified data structure.
#'
#' * `modify_in()` applies a function to a pluck location, assigns the
#'   result back to that location with [assign_in()], and returns the
#'   modified data structure.
#'
#' @inheritParams pluck
#' @param .f A function to apply at the pluck location given by `.where`.
#' @param ... Arguments passed to `.f`.
#' @param .where,where A pluck location, as a numeric vector of
#'   positions, a character vector of names, or a list combining both.
#'   The location must exist in the data structure.
#' @seealso [pluck()]
#' @export
#' @examples
#' # Recall that pluck() returns a component of a data structure that
#' # might be arbitrarily deep
#' x <- list(list(bar = 1, foo = 2))
#' pluck(x, 1, "foo")
#'
#' # Use assign_in() to modify the pluck location:
#' str(assign_in(x, list(1, "foo"), 100))
#' # Or zap to remove it
#' str(assign_in(x, list(1, "foo"), zap()))
#'
#' # Like pluck(), this works even when the element (or its parents) don't exist
#' pluck(x, 1, "baz")
#' str(assign_in(x, list(2, "baz"), 100))
#'
#' # modify_in() applies a function to that location and update the
#' # element in place:
#' modify_in(x, list(1, "foo"), ~ .x * 200)
#'
#' # Additional arguments are passed to the function in the ordinary way:
#' modify_in(x, list(1, "foo"), `+`, 100)
modify_in <- function(.x, .where, .f, ...) {
  .where <- as.list(.where)
  .f <- rlang::as_function(.f)

  value <- .f(pluck(.x, !!!.where), ...)
  assign_in(.x, .where, value)
}
#' @rdname modify_in
#' @param value A value to replace in `.x` at the pluck location.
#'   Use `zap()` to instead remove the element.
#' @export
assign_in <- function(x, where, value) {
  n <- length(where)
  if (n == 0) {
    cli::cli_abort("{.arg where} must contain at least one element")
  } else if (n > 1) {
    old <- pluck(x, where[[1]], .default = list())
    if (!is_zap(value) || !identical(old, list())) {
      value <- assign_in(old, where[-1], value)
    }
  }

  if (is_zap(value)) {
    x[[where[[1]]]] <- NULL
  } else {
    list_slice2(x, where[[1]]) <- value
  }

  x
}
