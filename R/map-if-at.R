#' Apply a function to each element of a vector conditionally
#'
#' @description
#'
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

  out <- list_along(.x)
  out[sel]  <- map(.x[sel], .f, ...)

  if (is_null(.else)) {
    out[!sel] <- .x[!sel]
  } else {
    out[!sel]  <- map(.x[!sel], .else, ...)
  }

  set_names(out, names(.x))
}
#' @rdname map_if
#' @param .at A character vector of names, positive numeric vector of
#'   positions to include, or a negative numeric vector of positions to
#'   exlude. Only those elements corresponding to `.at` will be modified.
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
map_at <- function(.x, .at, .f, ...) {

  where <- at_selection(names(.x), .at)
  sel <- inv_which(.x, where)

  out <- list_along(.x)
  out[sel]  <- map(.x[sel], .f, ...)
  out[!sel] <- .x[!sel]

  set_names(out, names(.x))
}


#' @rdname map_if
#' @description * `map_depth()` allows to apply `.f` to a specific
#'   depth level of a nested vector.
#' @param .depth Level of `.x` to map on. Use a negative value to
#'   count up from the lowest level of the list.
#'
#'   * `map_depth(x, 0, fun)` is equivalent to `fun(x)`.
#'   * `map_depth(x, 1, fun)` is equivalent to `x <- map(x, fun)`
#'   * `map_depth(x, 2, fun)` is equivalent to `x <- map(x, ~ map(., fun))`
#' @param .ragged If `TRUE`, will apply to leaves, even if they're not
#'   at depth `.depth`. If `FALSE`, will throw an error if there are
#'   no elements at depth `.depth`.
#' @examples
#'
#' # Use `map_depth()` to recursively traverse nested vectors and map
#' # a function at a certain depth:
#' x <- list(a = list(foo = 1:2, bar = 3:4), b = list(baz = 5:6))
#' str(x)
#' map_depth(x, 2, paste, collapse = "/")
#'
#' # Equivalent to:
#' map(x, map, paste, collapse = "/")
#' @export
map_depth <- function(.x, .depth, .f, ..., .ragged = FALSE) {
  if (!is_integerish(.depth, n = 1, finite = TRUE)) {
    depth <- .depth
    cli::cli_abort("{.arg .depth} must be a single number, not {.obj_type_friendly {depth}}.")
  }
  if (.depth < 0) {
    .depth <- pluck_depth(.x) + .depth
    if (.depth < 0) {
      cli::cli_abort("Negative {.arg .depth} must be smaller than {.code pluck_depth(.x)}.")
    }
  }

  .f <- as_mapper(.f, ...)
  map_depth_rec(.x, .depth, .f, ..., .ragged = .ragged, .atomic = FALSE)
}

map_depth_rec <- function(.x,
                          .depth,
                          .f,
                          ...,
                          .ragged,
                          .atomic,
                          .error_call = caller_env()) {
  if (.atomic) {
    if (!.ragged) {
      abort("List not deep enough")
    }
    return(map(.x, .f, ...))
  }

  if (.depth == 0) {
    return(.f(.x, ...))
  }

  if (.depth == 1) {
    return(map(.x, .f, ...))
  }

  # Should this be replaced with a generic way of figuring out atomic
  # types?
  .atomic <- is_atomic(.x)

  map(.x, function(x) {
    map_depth_rec(x, .depth - 1, .f, ..., .ragged = .ragged, .atomic = .atomic)
  })
}
