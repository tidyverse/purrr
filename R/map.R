#' Apply a function to each element of a list.
#'
#' \code{map()} returns the transformed input; \code{walk()} calls
#' \code{.f} for its side-effect and returns the original
#' input. \code{map()} returns a list or a data frame; \code{map_lgl()},
#' \code{map_int()}, \code{map_dbl()} and \code{map_chr()} return vectors
#' of the corresponding type (or die trying); \code{map_df()} returns
#' a data frame by row-binding the individual elements.
#'
#' @inheritParams as_function
#' @param .x A list or vector.
#' @param ... Additional arguments passed on to \code{.f}.
#' @return \code{map()} a list if \code{.x} is a list or a data frame
#'   if \code{.x} is a data frame.
#'
#'   \code{map_lgl()} returns a logical vector, \code{map_int()} an integer
#'   vector, \code{map_dbl()}, a numeric vector, \code{map_chr()}, a character
#'   vector.
#'
#'   \code{walk()} (invisibly) the input \code{.x}. It's called primarily for
#'   its side effects, but this makes it easier to combine in a pipe.
#' @seealso \code{\link{map2}()} and \code{\link{map3}()} to map over multiple
#'   inputs simulatenously
#' @export
#' @examples
#' 1:10 %>%
#'   map(rnorm, n = 10) %>%
#'   map_dbl(mean)
#'
#' # Or use an anonymous function
#' 1:10 %>%
#'   map(function(x) rnorm(10, x))
#'
#' # Or a formula
#' 1:10 %>%
#'   map(~ rnorm(10, .x))
#'
#' # A more realistic example: split a data frame into pieces, fit a
#' # model to each piece, summarise and extract R^2
#' mtcars %>%
#'   split(.$cyl) %>%
#'   map(~ lm(mpg ~ wt, data = .x)) %>%
#'   map(summary) %>%
#'   map_dbl("r.squared")
#'
#' # Use map_lgl(), map_dbl(), etc to reduce to a vector.
#' # * list
#' mtcars %>% map(sum)
#' # * vector
#' mtcars %>% map_dbl(sum)
#'
#' # If each element of the output is a data frame, use
#' # map_df to row-bind them together:
#' mtcars %>%
#'   split(.$cyl) %>%
#'   map(~ lm(mpg ~ wt, data = .x)) %>%
#'   map_df(~ as.data.frame(t(as.matrix(coef(.)))))
#' # (if you also want to preserve the variable names see
#' # the broom package)
map <- function(.x, .f, ...) {
  .f <- as_function(.f)
  lapply(.x, .f, ...) %>% output_hook(.x)
}

#' @rdname map
#' @param .p A predicate: either a function, in any of the ways possible
#'   for \code{.f}, or a logical vector the same length as \code{.x}.
#' @export
map_lgl <- function(.x, .p, ...) {
  if (is.logical(.p)) {
    stopifnot(length(.p) == length(.x))
    .p
  } else {
    .p <- as_function(.p)
    vapply(.x, .p, ..., FUN.VALUE = logical(1))
  }
}

#' @rdname map
#' @export
map_chr <- function(.x, .f, ...) {
  .f <- as_function(.f)
  vapply(.x, .f, ..., FUN.VALUE = character(1))
}

#' @rdname map
#' @export
map_int <- function(.x, .f, ...) {
  .f <- as_function(.f)
  vapply(.x, .f, ..., FUN.VALUE = integer(1))
}

#' @rdname map
#' @export
map_dbl <- function(.x, .f, ...) {
  .f <- as_function(.f)
  vapply(.x, .f, ..., FUN.VALUE = double(1))
}

#' @rdname map
#' @export
map_df <- function(.x, .f, ...) {
  .f <- as_function(.f)
  res <- map(.x, .f, ...)
  dplyr::bind_rows(res)
}


#' @export
#' @rdname map
walk <- function(.x, .f, ...) {
  .f <- as_function(.f)
  for (i in seq_along(.x)) {
    .f(.x[[i]], ...)
  }
  invisible(.x)
}


