#' Produce all combinations of list elements
#'
#' \code{cross2()} returns the product set of the elements of
#' \code{.x} and \code{.y}. \code{cross3()} takes an additional
#' \code{.z} argument. \code{cross_n()} takes a list \code{.l} and
#' returns the cartesian product of all its elements in a list, with
#' one combination by element. \code{cross_d()} is like
#' \code{cross_n()} but returns a data frame, with one combination by
#' row.
#'
#' \code{cross_n()}, \code{cross2()} and \code{cross3()} return the
#' cartesian product is returned in wide format. This makes it more
#' amenable to mapping operations. \code{cross_d()} returns the output
#' in long format just as \code{expand.grid()} does. This is adapted
#' to rowwise operations.
#'
#' When the number of combinations is large and the individual
#' elements are heavy memory-wise, it is often useful to filter
#' unwanted combinations on the fly with \code{.filter}. It must be
#' a predicate function that takes the same number of arguments as the
#' number of crossed objects (2 for \code{cross2()}, 3 for
#' \code{cross3()}, \code{length(.l)} for \code{cross_n()}) and
#' returns \code{TRUE} or \code{FALSE}. The combinations where the
#' predicate function returns \code{TRUE} will be removed from the
#' result.
#' @seealso \code{\link{expand.grid}()}
#' @param .x,.y,.z Lists or atomic vectors.
#' @param .l A list of lists or atomic vectors. Alternatively, a data
#'   frame. \code{cross_d()} requires all elements to be named.
#' @param .filter A predicate function that takes the same number of
#'   arguments as the number of variables to be combined.
#' @return \code{cross2()}, \code{cross3()} and \code{cross_n()}
#'   always return a list. \code{cross_d()} always returns a data
#'   frame. \code{cross_n()} returns a list where each element is one
#'   combination so that the list can be directly mapped
#'   over. \code{cross_d()} returns a data frame where each row is one
#'   combination.
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
#'   map(lift(paste))
#'
#' # cross_n() returns the combinations in long format: many elements,
#' # each representing one combination. With cross_d() we'll get a
#' # data frame in long format: crossing three objects produces a data
#' # frame of three columns with each row being a particular
#' # combination. This is the same format that expand.grid() returns.
#' args <- data %>% cross_d()
#'
#' # In case you need a list in long format (and not a data frame)
#' # just run as.list() after cross_d()
#' args %>% as.list()
#'
#' # This format is often less pratical for functional programming
#' # because applying a function to the combinations requires a loop
#' out <- vector("list", length = nrow(args))
#' for (i in seq_along(out))
#'   out[[i]] <- map(args, i) %>% invoke(paste, .)
#' out
#'
#' # It's easier to transpose and then use invoke_map()
#' args %>% transpose() %>% map_chr(~ invoke(paste, .))
#'
#' # Unwanted combinations can be filtered out with a predicate function
#' filter <- function(x, y) x >= y
#' cross2(1:5, 1:5, .filter = filter) %>% str()
#'
#' # To give names to the components of the combinations, we map
#' # setNames() on the product:
#' seq_len(3) %>%
#'   cross2(., ., .filter = `==`) %>%
#'   map(setNames, c("x", "y"))
#'
#' # Alternatively we can encapsulate the arguments in a named list
#' # before crossing to get named components:
#' seq_len(3) %>%
#'   list(x = ., y = .) %>%
#'   cross_n(.filter = `==`)
cross_n <- function(.l, .filter = NULL) {
  if (is_empty(.l)) {
    return(.l)
  }

  if (!is.null(.filter)) {
    .filter <- as_function(.filter)
  }

  n <- length(.l)
  lengths <- lapply(.l, length)
  names <- names(.l)

  factors <- cumprod(lengths)
  total_length <- factors[n]
  factors <- c(1, factors[-n])

  out <- replicate(total_length, vector("list", n), simplify = FALSE)

  for (i in seq_along(out)) {
    for (j in seq_len(n)) {
      index <- floor((i - 1) / factors[j]) %% length(.l[[j]]) + 1
      out[[i]][[j]] <- .l[[j]][[index]]
    }
    names(out[[i]]) <- names

    # Filter out unwanted elements. We set them to NULL instead of
    # completely removing them so we don't mess up the loop indexing.
    # NULL elements are removed later on.
    if (!is.null(.filter)) {
      is_to_filter <- do.call(".filter", unname(out[[i]]))
      if (!is.logical(is_to_filter) || !length(is_to_filter) == 1) {
        stop("The filter function must return TRUE or FALSE", call. = FALSE)
      }
      if (is_to_filter) {
        out[i] <- list(NULL)
      }
    }
  }

  # Remove filtered elements
  compact(out)
}

#' @export
#' @rdname cross_n
cross2 <- function(.x, .y, .filter = NULL) {
  cross_n(list(.x, .y), .filter = .filter)
}

#' @export
#' @rdname cross_n
cross3 <- function(.x, .y, .z, .filter = NULL) {
  cross_n(list(.x, .y, .z), .filter = .filter)
}

#' @rdname cross_n
#' @export
cross_d <- function(.l, .filter = NULL) {
  cross_n(.l, .filter = .filter) %>%
    transpose() %>%
    simplify_all() %>%
    dplyr::as_data_frame()
}
