#' Apply a function to each element of a list.
#'
#' \code{map} returns the transformed input; \code{each} calls \code{.f} for
#' its side-effect and returns the original input. \code{map} always returns
#' a list; \code{map_v} always returns an atomic vector (or dies trying).
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
#' @return \code{map} a list; \code{map_v} a vector; \code{map_d} a data frame;
#'   \code{each} (invisibly) the input \code{.x}.
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
#' # map, map_v and map_d allow you to control the output type:
#' # * list
#' mtcars %>% map(sum)
#' # * vector
#' mtcars %>% map_v(sum)
#' # * data frame
#' mtcars %>% map_d(sum)
map <- function(.x, .f, ...) {
  .f <- as_function(.f)
  lapply(.x, .f, ...)
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
map_d <- function(.x, .f, ...) {
  .f <- as_function(.f)
  dplyr::as_data_frame(lapply(.x, .f, ...))
}


#' @export
#' @rdname map
each <- function(.x, .f, ...) {
  for (i in seq_along(.x)) {
    .f(.x[[i]], ...)
  }
  invisible(.x)
}


#' Map over multiple inputs simultaneously.
#'
#' These functions are designed in such a way that arguments to be vectorised
#' over come before the function name, and arguments that should be supplied to
#' every call come after the function name.
#'
#' @inheritParams map
#' @param .f A function of two (for \code{map2}) or three (\code{map3})
#'   arguments.
#' @param .x,.y,.z Lists, usually of the same length. If not, lists will
#'   be recycled to the length of the longest, using R's regular recycling
#'   rules.
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
  force(.f)
  f <- function(x, y) {
    .f(x, y, ...)
  }
  Map(f, .x, .y)
}

#' @export
#' @rdname map2
map3 <- function(.x, .y, .z, .f, ...) {
  force(.f)
  f <- function(x, y, z) {
    .f(x, y, ...)
  }
  Map(f, .x, .y, .z)
}


#' Modify elements where predicate is satisified.
#'
#' @inheritParams map
#' @param .p A single predicate function, a formula describing such a
#'   predicate function, or a logical vector of the same length as \code{.x}.
#'   Alternatively, if the elements of \code{.x} are themselves lists of
#'   objects, a string indicating the name of a logical element in the
#'   inner lists. Only those elements where \code{.p} evaluates to
#'   \code{TRUE} will be modified, kept or discarded.
#' @return The same type of object as \code{.x}.
#' @export
#' @examples
#' list(x = rbenoulli(100), y = 1:100) %>%
#'   zip() %>%
#'   map_if("x", ~ update_list(., y = ~ y * 100)) %>%
#'   unzip() %>%
#'   map(flatten)
#'
#' # Convert factors to characters
#' iris %>%
#'   map_if(is.factor, as.character) %>%
#'   str()
map_if <- function(.x, .p, .f, ...) {
  .f <- as_function(.f)
  sel <- find_selection(.x, .p)

  .x[sel] <- lapply(.x[sel], .f, ...)
  .x
}
