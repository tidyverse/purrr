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
#' * `modify_depth()` only modifies elements at a given level of a
#'   nested data structure.
#'
#' * [modify_in()] modifies a single element in a [pluck()] location.
#'
#' @param .x A vector.
#' @param .y A vector, usually the same length as `.x`.
#' @inheritParams map2
#' @inheritParams map
#' @param .f A function specified in the same way as the corresponding map
#'   function.
#' @param .depth Level of `.x` to map on. Use a negative value to count up
#'   from the lowest level of the list.
#'
#'   * `modify_depth(x, 0, fun)` is equivalent to `x[] <- fun(x)`.
#'   * `modify_depth(x, 1, fun)` is equivalent to `x <- modify(x, fun)`
#'   * `modify_depth(x, 2, fun)` is equivalent to `x <- modify(x, ~ modify(., fun))`
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
#' modify(x, compose(f, g)) === modify(x, g) %>% modify(f)
#' ```
#'
#' These invariants are known as the [functor
#' laws](https://wiki.haskell.org/Functor#Functor_Laws) in computer
#' science.
#'
#'
#' @family map variants
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
#' # Use modify2() to map over two vectors and preserve the type of
#' # the first one:
#' x <- c(foo = 1L, bar = 2L)
#' y <- c(TRUE, FALSE)
#' modify2(x, y, ~ if (.y) .x else 0L)
#'
#' # Use a predicate function to decide whether to map a function:
#' modify_if(iris, is.factor, as.character)
#'
#' # Specify an alternative with the `.else` argument:
#' modify_if(iris, is.factor, as.character, .else = as.integer)
#'
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
#' @export
modify <- function(.x, .f, ...) {
  UseMethod("modify")
}
#' @rdname modify
#' @export
modify.default <- function(.x, .f, ...) {
  .f <- as_mapper(.f, ...)

  for (i in seq_along(.x)) {
    list_slice2(.x, i) <- .f(.x[[i]], ...)
  }

  .x
}

#' @rdname modify
#' @inheritParams map_if
#' @export
modify_if <- function(.x, .p, .f, ..., .else = NULL) {
  UseMethod("modify_if")
}
#' @rdname modify
#' @export
modify_if.default <- function(.x, .p, .f, ..., .else = NULL) {
  sel <- probe(.x, .p)
  index <- seq_along(.x)

  .f <- as_mapper(.f, ...)
  for (i in index[sel]) {
    list_slice2(.x, i) <- .f(.x[[i]], ...)
  }

  if (!is_null(.else)) {
    .else <- as_mapper(.else, ...)
    for (i in index[!sel]) {
      list_slice2(.x, i) <- .else(.x[[i]], ...)
    }
  }

  .x
}

#' @rdname modify
#' @inheritParams map_at
#' @export
modify_at <- function(.x, .at, .f, ...) {
  UseMethod("modify_at")
}
#' @rdname modify
#' @export
modify_at.default <- function(.x, .at, .f, ...) {
  where <- at_selection(names(.x), .at)
  sel <- inv_which(.x, where)
  modify_if(.x, sel, .f, ...)
}

# TODO: Replace all the following methods with a generic strategy that
# implements sane coercion rules for base vectors

#' @export
modify.integer  <- function (.x, .f, ...) {
  .x[] <- map_int(.x, .f, ...)
  .x
}
#' @export
modify.double  <- function (.x, .f, ...) {
  .x[] <- map_dbl(.x, .f, ...)
  .x
}
#' @export
modify.character  <- function (.x, .f, ...) {
  .x[] <- map_chr(.x, .f, ...)
  .x
}
#' @export
modify.logical  <- function (.x, .f, ...) {
  .x[] <- map_lgl(.x, .f, ...)
  .x
}
#' @export
modify.pairlist <- function(.x, .f, ...) {
  as.pairlist(map(.x, .f, ...))
}

#' @export
modify_if.integer <- function(.x, .p, .f, ..., .else = NULL) {
  modify_if_atomic(map_int, .x, .p, .true = .f, .false = .else, ...)
}
#' @export
modify_if.double <- function(.x, .p, .f, ..., .else = NULL) {
  modify_if_atomic(map_dbl, .x, .p, .true = .f, .false = .else, ...)
}
#' @export
modify_if.character <- function(.x, .p, .f, ..., .else = NULL) {
  modify_if_atomic(map_chr, .x, .p, .true = .f, .false = .else, ...)
}
#' @export
modify_if.logical <- function(.x, .p, .f, ..., .else = NULL) {
  modify_if_atomic(map_lgl, .x, .p, .true = .f, .false = .else, ...)
}

