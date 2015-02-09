#' Chart the application of a function along coordinates
#'
#' \code{chart()} modifies a function that takes a list to make it act
#' on a given route of coordinates. A charted function applies itself
#' on elements of a list according to a sequence of indices defined by
#' \code{.route}.
#' @param ..f A function that takes a list of length equal to the
#'   cardinality of the coordinates in \code{.route}.
#' @param .route A list of indices used to subset \code{.x}; a
#'   character or numeric vector; or a function that takes .x and returns
#'   a sequence of indices, like \code{seq_window()}, \code{seq_pairs()}
#'   or \code{seq_along()}.
#' @param ... Further arguments passed on to the charted
#'   function. They are computed only once when \code{chart()} is
#'   called.
#' @return A function that takes a list \code{.x} as first argument.
#' @seealso \code{\link{map_along}()}, \link{sequences}
#' @export
#' @examples
#' # We can use chart() to create a function that checks that
#' # all consecutive pairs of elements of .x are identical()
#' check_identical <- chart(identical, .route = seq_window)
#' mtcars[c(1, 1, 2, 3, 3)] %>% check_identical()
chart <- function(..f, .route, ...) {
  defaults <- list(...)
  force(.route)
  force(..f)

  function(.x, ...) {
    map_along_impl(.x, .route, ..f, c(defaults, list(...)))
  }
}

#' Map a function on a list along coordinates
#'
#' \code{map_along()} applies a function that takes a list \code{.x}
#' on a subset of its elements according to a given route of
#' coordinates.
#'
#' \code{map_along()} is like \code{chart()} but applies \code{.f}
#' directly instead of modifying it.
#' @param .x A list or vector.
#' @param .f A function that takes a list of length equal to the
#'   cardinality of the coordinates in \code{.route}.
#' @param ... Further arguments passed on to \code{.f}.
#' @inheritParams chart
#' @seealso \code{\link{chart}()}, \link{sequences}
#' @export
#' @examples
#' # Although it is not efficient for this purpose, map_along() offers
#' # a simple way of computing a moving average (here with a window of
#' # size 5) by using seq_window(). Note that we need to stich mean()'s
#' # signature since map_along() can only act on functions that take a
#' # list as their main argument.
#' mtcars %>% map_along(.route = partial(seq_window, size = 5), stitch(mean))
#'
#' # map_along() with seq_along() as routing function is equivalent to
#' # a normal mapping (except that it does not retain attributes)
#' out1 <- mtcars %>% `attributes<-`(NULL) %>% map(mean)
#' out2 <- mtcars %>% map_along(seq_along, mean)
#' identical(out1, out2)
#'
#' # seq_pairs() can be used to apply a function on all pairs of elements
#' # of .x (or a relevant subset of those pairs)
#' letters[1:4] %>% map_along(partial(seq_pairs, filter = `>`), identical)
map_along <- function(.x, .route, .f, ...) {
  map_along_impl(.x, .route, .f, list(...))
}

map_along_impl <- function(x, route, f, args) {
  along <-
    if (is.function(route)) {
      route(x)
    } else if ((is.list(route) && every(route, is_index)) || is_index(route)) {
      route
    } else {
      stop("Don't know how to handle route of type ", class(route),
        call. = FALSE)
    }

  lapply(along, function(index) {
    # Remove names of subsets of x so that they are matched by
    # position rather than name in f()'s signature
    obj <- x[index] %>% unname()
    c(obj, args) %>% map_call(f)
  })
}
