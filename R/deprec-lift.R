#' Lift the domain of a function
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `lift_xy()` is a composition helper. It helps you compose
#' functions by lifting their domain from a kind of input to another
#' kind. The domain can be changed from and to a list (l), a vector
#' (v) and dots (d). For example, `lift_ld(fun)` transforms a
#' function taking a list to a function taking dots.
#'
#' The most important of those helpers is probably `lift_dl()`
#' because it allows you to transform a regular function to one that
#' takes a list. This is often essential for composition with purrr
#' functional tools. Since this is such a common function,
#' `lift()` is provided as an alias for that operation.
#'
#' These functions were superseded in purrr 1.0.0 because we no longer believe
#' "lifting" to be a mainstream operation, and we are striving to reduce purrr
#' to its most useful core. Superseded functions will not go away, but will only
#' receive critical bug fixes.
#'
#' @inheritParams as_vector
#' @param ..f A function to lift.
#' @param ... Default arguments for `..f`. These will be
#'   evaluated only once, when the lifting factory is called.
#' @return A function.
#' @name lift
#' @seealso [invoke()]
NULL

#' @rdname lift
#' @section from ... to `list(...)` or `c(...)`:
#'   Here dots should be taken here in a figurative way. The lifted
#'   functions does not need to take dots per se. The function is
#'   simply wrapped a function in [do.call()], so instead
#'   of taking multiple arguments, it takes a single named list or
#'   vector which will be interpreted as its arguments.  This is
#'   particularly useful when you want to pass a row of a data frame
#'   or a list to a function and don't want to manually pull it apart
#'   in your function.
#' @param .unnamed If `TRUE`, `ld` or `lv` will not
#'   name the parameters in the lifted function signature. This
#'   prevents matching of arguments by name and match by position
#'   instead.
#' @keywords internal
#' @export
#' @examples
#' ### Lifting from ... to list(...) or c(...)
#'
#' x <- list(x = c(1:100, NA, 1000), na.rm = TRUE, trim = 0.9)
#' lift_dl(mean)(x)
#' # You can also use the lift() alias for this common operation:
#' lift(mean)(x)
#' # now:
#' exec(mean, !!!x)
#'
#' # Default arguments can also be specified directly in lift_dl()
#' list(c(1:100, NA, 1000)) |> lift_dl(mean, na.rm = TRUE)()
#' # now:
#' mean(c(1:100, NA, 1000), na.rm = TRUE)
#'
#' # lift_dl() and lift_ld() are inverse of each other.
#' # Here we transform sum() so that it takes a list
#' fun <- sum |> lift_dl()
#' fun(list(3, NA, 4, na.rm = TRUE))
#' # now:
#' fun <- function(x) exec("sum", !!!x)
#' exec(sum, 3, NA, 4, na.rm = TRUE)
lift <- function(..f, ..., .unnamed = FALSE) {
  lifecycle::deprecate_soft("1.0.0", "lift()")

  force(..f)
  defaults <- list(...)
  function(.x = list(), ...) {
    if (.unnamed) {
      .x <- unname(.x)
    }
    do.call("..f", c(.x, defaults, list(...)))
  }
}

#' @rdname lift
#' @export
lift_dl <- lift

#' @rdname lift
#' @export
lift_dv <- function(..f, ..., .unnamed = FALSE) {
  lifecycle::deprecate_soft("1.0.0", "lift_dv()")

  force(..f)
  defaults <- list(...)

  function(.x, ...) {
    if (.unnamed) {
      .x <- unname(.x)
    }
    .x <- as.list(.x)
    do.call("..f", c(.x, defaults, list(...)))
  }
}

#' @rdname lift
#' @section from `c(...)` to `list(...)` or `...`:
#'   These factories allow a function taking a vector to take a list
#'   or dots instead. The lifted function internally transforms its
#'   inputs back to an atomic vector. purrr does not obey the usual R
#'   casting rules (e.g., `c(1, "2")` produces a character
#'   vector) and will produce an error if the types are not
#'   compatible. Additionally, you can enforce a particular vector
#'   type by supplying `.type`.
#' @export
#' @examples
#' ### Lifting from c(...) to list(...) or ...
#'
#' # In other situations we need the vector-valued function to take a
#' # variable number of arguments as with pmap(). This is a job for
#' # lift_vd():
#' pmap_dbl(mtcars, lift_vd(mean))
#' # now
#' pmap_dbl(mtcars, \(...) mean(c(...)))
lift_vl <- function(..f, ..., .type) {
  lifecycle::deprecate_soft("1.0.0", "lift_vl()")

  force(..f)
  defaults <- list(...)
  if (missing(.type)) {
    .type <- NULL
  }

  function(.x = list(), ...) {
    x <- as_vector_(.x, .type)
    do.call("..f", c(list(x), defaults, list(...)))
  }
}

#' @rdname lift
#' @export
lift_vd <- function(..f, ..., .type) {
  lifecycle::deprecate_soft("1.0.0", "lift_vd()")

  force(..f)
  defaults <- list(...)
  if (missing(.type)) {
    .type <- NULL
  }

  function(...) {
    x <- as_vector_(list(...), .type)
    do.call("..f", c(list(x), defaults))
  }
}

#' @rdname lift
#' @section from list(...) to c(...) or ...:
#' `lift_ld()` turns a function that takes a list into a
#' function that takes dots. `lift_vd()` does the same with a
#' function that takes an atomic vector. These factory functions are
#' the inverse operations of `lift_dl()` and `lift_dv()`.
#'
#' `lift_vd()` internally coerces the inputs of `..f` to
#' an atomic vector. The details of this coercion can be controlled
#' with `.type`.
#'
#' @export
#' @examples
#' ### Lifting from list(...) to c(...) or ...
#'
#' # This kind of lifting is sometimes needed for function
#' # composition. An example would be to use pmap() with a function
#' # that takes a list. In the following, we use some() on each row of
#' # a data frame to check they each contain at least one element
#' # satisfying a condition:
#' mtcars |> pmap_lgl(lift_ld(some, partial(`<`, 200)))
#' # now
#' mtcars |> pmap_lgl(\(...) any(c(...) > 200))
#'
lift_ld <- function(..f, ...) {
  lifecycle::deprecate_soft("1.0.0", "lift_ld()")

  force(..f)
  defaults <- list(...)
  function(...) {
    do.call("..f", c(list(list(...)), defaults))
  }
}

#' @rdname lift
#' @export
lift_lv <- function(..f, ...) {
  lifecycle::deprecate_soft("1.0.0", "lift_lv()")

  force(..f)
  defaults <- list(...)
  function(.x, ...) {
    do.call("..f", c(list(as.list(.x)), defaults, list(...)))
  }
}
