#' Apply a function to each element of a list.
#'
#' \code{map()} returns the transformed input; \code{walk()} calls
#' \code{.f} for its side-effect and returns the original
#' input. \code{map()} returns a list or a data frame; \code{map_v()}
#' always returns an atomic vector (or dies trying).
#'
#' @param .x A list or vector.
#' @param .f A function, formula or string.
#'
#'   If a function, it is used as is.
#'
#'   If a formula, e.g. \code{~ x + 2}, it is converted to a function with
#'   a single argument, \code{x}, e.g. \code{function(x) x + 2}. This is less
#'   typing for very simple anonymous functions.
#'
#'   If a string, e.g. \code{"y"}, it is converted to an extractor function,
#'   \code{function(x) x[["y"]]}.
#' @param ... Additional arguments passed on to \code{.f}.
#' @param .type Specifies the type of result of \code{.f}, if known.
#'   This will improve performance, and adds a test that output of \code{.f}
#'   is the type that you expect.
#' @return \code{map()} a list if \code{.x} is a list or a data frame
#'   if \code{.x} is a data frame; \code{map_v()} a vector;
#'   \code{walk()} (invisibly) the input \code{.x}.
#' @seealso \code{\link{map2}()} and \code{\link{map3}()} to map over multiple
#'   inputs simulatenously
#' @export
#' @examples
#' 1:10 %>%
#'   map(rnorm, n = 10) %>%
#'   map(mean, .type = numeric(1))
#'
#' # Or use an anonymous function
#' 1:10 %>%
#'   map(function(x) rnorm(10, x))
#'
#' # Or a formula
#' 1:10 %>%
#'   map(~ rnorm(10, .))
#'
#' # A more realistic example: split a data frame into pieces, fit a
#' # model to each piece, summarise and extract R^2
#' mtcars %>%
#'   split(.$cyl) %>%
#'   map(~ lm(mpg ~ wt, data = .)) %>%
#'   map(summary) %>%
#'   map_v("r.squared")
#'
#' # map, map_v allow you to control the output type:
#' # * list
#' mtcars %>% map(sum)
#' # * vector
#' mtcars %>% map_v(sum)
map <- function(.x, .f, ...) {
  .f <- as_function(.f)
  lapply(.x, .f, ...) %>% output_hook(.x)
}

#' @rdname map
#' @export
map_v <- function(.x, .f, ..., .type) {
  .f <- as_function(.f)

  if (missing(.type)) {
    out <- lapply(.x, .f, ...)
    if (!can_simplify(out))
      stop("Can not coerce output to a vector", call. = FALSE)
    unlist(out)
  } else {
    vapply(.x, .f, ..., FUN.VALUE = .type)
  }
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
#' map2(x, y, `+`)
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
  args <- recycle_args(.l)
  do.call("mapply", c(list(quote(.f)), args, MoreArgs = quote(list(...)), SIMPLIFY = FALSE))
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
  args_list <- recycle_args(.l) %>% zip()
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
#'   zip() %>%
#'   map_if("x", ~ update_list(., y = ~ y * 100)) %>%
#'   unzip() %>%
#'   map(flatten)
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
  .f <- as_function(.f)
  sel <- probe(.x, .p)

  .x[sel] <- lapply(.x[sel], .f, ...)
  .x
}

#' @rdname conditional-map
#' @export
map_at <- function(.x, .at, .f, ...) {
  .f <- as_function(.f)
  sel <- inv_which(.x, .at)

  .x[sel] <- lapply(.x[sel], .f, ...)
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
