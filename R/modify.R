#' Modify elements selectively
#'
#' `modify()` is a short-cut for `x[] <- map(x, .f); return(x)`. `modify_if()`
#' only modifies the elements of `x` that satisfy a predicate and leaves the
#' others unchanged. `modify_at()` only modifies elements given by names or
#' positions. `modify_depth()` only modifies elements at a given level of a
#' nested data structure.
#'
#' These can alter the structure of the input; it's your responsibility to
#' ensure that the transformation produces a valid output. For example, if
#' you're modifying a data frame, `.f` must preserve the length of the input.
#'
#' @inheritParams map
#' @param .p A single predicate function, a formula describing such a
#'   predicate function, or a logical vector of the same length as `.x`.
#'   Alternatively, if the elements of `.x` are themselves lists of
#'   objects, a string indicating the name of a logical element in the
#'   inner lists. Only those elements where `.p` evaluates to
#'   `TRUE` will be modified.
#' @param .at A character vector of names or a numeric vector of
#'   positions. Only those elements corresponding to `.at` will be
#'   modified.
#' @param .depth Level of `.x` to map on. Use a negative value to count up
#'  from the lowest level of the list.
#'
#'  * `modify_depth(x, 0, fun)` is equivalent to `x[] <- fun(x)`
#'  * `modify_depth(x, 1, fun)` is equivalent to `x[] <- map(x, fun)`
#'  * `modify_depth(x, 2, fun)` is equivalent to `x[] <- map(x, ~ map(., fun))`
#' @return An object the same class as `.x`
#' @family map variants
#' @export
#' @examples
#' # Convert factors to characters
#' iris %>%
#'   modify_if(is.factor, as.character) %>%
#'   str()
#'
#' # Specify which columns to map with a numeric vector of positions:
#' mtcars %>% modify_at(c(1, 4, 5), as.character) %>% str()
#'
#' # Or with a vector of names:
#' mtcars %>% modify_at(c("cyl", "am"), as.character) %>% str()
#'
#' list(x = rbernoulli(100), y = 1:100) %>%
#'   transpose() %>%
#'   modify_if("x", ~ update_list(., y = ~ y * 100)) %>%
#'   transpose() %>%
#'   simplify_all()
#'
#' # Modify at specified depth ---------------------------
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
modify <- function(.x, .f, ...) {
  .x[] <- map(.x, .f, ...)
  .x
}

#' @rdname modify
#' @export
modify_if <- function(.x, .p, .f, ...) {
  sel <- probe(.x, .p)
  .x[sel] <- map(.x[sel], .f, ...)
  .x
}

#' @rdname modify
#' @export
modify_at <- function(.x, .at, .f, ...) {
  sel <- inv_which(.x, .at)
  .x[sel] <- map(.x[sel], .f, ...)
  .x
}

#' @export
#' @rdname modify
#' @param .ragged If `TRUE`, will apply to leaves, even if they're not
#'   at depth `.depth`. If `FALSE`, will throw an error if there are
#'   no elements at depth `.depth`.
modify_depth <- function(.x, .depth, .f, ..., .ragged = .depth < 0) {
  stopifnot(is.numeric(.depth), length(.depth) == 1)

  if (.depth < 0) {
    .depth <- depth(.x) + .depth
  }

  .f <- as_mapper(.f, ...)
  modify_depth_rec(.x, .depth, .f, ..., .ragged = .ragged)
}

modify_depth_rec <- function(.x, .depth, .f, ..., .ragged = FALSE) {
  if (.depth == 0) {
    .x[] <- .f(.x, ...)
  } else if (.depth == 1) {
    if (!is.list(.x)) {
      if (.ragged) {
        .x[] <- .f(.x, ...)
      } else {
        stop("List not deep enough", call. = FALSE)
      }
    } else {
      .x[] <- map(.x, .f, ...)
    }
  } else if (.depth > 1) {
    .x[] <- map(.x, function(x) {
      modify_depth_rec(x, .depth - 1, .f, ..., .ragged = .ragged)
    })
  } else {
    stop("Invalid `depth`", call. = FALSE)
  }
  .x
}

#' @export
#' @usage NULL
#' @rdname modify
map_if <- function(.x, .p, .f, ...) {
  warning(
    "map_if() is deprecated, please use `modify_if()` instead",
    call. = FALSE
  )
  modify_if(.x, .p, .f, ...)
}

#' @export
#' @usage NULL
#' @rdname modify
map_at <- function(.x, .at, .f, ...) {
  warning(
    "map_at() is deprecated, please use `modify_at()` instead",
    call. = FALSE
  )
  modify_at(.x, .at, .f, ...)
}


#' @export
#' @usage NULL
#' @rdname modify
at_depth <- function(.x, .depth, .f, ...) {
  warning(
    "at_depth() is deprecated, please use `modify_depth()` instead",
    call. = FALSE
  )
  modify_depth(.x, .depth, .f, ...)
}

# Internal version of map_lgl() that works with logical vectors
probe <- function(.x, .p, ...) {
  if (is_logical(.p)) {
    stopifnot(length(.p) == length(.x))
    .p
  } else {
    map_lgl(.x, .p, ...)
  }
}

inv_which <- function(x, sel) {
  if (is.character(sel)) {
    names <- names(x)
    if (is.null(names)) {
      stop("character indexing requires a named object", call. = FALSE)
    }
    names %in% sel
  } else if (is.numeric(sel)) {
    seq_along(x) %in% sel
  } else {
    stop("unrecognised index type", call. = FALSE)
  }
}
