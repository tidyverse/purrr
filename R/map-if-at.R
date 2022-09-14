#' Apply a function to each element of a vector conditionally
#'
#' @description
#' The functions `map_if()` and `map_at()` take `.x` as input, apply
#' the function `.f` to some of the elements of `.x`, and return a
#' list of the same length as the input.
#'
#' * `map_if()` takes a predicate function `.p` as input to determine
#'   which elements of `.x` are transformed with `.f`.
#'
#' * `map_at()` takes a vector of names or positions `.at` to specify
#'   which elements of `.x` are transformed with `.f`.
#'
#' @inheritParams map
#' @param .p A single predicate function, a formula describing such a
#'   predicate function, or a logical vector of the same length as `.x`.
#'   Alternatively, if the elements of `.x` are themselves lists of
#'   objects, a string indicating the name of a logical element in the
#'   inner lists. Only those elements where `.p` evaluates to
#'   `TRUE` will be modified.
#' @param .else A function applied to elements of `.x` for which `.p`
#' returns `FALSE`.
#' @export
#' @family map variants
#' @examples
#' # Use a predicate function to decide whether to map a function:
#' map_if(iris, is.factor, as.character)
#'
#' # Specify an alternative with the `.else` argument:
#' map_if(iris, is.factor, as.character, .else = as.integer)
#'
map_if <- function(.x, .p, .f, ..., .else = NULL) {
  sel <- probe(.x, .p)

  out <- vector("list", length(.x))
  out[sel]  <- map(.x[sel], .f, ...)

  if (is_null(.else)) {
    out[!sel] <- .x[!sel]
  } else {
    out[!sel]  <- map(.x[!sel], .else, ...)
  }

  set_names(out, names(.x))
}
#' @rdname map_if
#' @param .at A logical, integer, or character vector giving the elements
#'   to select. Alternatively, a function that takes a vector of names,
#'   and returns a logical, integer, or character vector of elements to select.
#'
#'   `r lifecycle::badge("deprecated")`: if the tidyselect package is
#'   installed, you can use `vars()` and tidyselect helpers to select
#'   elements.
#' @examples
#' # Use numeric vector of positions select elements to change:
#' iris %>% map_at(c(4, 5), is.numeric)
#'
#' # Use vector of names to specify which elements to change:
#' iris %>% map_at("Species", toupper)
#
#' @export
map_at <- function(.x, .at, .f, ..., .progress = NULL) {
  where <- at_selection(.x, .at)
  sel <- inv_which(.x, where)

  out <- vector("list", length(.x))
  out[sel]  <- map(.x[sel], .f, ..., .progress = .progress)
  out[!sel] <- .x[!sel]

  set_names(out, names(.x))
}
