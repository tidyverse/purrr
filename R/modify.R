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


# modify_if ---------------------------------------------------------------

#' @rdname modify
#' @inheritParams map_if
#' @export
modify_if <- function(.x, .p, .f, ..., .else = NULL) {
  UseMethod("modify_if")
}
#' @rdname modify
#' @export
modify_if.default <- function(.x, .p, .f, ..., .else = NULL) {
  where <- where_if(.x, .p)
  index <- seq_along(.x)

  .f <- as_mapper(.f, ...)
  for (i in index[where]) {
    list_slice2(.x, i) <- .f(.x[[i]], ...)
  }

  if (!is_null(.else)) {
    .else <- as_mapper(.else, ...)
    for (i in index[!where]) {
      list_slice2(.x, i) <- .else(.x[[i]], ...)
    }
  }

  .x
}
#' @export
modify_if.integer <- function(.x, .p, .f, ..., .else = NULL) {
  modify_if_base(map_int, .x, .p, .true = .f, .false = .else, ...)
}
#' @export
modify_if.double <- function(.x, .p, .f, ..., .else = NULL) {
  modify_if_base(map_dbl, .x, .p, .true = .f, .false = .else, ...)
}
#' @export
modify_if.character <- function(.x, .p, .f, ..., .else = NULL) {
  modify_if_base(map_chr, .x, .p, .true = .f, .false = .else, ...)
}
#' @export
modify_if.logical <- function(.x, .p, .f, ..., .else = NULL) {
  modify_if_base(map_lgl, .x, .p, .true = .f, .false = .else, ...)
}

modify_if_base <- function(.fmap, .x, .p, .true, .false = NULL, ..., .error_call = caller_env()) {
  where <- where_if(.x, .p, .error_call = .error_call)
  .x[where] <- .fmap(.x[where], .true, ...)

  if (!is.null(.false)) {
    .x[!where] <- .fmap(.x[!where], .false, ...)
  }

  .x
}

# modify_at ---------------------------------------------------------------

#' @rdname modify
#' @inheritParams map_at
#' @export
modify_at <- function(.x, .at, .f, ...) {
  UseMethod("modify_at")
}
#' @rdname modify
#' @export
modify_at.default <- function(.x, .at, .f, ...) {
  where <- where_at(.x, .at)
  modify_if(.x, where, .f, ...)
}
#' @export
modify_at.integer <- function(.x, .at, .f, ...) {
  where <- where_at(.x, .at)
  .x[where] <- map_int(.x[where], .f, ...)
  .x
}
#' @export
modify_at.double <- function(.x, .at, .f, ...) {
  where <- where_at(.x, .at)
  .x[where] <- map_dbl(.x[where], .f, ...)
  .x
}
#' @export
modify_at.character <- function(.x, .at, .f, ...) {
  where <- where_at(.x, .at)
  .x[where] <- map_chr(.x[where], .f, ...)
  .x
}
#' @export
modify_at.logical <- function(.x, .at, .f, ...) {
  where <- where_at(.x, .at)
  .x[where] <- map_lgl(.x[where], .f, ...)
  .x
}

# modify2 -----------------------------------------------------------------

#' @rdname modify
#' @export
modify2 <- function(.x, .y, .f, ...) {
  UseMethod("modify2")
}
#' @export
modify2.default <- function(.x, .y, .f, ...) {
  modify2_base(map2, .x, .y, .f, ...)
}
# TODO: Improve genericity (see above)
#' @export
modify2.integer  <- function(.x, .y, .f, ...) {
  modify2_base(map2_int, .x, .y, .f, ...)
}
#' @export
modify2.double  <- function(.x, .y, .f, ...) {
  modify2_base(map2_dbl, .x, .y, .f, ...)
}
#' @export
modify2.character  <- function(.x, .y, .f, ...) {
  modify2_base(map2_chr, .x, .y, .f, ...)
}
#' @export
modify2.logical  <- function(.x, .y, .f, ...) {
  modify2_base(map2_lgl, .x, .y, .f, ...)
}

modify2_base <- function(mapper, .x, .y, .f, ...) {
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
imodify <- function(.x, .f, ...) {
  modify2(.x, vec_index(.x), .f, ...)
}
