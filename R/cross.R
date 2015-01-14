#' Produce all combinations of list elements
#'
#' \code{cross()} returns the product set of the elements of \code{.x}
#' and \code{.y}. It is similar to \code{expand.grid()} but it returns
#' a list. By default, the cartesian product is returned in wide
#' format. This makes it more amenable to mapping
#' operations. Switching \code{.wide} to \code{FALSE} turns the output
#' to the long format, the equivalent to \code{expand.grid()}'s
#' outputs.
#'
#' \code{cross3()} takes three three arguments instead of two and
#' returns the cartesian product of the elements of the three
#' objects. \code{cross_n()} takes a list \code{.l} and returns the
#' cartesian product of all its elements. If \code{.l} is a data
#' frame, \code{cross_n()} returns a data frame.
#'
#' When the number of combinations is large and the individual elements
#' are heavy memory-wise, it is often useful to filter unwanted
#' combinations on the fly. \code{.filter} must be a predicate
#' functio! that takes the same number of arguments as the number of
#' crossed objects (2 for \code{cross()}, 3 for \code{cross3()},
#' \code{length(.l)} for \code{cross_n()}) and returns \code{TRUE} or
#' \code{FALSE}. The combinations where the predicate function returns
#' \code{TRUE} will be removed from the result.
#'
#' @seealso expand.grid
#' @param .x,.y,.z Lists or atomic vectors.
#' @param .l A list of lists or atomic vectors. Alternatively, a data frame.
#' @param .wide Only relevant for lists, not data frames. If
#' \code{TRUE}, returns a list of unique combinations.  If
#' \code{FALSE}, returns a list of the same size as the number of
#' arguments (2 for \code{cross()}, 3 for \code{cross3()},
#' \code{length(.l)} for \code{cross_n()}).
#'
#' \code{TRUE} is the default for lists so that each element of the
#' returned list is one combination. The list can then be directly
#' mapped over. \code{FALSE} is hard coded for data frames so that
#' each row represents one combination.
#' @param .filter A predicate function that takes the same number of
#' arguments as the number of variables to be combined.
#' @return A list or a data frame.
#' @export
#' @examples
#' # We build all combinations of names, greetings and separators from our
#' # list of data and pass each one to paste()
#' data <- list(
#'   id = c("John", "Jane"),
#'   greeting = c("Hello.", "Bonjour."),
#'   sep = c("! ", "... ")
#' )
#'
#' data %>% 
#'   cross_n() %>%
#'   map(smash(paste))
#'
#' # For this purpose, the long format is less pratical and requires a loop
#' args <- cross_n(data, .wide = FALSE)
#'
#' out <- vector("list", length(args[[1]]))
#' for (i in seq_along(out))
#'   out[[i]] <- map(args, i) %>% map_call("paste")
#' out
#'
#' # If we start with a data frame instead, we'll get a data frame in
#' # long format, as with expand.grid().
#' df <- data %>% dplyr::as_data_frame()
#' out2 <- cross_n(df)
#' 
#' # The combinations would then typically be manipulated using dplyr
#' out2 %>% dplyr::do(
#'   smash(paste)(.) %>% dplyr::data_frame()
#' )
#'
#' # Unwanted combinations can be filtered out with a predicate function
#' filter <- function(x, y) x >= y
#' cross(1:5, 1:5, .filter = filter) %>% str()
#'
#' # To give names to the components of the combinations, we map
#' # setNames() on the product:
#' grid <- seq_len(10) %>%
#'   cross(., ., .filter = function(x, y) x == y) %>%
#'   map(setNames, c("x", "y"))
#' 
#' # We can also encapsulate the arguments in a named list before
#' # crossing:
#' grid <- seq_len(10) %>%
#'   list(x = ., y = .) %>%
#'   cross_n(.filter = function(x, y) x == y)
cross <- function(.x, .y, .wide = TRUE, .filter = NULL) {
  cross_row_by_row(list(.x, .y), wide = .wide, filter = .filter)
}

#' @export
#' @rdname cross
cross3 <- function(.x, .y, .z, .wide = TRUE, .filter = NULL) {
  cross_row_by_row(list(.x, .y, .z), wide = .wide, filter = .filter)
}


#' @export
#' @rdname cross
cross_n <- function(.l, .wide = TRUE, .filter = NULL) {
  UseMethod("cross_n")
}

#' @export
cross_n.list <- function(.l, .wide = TRUE, .filter = NULL) {
  cross_row_by_row(.l, wide = .wide, filter = .filter)
}

#' @export
cross_n.data.frame <- function(.l, .filter = NULL) {
  out <- cross_row_by_row(.l, wide = FALSE, filter = .filter)
  out %>% dplyr::as_data_frame()
}

cross_row_by_row <- function(l, wide, filter = NULL) {
  n <- length(l)
  lengths <- lapply(l, length)
  names <- names(l)

  factors <- cumprod(lengths)
  total_length <- factors[n]
  factors <- c(1, factors[-n])

  out <- replicate(total_length, vector("list", n), simplify = FALSE)

  for (i in seq_along(out)) {
    for (j in seq_len(n)) {
      index <- floor((i - 1) / factors[j]) %% length(l[[j]]) + 1
      out[[i]][[j]] <- l[[j]][[index]]
    }
    names(out[[i]]) <- names

    # Filter out unwanted elements. We set them to NULL instead of
    # completely removing them so we don't mess up the loop indexing.
    # NULL elements are removed later on.
    if (!is.null(filter)) {
      is_to_filter <- do.call("filter", unname(out[[i]]))
      if (!is.logical(is_to_filter) || !length(is_to_filter) == 1) {
        stop("The filter function must return TRUE or FALSE", call. = FALSE)
      }
      if (is_to_filter) {
        out[i] <- list(NULL)
      }
    }
  }

  # Remove filtered elements
  out <- compact(out)

  # Transpose if long format is requested
  if (!wide) {
    out <- lapply(unzip(out), flatten)
  }

  out
}