modify_if_atomic <- function(.fmap, .x, .p, .true, .false = NULL, ...) {
  sel <- probe(.x, .p)
  .x[sel] <- .fmap(.x[sel], .true, ...)

  if (!is.null(.false)) {
    .x[!sel] <- .fmap(.x[!sel], .false, ...)
  }

  .x
}


#' @export
modify_at.integer <- function(.x, .at, .f, ...) {
  where <- at_selection(names(.x), .at)
  sel <- inv_which(.x, where)
  .x[sel] <- map_int(.x[sel], .f, ...)
  .x
}
#' @export
modify_at.double <- function(.x, .at, .f, ...) {
  where <- at_selection(names(.x), .at)
  sel <- inv_which(.x, where)
  .x[sel] <- map_dbl(.x[sel], .f, ...)
  .x
}
#' @export
modify_at.character <- function(.x, .at, .f, ...) {
  where <- at_selection(names(.x), .at)
  sel <- inv_which(.x, where)
  .x[sel] <- map_chr(.x[sel], .f, ...)
  .x
}
#' @export
modify_at.logical <- function(.x, .at, .f, ...) {
  where <- at_selection(names(.x), .at)
  sel <- inv_which(.x, where)
  .x[sel] <- map_lgl(.x[sel], .f, ...)
  .x
}

#' @rdname modify
#' @export
modify2 <- function(.x, .y, .f, ...) {
  UseMethod("modify2")
}
#' @export
modify2.default <- function(.x, .y, .f, ...) {
  modify_base(map2, .x, .y, .f, ...)
}

#' @rdname modify
#' @export
imodify <- function(.x, .f, ...) {
  modify2(.x, vec_index(.x), .f, ...)
}

# TODO: Improve genericity (see above)
#' @export
modify2.integer  <- function(.x, .y, .f, ...) {
  modify_base(map2_int, .x, .y, .f, ...)
}
#' @export
modify2.double  <- function(.x, .y, .f, ...) {
  modify_base(map2_dbl, .x, .y, .f, ...)
}
#' @export
modify2.character  <- function(.x, .y, .f, ...) {
  modify_base(map2_chr, .x, .y, .f, ...)
}
#' @export
modify2.logical  <- function(.x, .y, .f, ...) {
  modify_base(map2_lgl, .x, .y, .f, ...)
}

modify_base <- function(mapper, .x, .y, .f, ...) {
  .f <- as_mapper(.f, ...)
  out <- mapper(.x, .y, .f, ...)

  # if .x got recycled by map2
  if (length(out) > length(.x)) {
    .x <- .x[rep(1L, length(out))]
  }
  .x[] <- out
  .x
}

#' @rdname modify
#' @export
modify_depth <- function(.x, .depth, .f, ..., .ragged = .depth < 0) {
  if (!is_integerish(.depth, n = 1, finite = TRUE)) {
    depth <- .depth
    cli::cli_abort("{.arg .depth} must be a single number, not {.obj_type_friendly {depth}}")
  }
  UseMethod("modify_depth")
}
#' @rdname modify
#' @export
modify_depth.default <- function(.x, .depth, .f, ..., .ragged = .depth < 0) {
  force(.ragged)

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
      cli::cli_abort("{.arg .x} not deep enough for specified {.arg .depth}.")
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

# Internal version of map_lgl() that works with logical vectors
probe <- function(.x, .p, ..., .error_call = caller_env()) {
  if (is_logical(.p)) {
    stopifnot(length(.p) == length(.x))
    .p
  } else {
    .p <- as_predicate(.p, ..., .mapper = TRUE, .error_call = .error_call)
    map_lgl(.x, .p, ...)
  }
}

inv_which <- function(x, sel, error_call = caller_env()) {
  if (is.character(sel)) {
    names <- names(x)
    if (is.null(names)) {
      cli::cli_abort(
        "Character {.arg .at} must be used with a named {.arg x}.",
        call = error_call
      )
    }
    names %in% sel
  } else if (is.numeric(sel)) {
    if (any(sel < 0)) {
      !seq_along(x) %in% abs(sel)
    } else {
      seq_along(x) %in% sel
    }

  } else {
    cli::cli_abort(
      "{.arg .at} must be a character or numeric vector, not {.obj_type_friendly {sel}}.",
      call = error_call
    )
  }
}

`list_slice2<-` <- function(x, i, value) {
  if (is.null(value)) {
    x[i] <- list(NULL)
  } else {
    x[[i]] <- value
  }
  x
}