#' Map over multiple inputs simultaneously.
#'
#' These functions are designed in such a way that arguments to be
#' vectorised over come before the function name, and arguments that
#' should be supplied to every call come after the function name.
#'
#' \code{map_n()} and \code{walk_n()} take a single list \code{.l} and
#' map over all its elements simultaneously. \code{map2()} and
#' \code{map3()} return a data frame when \code{.x} is a data frame.
#'
#' @inheritParams map
#' @param .f A function of two (for \code{map2} and \code{walk2}) or
#' three (\code{map3} and \code{walk3}) arguments. For \code{map_n}
#' and \code{walk_n}, the number of arguments must correspond to the
#' number of elements of \code{.l}.
#' @param .x,.y,.z Lists of the same length or of length 1. Only
#' lists of length 1 are recycled.
#' @param .l A list of lists to be mapped on simultaneously.
#' @export
#' @examples
#' x <- list(1, 10, 100)
#' y <- list(1, 2, 3)
#' map2(x, y, ~ .x + .y)
#' # Or just
#' map2(x, y, `+`)
#'
#' z <- list(15, 20, 25)
#' map3(x, y, z, ~ .x ^ .y + .z)
#'
#' # Split into pieces, fit model to each piece, then predict
#' by_cyl <- mtcars %>% split(.$cyl)
#' mods <- by_cyl %>% map(~ lm(mpg ~ wt, data = .))
#' map2(mods, by_cyl, predict)
map2 <- function(.x, .y, .f, ...) {
  map_n(list(.x, .y), .f, ...) %>% output_hook(.x)
}

#' @export
#' @rdname map2
map3 <- function(.x, .y, .z, .f, ...) {
  map_n(list(.x, .y, .z), .f, ...) %>% output_hook(.x)
}

#' @export
#' @rdname map2
map_n <- function(.l, .f, ...) {
  .f <- as_function(.f)
  args <- recycle_args(.l)
  do.call("mapply", c(
    FUN = list(quote(.f)), args, MoreArgs = quote(list(...)),
    SIMPLIFY = FALSE, USE.NAMES = FALSE
  ))
}


#' @export
#' @rdname map2
walk2 <- function(.x, .y, .f, ...) {
  walk_n(list(.x, .y), .f, ...)
  invisible(.x)
}

#' @export
#' @rdname map2
walk3 <- function(.x, .y, .z, .f, ...) {
  walk_n(list(.x, .y, .z), .f, ...)
  invisible(.x)
}

#' @export
#' @rdname map2
walk_n <- function(.l, .f, ...) {
  .f <- as_function(.f)
  args_list <- recycle_args(.l) %>% zip_n()
  for (args in args_list) {
    do.call(".f", c(args, list(...)))
  }
  invisible(.l)
}

#' Modify elements conditionally
#'
#' \code{map_if()} maps a function over the elements of \code{.x}
#' satisfying a predicate. \code{map_at()} is similar but will modify
#' the elements corresponding to a character vector of names or a
#' mumeric vector of positions.
#' @inheritParams map
#' @param .p A single predicate function, a formula describing such a
#'   predicate function, or a logical vector of the same length as \code{.x}.
#'   Alternatively, if the elements of \code{.x} are themselves lists of
#'   objects, a string indicating the name of a logical element in the
#'   inner lists. Only those elements where \code{.p} evaluates to
#'   \code{TRUE} will be modified.
#' @param .at A character vector of names or a numeric vector of
#'   positions. Only those elements corresponding to \code{.at} will be
#'   modified.
#' @return The same type of object as \code{.x}.
#' @name conditional-map
#' @examples
#' list(x = rbernoulli(100), y = 1:100) %>%
#'   zip_n() %>%
#'   map_if("x", ~ update_list(., y = ~ y * 100)) %>%
#'   zip_n(.simplify = TRUE)
#'
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
NULL

#' @rdname conditional-map
#' @export
map_if <- function(.x, .p, .f, ...) {
  sel <- map_lgl(.x, .p)
  .x[sel] <- map(.x[sel], .f, ...)
  .x
}

#' @rdname conditional-map
#' @export
map_at <- function(.x, .at, .f, ...) {
  sel <- inv_which(.x, .at)
  .x[sel] <- map(.x[sel], .f, ...)
  .x
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
