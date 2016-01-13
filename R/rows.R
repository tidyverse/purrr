#' Apply a function to slices of a data frame
#'
#' \code{by_slice()} applies \code{..f} on each group of a data
#' frame. Groups should be set with \code{slice_rows()} or
#' \code{\link[dplyr]{group_by}()}.
#'
#' \code{by_slice()} provides equivalent functionality to dplyr's
#' \code{\link[dplyr]{do}()} function. In combination with
#' \code{map()}, \code{by_slice()} is equivalent to
#' \code{\link[dplyr]{summarise_each}()} and
#' \code{\link[dplyr]{mutate_each}()}. The distinction between
#' mutating and summarising operations is not as important as in dplyr
#' because we do not act on the columns separately. The only
#' constraint is that the mapped function must return the same number
#' of rows for each variable mapped on.
#' @param .d A sliced data frame.
#' @param ..f A function to apply to each slice. If \code{..f} does
#'   not return a data frame or an atomic vector, a list-column is
#'   created under the name \code{.out}. If it returns a data frame, it
#'   should have the same number of rows within groups and the same
#'   number of columns between groups.
#' @param ... Further arguments passed to \code{..f}.
#' @param .collate If "list", the results are returned as a list-
#'   column. Alternatively, if the results are data frames or atomic
#'   vectors, you can collate on "cols" or on "rows". Column collation
#'   require vector of equal length or data frames with same number of
#'   rows.
#' @param .to Name of output column.
#' @param .labels If \code{TRUE}, the returned data frame is prepended
#'   with the labels of the slices (the columns in \code{.d} used to
#'   define the slices). They are recycled to match the output size in
#'   each slice if necessary.
#' @return A data frame.
#' @seealso \code{\link{by_row}()}, \code{\link{slice_rows}()},
#'   \code{\link{dmap}()}
#' @importFrom Rcpp sourceCpp
#' @useDynLib purrr by_slice_impl
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
#'
#' # To modify the contents of a data frame, use rows collation. Note
#' # that unlike dplyr, Mutating and summarising operations can be
#' # used indistinctly.
#'
#' # Mutating operation:
#' df <- mtcars %>% slice_rows(c("cyl", "am"))
#' df %>% by_slice(dmap, ~ .x / sum(.x), .collate = "rows")
#'
#' # Summarising operation:
#' df %>% by_slice(dmap, mean, .collate = "rows")
#'
#' # Note that mapping columns within slices is best handled by dmap():
#' df %>% dmap(~ .x / sum(.x))
#' df %>% dmap(mean)
#'
#' # If you don't need the slicing variables as identifiers, switch
#' # .labels to FALSE:
#' mtcars %>%
#'   slice_rows("cyl") %>%
#'   by_slice(partial(lm, mpg ~ disp), .labels = FALSE) %>%
#'   flatten() %>%
#'   map(coef)
by_slice <- function(.d, ..f, ..., .collate = c("list", "rows", "cols"),
                     .to = ".out", .labels = TRUE) {
  ..f <- as_rows_function(..f)
  if (!dplyr::is.grouped_df(.d)) {
    stop(".d must be a sliced data frame", call. = FALSE)
  }
  if (length(.d) <= length(attr(.d, "labels"))) {
    stop("Mappable part of data frame is empty", call. = FALSE)
  }
  .collate <- match.arg(.collate)

  set_sliced_env(.d, .labels, .collate, .to, environment(), ".d")
  .Call(by_slice_impl, environment(), ".d", "..f")
}

# Prevents as_function() from transforming to a plucking function
as_rows_function <- function(f, f_name = ".f") {
  if (inherits(f, "formula")) {
    as_function(f)
  } else if (!is.function(f)) {
    stop(f_name, " should be a function or a formula", call. = FALSE)
  } else {
    f
  }
}

set_sliced_env <- function(df, labels, collate, to, env, x_name) {
  env$.unique_labels <- TRUE
  env$.labels <- labels;
  env$.collate <- collate
  env$.to <- to
  env$.labels_cols <- attr(df, "labels")
  env$.slicing_cols <- df[names(env$.labels_cols)]

  indices <- attr(df, "indices")
  env[[x_name]] <- df[!names(df) %in% names(env$.labels_cols)]
  attr(env[[x_name]], "indices") <- indices
}


