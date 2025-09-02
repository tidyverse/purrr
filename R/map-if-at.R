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
#' @family map variants
#' @export
#' @examples
#' # Use a predicate function to decide whether to map a function:
#' iris |> map_if(is.factor, as.character) |> str()
#'
#' # Specify an alternative with the `.else` argument:
#' iris |> map_if(is.factor, as.character, .else = as.integer) |> str()
#'
#' # Use numeric vector of positions select elements to change:
#' iris |> map_at(c(4, 5), is.numeric) |> str()
#'
#' # Use vector of names to specify which elements to change:
#' iris |> map_at("Species", toupper) |> str()
map_if <- function(.x, .p, .f, ..., .else = NULL) {
  where <- where_if(.x, .p)

  out <- vector("list", length(.x))
  out[where] <- map(.x[where], .f, ...)

  if (is_null(.else)) {
    out[!where] <- .x[!where]
  } else {
    out[!where] <- map(.x[!where], .else, ...)
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
#' @export
map_at <- function(.x, .at, .f, ..., .progress = FALSE) {
  where <- where_at(.x, .at, user_env = caller_env())

  out <- vector("list", length(.x))
  out[where] <- map(.x[where], .f, ..., .progress = .progress)
  out[!where] <- .x[!where]

  set_names(out, names(.x))
}
