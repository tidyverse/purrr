#' Modify elements "in-place"
#'
#' `modify()` is a short-cut for `x[] <- map(x, .f)`. `modify_if()` only modifies
#' the elements of `.x` that satisfy a predicate. `map_at()` is similar but
#' will modify the elements corresponding to a character vector of names or a
#' numeric vector of positions.
#'
#' These modify the input data structure; it's your responsibility to ensure
#' that the transformation produces a valid output. For example, if you're
#' modifying a data frame, `.f` must preserve the length of the input.
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
#' @return An object the same class as `.x`
#' @family map variants
#' @examples
#' # Convert factors to characters
#' iris %>%
#'   map_if(is.factor, as.character) %>%
#'   str()
#'
#' # Specify which columns to map with a numeric vector of positions:
#' mtcars %>% map_at(c(1, 4, 5), as.character) %>% str()
#'
#' # Or with a vector of names:
#' mtcars %>% map_at(c("cyl", "am"), as.character) %>% str()
#'
#' list(x = rbernoulli(100), y = 1:100) %>%
#'   transpose() %>%
#'   map_if("x", ~ update_list(., y = ~ y * 100)) %>%
#'   transpose() %>%
#'   simplify_all()
modify <- function(.x, .f, ...) {
  x[] <- map(.x, .f, ...)
  x
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