#' Apply a function to each row of a data frame
#'
#' \code{by_row()} and \code{invoke_rows()} apply \code{..f} to each row
#' of \code{.d}. If \code{..f}'s output is not a data frame nor an
#' atomic vector, a list-column is created. In all cases,
#' \code{by_row()} and \code{invoke_rows()} create a data frame in tidy
#' format.
#'
#' By default, the whole row is appended to the result to serve as
#' identifier (set \code{.labels} to \code{FALSE} to prevent this). In
#' addition, if \code{..f} returns a multi-rows data frame or a
#' non-scalar atomic vector, a \code{.row} column is appended to
#' identify the row number in the original data frame.
#'
#' \code{invoke_rows()} is intended to provide a version of
#' \code{pmap()} for data frames. Its default collation method is
#' \code{"cols"}, which makes it equivalent to
#' \code{\link[plyr]{mdply}()} from the plyr package. Note that
#' \code{invoke_rows()} follows the signature pattern of the
#' \code{invoke} family of functions and takes \code{.f} as its first
#' argument.
#'
#' The distinction between \code{by_row()} and \code{invoke_rows()} is
#' that the former passes a data frame to \code{..f} while the latter
#' maps the columns to its function call. This is essentially like
#' using \code{\link{invoke}()} with each row. Another way to view
#' this is that \code{invoke_rows()} is equivalent to using
#' \code{by_row()} with a function lifted to accept dots (see
#' \code{\link{lift}()}).
#'
#' @param .d A data frame.
#' @param .f,..f A function to apply to each row. If \code{..f} does
#'   not return a data frame or an atomic vector, a list-column is
#'   created under the name \code{.out}. If it returns a data frame, it
#'   should have the same number of rows within groups and the same
#'   number of columns between groups.
#' @param ... Further arguments passed to \code{..f}.
#' @inheritParams by_slice
#' @return A data frame.
#' @seealso \code{\link{by_slice}()}
#' @useDynLib purrr invoke_rows_impl
#' @export
#' @examples
#' # ..f should be able to work with a list or a data frame. As it
#' # happens, sum() handles data frame so the following works:
#' mtcars %>% by_row(sum)
#'
#' # Other functions such as mean() may need to be adjusted with one
#' # of the lift_xy() helpers:
#' mtcars %>% by_row(lift_vl(mean))
#'
#' # To run a function with invoke_rows(), make sure it is variadic (that
#' # it accepts dots) or that .f's signature is compatible with the
#' # column names
#' mtcars %>% invoke_rows(.f = sum)
#' mtcars %>% invoke_rows(.f = lift_vd(mean))
#'
#' # invoke_rows() with cols collation is equivalent to plyr::mdply()
#' p <- expand.grid(mean = 1:5, sd = seq(0, 1, length = 10))
#' p %>% invoke_rows(.f = rnorm, n = 5, .collate = "cols")
#' \dontrun{
#' p %>% plyr::mdply(rnorm, n = 5) %>% dplyr::tbl_df()
#' }
#'
#' # To integrate the result as part of the data frame, use rows or
#' # cols collation:
#' mtcars[1:2] %>% by_row(function(x) 1:5)
#' mtcars[1:2] %>% by_row(function(x) 1:5, .collate = "rows")
#' mtcars[1:2] %>% by_row(function(x) 1:5, .collate = "cols")
by_row <- function(.d, ..f, ..., .collate = c("list", "rows", "cols"),
                   .to = ".out", .labels = TRUE) {
  check_df_consistency(.d)
  if (nrow(.d) < 1) {
    return(.d)
  }

  ..f <- as_rows_function(..f)
  .collate <- match.arg(.collate)

  indices <- seq(0, nrow(.d) - 1) # cpp-style indexing
  attr(.d, "indices") <- as.list(indices)

  .unique_labels <- 0
  .labels_cols <- .d
  .slicing_cols <- .d

  .Call(by_slice_impl, environment(), ".d", "..f")
}

check_df_consistency <- function(.d) {
  if (!is.data.frame(.d)) {
    stop(".d must be a data frame", call. = FALSE)
  }
  if (length(.d) == 0) {
    stop("Data frame is empty", call. = FALSE)
  }
}

#' @rdname by_row
#' @export
invoke_rows <- function(.f, .d, ..., .collate = c("list", "rows", "cols"),
                        .to = ".out", .labels = TRUE) {
  check_df_consistency(.d)
  .collate <- match.arg(.collate)

  .unique_labels <- 0
  .labels_cols <- .d
  .slicing_cols <- .d

  .Call(invoke_rows_impl, environment(), ".d", ".f")
}

#' @export
#' @usage NULL
#' @rdname by_row
map_rows <- function(.d, .f, ..., .labels = TRUE) {
  message("`map_rows()` is deprecated; please use `invoke_rows()` instead.",
    call. = FALSE)
  invoke_rows(.f, .d, ..., .labels = .labels)
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

  dplyr::group_by_(.d, .dots = .cols)
}

#' @rdname slice_rows
#' @export
unslice <- function(.d) {
  dplyr::group_by_(.d, .dots = list())
}
