#' Apply a function to slices of a data frame
#'
#' \code{by_slice()} applies `..f` on each group of a data
#' frame. Groups should be set with \code{slice_rows()} or
#' \code{\link[dplyr]{group_by}()}.
#'
#' \code{by_slice()} provide equivalent functionality to dplyr's
#' \code{\link[dplyr]{do}()} function. In combination with
#' \code{map()}, \code{by_slice()} is equivalent to
#' \code{\link[dplyr]{summarise_each}()} and
#' \code{\link[dplyr]{mutate_each}()}. The distinction between
#' mutating and summarising operations is not as important as in dplyr
#' because we do not act on the columns separately. When we map a
#' function to each column, the only constraint is that the number of
#' returned rows match inside each slice.
#' @param .d A sliced data frame.
#' @param ..f A function to apply to each slice. If \code{..f} does
#'   not return a data frame or an atomic vector, a list-column is
#'   created under the name \code{.out}. If it returns a data frame, it
#'   should have the same number of rows within groups and the same
#'   number of columns between groups.
#' @param ... Further arguments passed to \code{..f}.
#' @param .labels If \code{TRUE}, the returned data frame is prepended
#'   with the labels of the slices (the columns in \code{.d} used to
#'   define the slices). They are recycled to match the output size in
#'   each slice if necessary.
#' @return A data frame.
#' @seealso \code{\link{by_row}()}, \code{\link{slice_rows}()}
#' @useDynLib purrr
#' @importFrom Rcpp sourceCpp
#' @export
#' @examples
#' # Here we fit a regression model inside each slice defined by the
#' # unique values of the column "cyl". The fitted models are returned
#' # in a list-column.
#' mtcars %>%
#'   slice_rows("cyl") %>%
#'   by_slice(partial(lm, mpg ~ disp))
#'
#' # by_slice() is especially useful in combination with map().
#' # Mutating and summarising operations can be used indistinctly.
#'
#' # Mutating operation:
#' mtcars %>%
#'   slice_rows(c("cyl", "am")) %>%
#'   by_slice(map, ~ .x / sd(.x))
#'
#' # Summarising operation:
#' mtcars %>%
#'   slice_rows(c("cyl", "am")) %>%
#'   by_slice(map, mean)
#'
#' # If you don't need the slicing variables as identifiers, switch
#' # .labels to FALSE:
#' mtcars %>%
#'   slice_rows("cyl") %>%
#'   by_slice(partial(lm, mpg ~ disp), .labels = FALSE) %>%
#'   flatten() %>%
#'   map(coef)
by_slice <- function(.d, ..f, ..., .labels = TRUE) {
  if (inherits(..f, "formula")) {
    ..f <- as_function(..f)
  } else if (!is.function(..f)) {
    stop("..f should be a function or a formula", call. = FALSE)
  }

  if (!dplyr::is.grouped_df(.d)) {
    ..f(.d, ...)
  } else {
    dots <- substitute(pairlist(...))
    calling_env <- parent.frame()
    by_slice_impl(.d, ..f, dots, .labels, calling_env)
  }
}


#' Apply a function to each row of a data frame
#'
#' Applies \code{..f} to each row of \code{.d}. By default, the whole
#' row is appended to the result to serve as identifier (set
#' \code{.labels} to \code{FALSE} to prevent this). In addition, if
#' \code{..f} returns a multi-rows data frame or a non-scalar atomic
#' vector, a \code{.row} column is appended to identify the row number
#' in the original data frame. If \code{..f}'s output is not a data
#' frame nor an atomic vector, a list-column is created. In all cases,
#' \code{by_row()} and \code{map_row()} create a data frame in tidy
#' format.
#'
#' \code{map_rows()} is intended to provide a version of
#' \code{map_n()} that works better with data frames. The distinction
#' between \code{by_row()} and \code{map_rows()} is that in the former
#' case, \code{..f} gets the data frame as argument, while in the
#' latter, the columns are mapped to \code{..f}'s function
#' signature. In essence, \code{map_row()} is equivalent to using
#' \code{by_row()} with a lifted function (see
#' \code{\link{lift_dl}()}).
#' @param .f,..f A function to apply to each row. If \code{..f} does
#'   not return a data frame or an atomic vector, a list-column is
#'   created under the name \code{.out}. If it returns a data frame, it
#'   should have the same number of rows within groups and the same
#'   number of columns between groups.
#' @param ... Further arguments passed to \code{..f}.
#' @inheritParams by_slice
#' @return A data frame.
#' @seealso \code{\link{by_slice}()}
#' @useDynLib purrr
#' @export
#' @examples
#' # ..f should be able to work with a list or a data frame. As it
#' # happens, sum() handles data frame so the following works:
#' mtcars %>% by_row(sum)
#'
#' \dontrun{ % temporary examples until lift() and punctuate_v() make it (or not) in purrr
#' # Other functions such as mean() may need to be adjusted:
#' mtcars %>% by_row(lift(mean))
#'
#' # To run a function with map_rows(), make sure it is variadic (that
#' # it accepts dots)
#' mtcars %>% map_rows(sum)
#' mtcars %>% map_rows(punctuate_v(mean))
#' }
by_row <- function(.d, ..f, ..., .labels = TRUE) {
  if (inherits(..f, "formula")) {
    ..f <- as_function(..f)
  } else if (!is.function(..f)) {
    stop("..f should be a function or a formula", call. = FALSE)
  }

  dots <- substitute(list(...))
  calling_env <- parent.frame()
  by_row_impl(.d, ..f, dots, .labels, calling_env)
}

#' @rdname by_row
#' @export
map_rows <- function(.d, .f, ..., .labels = TRUE) {
  map_n(.d, .f, ...) %>% process_slices(.d, .d, .labels, TRUE)
}


#' Slice a data frame into groups of rows
#'
#' \code{slice_rows()} is equivalent to dplyr's
#' \code{\link[dplyr]{group_by}()} command but it takes a vector of
#' column names or positions instead of capturing column names with
#' special evaluation. \code{unslice()} removes the slicing
#' attributes.
#' @param .d A data frame to slice or unslice.
#' @param .cols A character vector of column names or a numeric vector
#'   of column positions. If \code{NULL}, the slicing attributes are
#'   removed.
#' @return A sliced or unsliced data frame.
#' @seealso \code{\link{by_slice}()} and \code{\link[dplyr]{group_by}()}
#' @export
slice_rows <- function(.d, .cols = NULL) {
  stopifnot(is.data.frame(.d))
  if (is.null(.cols)) {
    return(unslice(.d))
  }
  if (is.numeric(.cols)) {
    .cols <- names(.d)[.cols]
  }
  stopifnot(is.character(.cols))

  .cols %>% map_call(dplyr::group_by_, .data = .d)
}

#' @rdname slice_rows
#' @export
unslice <- function(.d) {
  dplyr::group_by_(.d, .dots = list())
}
