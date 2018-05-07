#' Pluck out a single element from a vector or environment
#'
#' @description
#'
#' This is a generalised form of `[[` which allows you to index deeply
#' and flexibly into data structures. It supports R standard accessors
#' like integer positions and string names, and also accepts arbitrary
#' accessor functions, i.e. functions that take an object and return
#' some internal piece.
#'
#' `pluck()` is often more readable than a mix of operators and
#' accessors because it reads linearly and is free of syntactic
#' cruft. Compare: \code{accessor(x[[1]])$foo} to `pluck(x, 1,
#' accessor, "foo")`.
#'
#' Furthermore, `pluck()` never partial-matches unlike `$` which will
#' select the `disp` object if you write `mtcars$di`.
#'
#' `attr_getter()` generates an attribute accessor function;
#' i.e., it generates a function for extracting an attribute with
#' a given name. Unlike the base R `attr()` function with default
#' options, it doesn't use partial matching.
#'
#' @details
#'
#' Since it handles arbitrary accessor functions, `pluck()` is a type
#' of composition operator. However, it is indexing-oriented thanks to
#' its handling of strings and integers. By the same token is also
#' explicit regarding the intent of the composition (e.g. extraction).
#'
#' @param .x A vector or environment
#' @param ... A list of accessors for indexing into the object. Can be
#'   an integer position, a string name, or an accessor function. If
#'   the object being indexed is an S4 object, accessing it by name
#'   will return the corresponding slot.
#'
#'   These dots support [tidy dots][rlang::list2] features. In
#'   particular, if your accessors are stored in a list, you can
#'   splice that in with `!!!`.
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
#' # the alternative form because it requires you to read both from
#' # right-to-left and from left-to-right in different parts of the
#' # expression:
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
#' # If you have a list of accessors, you can splice those in with `!!!`:
#' idx <- list(1, attr_getter("obj_attr"))
#' pluck(x, !!!idx)
pluck <- function(.x, ..., .default = NULL) {
  .Call(extract_impl, .x, list2(...), .default, FALSE)
}

#' @export
chuck <- function(.x, ...) {
  .Call(extract_impl, .x, list2(...), NULL, TRUE)
}

#' @export
#' @rdname pluck
#' @param attr An attribute name as string.
attr_getter <- function(attr) {
  force(attr)
  function(x) attr(x, attr, exact = TRUE)
}
