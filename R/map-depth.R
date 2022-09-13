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
#'   * `map_depth(x, 2, fun)` is equivalent to `x <- map(x, ~ map(., fun))`
#' @param .ragged If `TRUE`, will apply to leaves, even if they're not
#'   at depth `.depth`. If `FALSE`, will throw an error if there are
#'   no elements at depth `.depth`.
#' @export
#' @examples
#' # map_depth() -------------------------------------------------
#' # Use `map_depth()` to recursively traverse nested vectors and map
#' # a function at a certain depth:
#' x <- list(a = list(foo = 1:2, bar = 3:4), b = list(baz = 5:6))
#' str(x)
#' map_depth(x, 2, paste, collapse = "/")
#'
#' # Equivalent to:
#' map(x, map, paste, collapse = "/")
#'
#' # When ragged is TRUE, `.f()` will also be passed leaves at depth < `.depth`
#' x <- list(1, list(1, list(1, list(1, 1))))
#' str(x)
#' str(map_depth(x, 4, ~ length(unlist(.x)), .ragged = TRUE))
#' str(map_depth(x, 3, ~ length(unlist(.x)), .ragged = TRUE))
#' str(map_depth(x, 2, ~ length(unlist(.x)), .ragged = TRUE))
#' str(map_depth(x, 1, ~ length(unlist(.x)), .ragged = TRUE))
#' str(map_depth(x, 0, ~ length(unlist(.x)), .ragged = TRUE))
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
#' l1 %>% modify_depth(3, sum) %>% str()
#'
#' # Note that vectorised operations will yield the same result when
#' # applied at the list level as when applied at the atomic result.
#' # The former is more efficient because it takes advantage of
#' # vectorisation.
#' l1 %>% modify_depth(3, `+`, 100L)
#' l1 %>% modify_depth(4, `+`, 100L)
#'
#' # modify() lets us pluck the elements prop1/param2 in obj1 and obj2:
#' l1 %>% modify(c("prop1", "param2")) %>% str()
#'
#' # But what if we want to pluck all param2 elements? Then we need to
#' # act at a lower level:
#' l1 %>% modify_depth(2, "param2") %>% str()
#'
#' # modify_depth() can be with other purrr functions to make them operate at
#' # a lower level. Here we ask pmap() to map paste() simultaneously over all
#' # elements of the objects at the second level. paste() is effectively
#' # mapped at level 3.
#' l1 %>% modify_depth(2, ~ pmap(., paste, sep = " / ")) %>% str()
map_depth <- function(.x, .depth, .f, ..., .ragged = FALSE) {
  .depth <- check_depth(.depth, pluck_depth(.x))
  .f <- as_mapper(.f, ...)
  map_depth_rec(map, .x, .depth, .f, ..., .ragged = .ragged)
}

#' @rdname map_depth
#' @export
modify_depth <- function(.x, .depth, .f, ..., .ragged = .depth < 0) {
  .depth <- check_depth(.depth, pluck_depth(.x))
  .f <- as_mapper(.f, ...)
  map_depth_rec(modify, .x, .depth, .f, ..., .ragged = .ragged)
}

map_depth_rec <- function(.fmap,
                          .x,
                          .depth,
                          .f,
                          ...,
                          .ragged,
                          .error_call = caller_env()) {
  if (.depth == 0) {
    if (identical(.fmap, map)) {
      .f(.x, ...)
    } else {
      .x[] <- .f(.x, ...)
      .x
    }
  } else if (.depth == 1) {
    .fmap(.x, .f, ...)
  } else {
    if (is.list(.x)) {
      .fmap(.x, function(x) {
        map_depth_rec(
          .fmap = .fmap,
          .x = x,
          .depth = .depth - 1,
          .f = .f,
          ...,
          .ragged = .ragged,
          .error_call = .error_call
        )
      })
    } else {
      if (.ragged) {
        .fmap(.x, .f, ...)
      } else {
        cli::cli_abort("List not deep enough", call = .error_call)
      }
    }
  }
}

check_depth <- function(depth, max_depth, error_call = caller_env()) {
  if (!is_integerish(depth, n = 1, finite = TRUE)) {
    cli::cli_abort(
      "{.arg .depth} must be a single number, not {.obj_type_friendly {depth}}.",
      arg = ".depth",
      call = error_call
    )
  }
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

