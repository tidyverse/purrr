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
  if (!is_integerish(.depth, n = 1, finite = TRUE)) {
    abort("`.depth` must be a single number")
  }
  if (.depth < 0) {
    .depth <- pluck_depth(.x) + .depth
  }

  .f <- as_mapper(.f, ...)
  map_depth_rec(.x, .depth, .f, ..., .ragged = .ragged, .atomic = FALSE)
}

map_depth_rec <- function(.x,
                          .depth,
                          .f,
                          ...,
                          .ragged,
                          .atomic) {
  if (.depth < 0) {
    abort("Invalid depth")
  } else if (.depth == 0) {
    .f(.x, ...)
  } else if (.depth == 1) {
    map(.x, .f, ...)
  } else {
    if (vec_is_list(.x)) {
      map(.x, map_depth_rec, .depth - 1, .f, ..., .ragged = .ragged)
    } else {
      if (.ragged) {
        map(.x, .f, ...)
      } else {
        abort("List not deep enough")
      }
    }
  }
}


#' @rdname map_depth
#' @export
modify_depth <- function(.x, .depth, .f, ..., .ragged = .depth < 0) {
  if (!is_integerish(.depth, n = 1, finite = TRUE)) {
    abort("`.depth` must be a single number")
  }
  if (.depth < 0) {
    .depth <- pluck_depth(.x) + .depth
  }

  .f <- as_mapper(.f, ...)
  modify_depth_rec(.x, .depth, .f, ..., .ragged = .ragged, .atomic = FALSE)
}

modify_depth_rec <- function(.x, .depth, .f,
                             ...,
                             .ragged = FALSE,
                             .atomic = FALSE) {
  if (.depth < 0) {
    abort("Invalid depth")
  }

  if (.atomic) {
    if (!.ragged) {
      abort("List not deep enough")
    }
    return(modify(.x, .f, ...))
  }

  if (.depth == 0) {
    # TODO vctrs: Use `vec_cast()` on result?
    .x[] <- .f(.x, ...)
    return(.x)
  }

  if (.depth == 1) {
    return(modify(.x, .f, ...))
  }

  # Should this be replaced with a generic way of figuring out atomic
  # types?
  .atomic <- is_atomic(.x)

  modify(.x, function(x) {
    modify_depth_rec(x, .depth - 1, .f, ..., .ragged = .ragged, .atomic = .atomic)
  })
}
