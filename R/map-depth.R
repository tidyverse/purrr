#' Map/modify elements at given depth
#'
#' `map_depth()` calls `map(.y, .f)` on all `.y` at the specified `.depth` in
#' `.x`. `modify_depth()` calls `modify(.y, .f)` on `.y` at the specified
#' `.depth` in `.x`.
#'
#' @inheritParams map
#' @param .depth Level of `.x` to map on. Use a negative value to
#'   count up from the lowest level of the list.
#'
#'   * `map_depth(x, 0, fun)` is equivalent to `fun(x)`.
#'   * `map_depth(x, 1, fun)` is equivalent to `x <- map(x, fun)`
#'   * `map_depth(x, 2, fun)` is equivalent to `x <- map(x, \(y) map(y, fun))`
#' @param .ragged If `TRUE`, will apply to leaves, even if they're not
#'   at depth `.depth`. If `FALSE`, will throw an error if there are
#'   no elements at depth `.depth`.
#' @inheritParams modify_tree
#' @seealso [modify_tree()] for a recursive version of `modify_depth()` that
#'   allows you to apply a function to every leaf or every node.
#' @family map variants
#' @family modify variants
#' @export
#' @examples
#' # map_depth() -------------------------------------------------
#' # Use `map_depth()` to recursively traverse nested vectors and map
#' # a function at a certain depth:
#' x <- list(a = list(foo = 1:2, bar = 3:4), b = list(baz = 5:6))
#' x |> str()
#' x |> map_depth(2, \(y) paste(y, collapse = "/")) |> str()
#'
#' # Equivalent to:
#' x |> map(\(y) map(y, \(z) paste(z, collapse = "/"))) |> str()
#'
#' # When ragged is TRUE, `.f()` will also be passed leaves at depth < `.depth`
#' x <- list(1, list(1, list(1, list(1, 1))))
#' x |> str()
#' x |> map_depth(4, \(x) length(unlist(x)), .ragged = TRUE) |> str()
#' x |> map_depth(3, \(x) length(unlist(x)), .ragged = TRUE) |> str()
#' x |> map_depth(2, \(x) length(unlist(x)), .ragged = TRUE) |> str()
#' x |> map_depth(1, \(x) length(unlist(x)), .ragged = TRUE) |> str()
#' x |> map_depth(0, \(x) length(unlist(x)), .ragged = TRUE) |> str()
#'
#' # modify_depth() -------------------------------------------------
#' l1 <- list(
#'   obj1 = list(
#'     prop1 = list(param1 = 1:2, param2 = 3:4),
#'     prop2 = list(param1 = 5:6, param2 = 7:8)
#'   ),
#'   obj2 = list(
#'     prop1 = list(param1 = 9:10, param2 = 11:12),
#'     prop2 = list(param1 = 12:14, param2 = 15:17)
#'   )
#' )
#'
#' # In the above list, "obj" is level 1, "prop" is level 2 and "param"
#' # is level 3. To apply sum() on all params, we map it at depth 3:
#' l1 |> modify_depth(3, sum) |> str()
#'
#' # modify() lets us pluck the elements prop1/param2 in obj1 and obj2:
#' l1 |> modify(c("prop1", "param2")) |> str()
#'
#' # But what if we want to pluck all param2 elements? Then we need to
#' # act at a lower level:
#' l1 |> modify_depth(2, "param2") |> str()
#'
#' # modify_depth() can be with other purrr functions to make them operate at
#' # a lower level. Here we ask pmap() to map paste() simultaneously over all
#' # elements of the objects at the second level. paste() is effectively
#' # mapped at level 3.
#' l1 |> modify_depth(2, \(x) pmap(x, paste, sep = " / ")) |> str()
map_depth <- function(
  .x,
  .depth,
  .f,
  ...,
  .ragged = .depth < 0,
  .is_node = NULL
) {
  force(.ragged)
  .depth <- check_depth(.depth, pluck_depth(.x, .is_node))
  .f <- as_mapper(.f, ...)
  .is_node <- as_is_node(.is_node)
  map_depth_rec(
    map,
    .x,
    .depth,
    .f,
    ...,
    .ragged = .ragged,
    .is_node = .is_node
  )
}

#' @rdname map_depth
#' @export
modify_depth <- function(
  .x,
  .depth,
  .f,
  ...,
  .ragged = .depth < 0,
  .is_node = NULL
) {
  force(.ragged)
  .depth <- check_depth(.depth, pluck_depth(.x, .is_node))
  .f <- as_mapper(.f, ...)
  .is_node <- as_is_node(.is_node)
  map_depth_rec(
    modify,
    .x,
    .depth,
    .f,
    ...,
    .ragged = .ragged,
    .is_node = .is_node
  )
}

map_depth_rec <- function(
  .fmap,
  .x,
  .depth,
  .f,
  ...,
  .ragged,
  .is_node,
  .purrr_error_call = caller_env()
) {
  if (.depth == 0) {
    if (identical(.fmap, map)) {
      return(.f(.x, ...))
    } else {
      .x[] <- .f(.x, ...)
      return(.x)
    }
  }

  if (!.is_node(.x)) {
    if (.ragged) {
      return(.fmap(.x, .f, ...))
    } else {
      cli::cli_abort("List not deep enough", call = .purrr_error_call)
    }
  }

  if (.depth == 1) {
    .fmap(.x, .f, ...)
  } else {
    .fmap(.x, function(x) {
      map_depth_rec(
        .fmap = .fmap,
        .x = x,
        .depth = .depth - 1,
        .f = .f,
        ...,
        .ragged = .ragged,
        .is_node = .is_node,
        .purrr_error_call = .purrr_error_call
      )
    })
  }
}

check_depth <- function(depth, max_depth, error_call = caller_env()) {
  check_number_whole(depth, call = error_call)

  if (depth < 0) {
    if (-depth > max_depth) {
      cli::cli_abort(
        "Negative {.arg .depth} ({depth}) must be greater than -{max_depth}.",
        arg = ".depth",
        call = error_call
      )
    }
    depth <- max_depth + depth
  }
  depth
}
