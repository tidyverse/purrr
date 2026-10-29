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
#' @param .p A predicate function specified in one of the following ways:
#'
#'   * A named function, e.g. `is.character`.
#'   * An anonymous function, e.g. `\(x) all(x < 0)` or `function(x) all(x < 0)`.
#'
#'   * A logical vector of the same length as `.x`.
#'   * A string, if the elements of `.x` are themselves lists of objects,
#'     giving the name of a logical element in the inner lists.
#'
#'   Only those elements where `.p` evaluates to `TRUE` will be modified.
#'
#'   Wrap a function with [in_parallel()] to declare that it should be performed
#'   in parallel. See [in_parallel()] for more details.
#'   Use of `...` is not permitted in this context.
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
#' @export
map_at <- function(.x, .at, .f, ..., .progress = FALSE) {
  where <- where_at(.x, .at)

  out <- vector("list", length(.x))
  out[where] <- map(.x[where], .f, ..., .progress = .progress)
  out[!where] <- .x[!where]

  set_names(out, names(.x))
}
