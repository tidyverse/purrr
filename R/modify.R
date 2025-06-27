#' Modify elements selectively
#'
#' @description
#'
#' Unlike [map()] and its variants which always return a fixed object
#' type (list for `map()`, integer vector for `map_int()`, etc), the
#' `modify()` family always returns the same type as the input object.
#'
#' * `modify()` is a shortcut for `x[[i]] <- f(x[[i]]); return(x)`.
#'
#' * `modify_if()` only modifies the elements of `x` that satisfy a
#'   predicate and leaves the others unchanged. `modify_at()` only
#'   modifies elements given by names or positions.
#'
#' * `modify2()` modifies the elements of `.x` but also passes the
#'   elements of `.y` to `.f`, just like [map2()]. `imodify()` passes
#'   the names or the indices to `.f` like [imap()] does.
#'
#' * [modify_in()] modifies a single element in a [pluck()] location.
#'
#' @param .x A vector.
#' @param .y A vector, usually the same length as `.x`.
#' @inheritParams map2
#' @inheritParams map
#' @param .f A function specified in the same way as the corresponding map
#'   function.
#' @return An object the same class as `.x`
#'
#' @details
#'
#' Since the transformation can alter the structure of the input; it's
#' your responsibility to ensure that the transformation produces a
#' valid output. For example, if you're modifying a data frame, `.f`
#' must preserve the length of the input.
#'
#' @section Genericity:
#'
#' `modify()` and variants are generic over classes that implement
#' `length()`, `[[` and `[[<-` methods. If the default implementation
#' is not compatible for your class, you can override them with your
#' own methods.
#'
#' If you implement your own `modify()` method, make sure it satisfies
#' the following invariants:
#'
#' ```
#' modify(x, identity) === x
#' modify(x, compose(f, g)) === modify(x, g) |> modify(f)
#' ```
#'
#' These invariants are known as the [functor
#' laws](https://wiki.haskell.org/Functor#Functor_Laws) in computer
#' science.
#'
#'
#' @family map variants
#' @family modify variants
#' @examples
#' # Convert factors to characters
#' iris |>
#'   modify_if(is.factor, as.character) |>
#'   str()
#'
#' # Specify which columns to map with a numeric vector of positions:
#' mtcars |> modify_at(c(1, 4, 5), as.character) |> str()
#'
#' # Or with a vector of names:
#' mtcars |> modify_at(c("cyl", "am"), as.character) |> str()
#'
#' list(x = sample(c(TRUE, FALSE), 100, replace = TRUE), y = 1:100) |>
#'   list_transpose(simplify = FALSE) |>
#'   modify_if("x", \(l) list(x = l$x, y = l$y * 100)) |>
#'   list_transpose()
#'
#' # Use modify2() to map over two vectors and preserve the type of
#' # the first one:
#' x <- c(foo = 1L, bar = 2L)
#' y <- c(TRUE, FALSE)
#' modify2(x, y, \(x, cond) if (cond) x else 0L)
#'
#' # Use a predicate function to decide whether to map a function:
#' modify_if(iris, is.factor, as.character)
#'
#' # Specify an alternative with the `.else` argument:
#' modify_if(iris, is.factor, as.character, .else = as.integer)
#' @export
modify <- function(.x, .f, ...) {
  .f <- as_mapper(.f, ...)

  if (obj_is_list(.x)) {
    out <- map(vec_proxy(.x), .f, ...)
    vec_restore(out, .x)
  } else if (is.data.frame(.x)) {
    size <- vec_size(.x)
    out <- unclass(vec_proxy(.x))
    out <- map(out, .f, ...)
    out <- vec_recycle_common(!!!out, .size = size, .arg = "out")
    out <- new_data_frame(out, n = size)
    vec_restore(out, .x)
  } else if (vec_is(.x)) {
    map_vec(.x, .f, ..., .ptype = .x)
  } else if (is.list(.x) || is.null(.x)) {
    .x[] <- map(.x, .f, ...)
    .x
  } else {
    cli::cli_abort(
      "{.arg .x} must be a vector, list, or data frame, not {.obj_type_friendly {.x}}."
    )
  }
}

#' @rdname modify
#' @inheritParams map_if
#' @export
modify_if <- function(.x, .p, .f, ..., .else = NULL) {
  where <- where_if(.x, .p)
  .x <- modify_where(.x, where, .f, ...)

  if (!is.null(.else)) {
    .else <- as_mapper(.else, ...)
    .x <- modify_where(.x, !where, .else, ...)
  }

  .x
}

#' @rdname modify
#' @inheritParams map_at
#' @export
modify_at <- function(.x, .at, .f, ...) {
  where <- where_at(.x, .at, user_env = caller_env())
  modify_where(.x, where, .f, ...)
}

#' @rdname modify
#' @export
modify2 <- function(.x, .y, .f, ...) {
  .f <- as_mapper(.f, ...)

  if (obj_is_list(.x)) {
    out <- map2(vec_proxy(.x), .y, .f, ...)
    vec_restore(out, .x)
  } else if (is.data.frame(.x)) {
    size <- vec_size(.x)
    out <- unclass(vec_proxy(.x))
    out <- map2(out, .y, .f, ...)
    out <- vec_recycle_common(!!!out, .size = size, .arg = "out")
    out <- new_data_frame(out, n = size)
    vec_restore(out, .x)
  } else if (vec_is(.x)) {
    map2_vec(.x, .y, .f, ..., .ptype = .x)
  } else if (is.null(.x) || is.list(.x)) {
    out <- map2(.x, .y, .f, ...)
    if (length(out) > length(.x)) {
      .x <- .x[rep(1L, length(out))]
    }
    .x[] <- out
    .x
  } else {
    cli::cli_abort(
      "{.arg .x} must be a vector, list, or data frame, not {.obj_type_friendly {.x}}."
    )
  }
}

#' @rdname modify
#' @export
imodify <- function(.x, .f, ...) {
  modify2(.x, vec_index(.x), .f, ...)
}

# helpers -----------------------------------------------------------------

modify_where <- function(
  .x,
  .where,
  .f,
  ...,
  .purrr_error_call = caller_env()
) {
  if (obj_is_list(.x)) {
    out <- vec_proxy(.x)
    out[.where] <- no_zap(map(out[.where], .f, ...), .purrr_error_call)
    vec_restore(out, .x)
  } else if (is.data.frame(.x)) {
    size <- vec_size(.x)
    out <- unclass(vec_proxy(.x))
    new <- no_zap(map(out[.where], .f, ...), .purrr_error_call)
    out[.where] <- vec_recycle_common(!!!new, .size = size, .arg = "out")
    out <- new_data_frame(out, n = size)
    vec_restore(out, .x)
  } else if (vec_is(.x)) {
    .x[.where] <- map_vec(.x[.where], .f, ..., .ptype = .x)
    .x
  } else if (is.null(.x) || is.list(.x)) {
    .x[.where] <- no_zap(map(.x[.where], .f, ...), .purrr_error_call)
    .x
  } else {
    cli::cli_abort(
      "{.arg .x} must be a vector, list, or data frame, not {.obj_type_friendly {.x}}.",
      call = .purrr_error_call
    )
  }
}

no_zap <- function(x, error_call) {
  has_zap <- some(x, is_zap)
  if (!has_zap) {
    x
  } else {
    cli::cli_abort(
      "Can't use {.fn zap} to change the size of the output.",
      call = error_call
    )
  }
}
