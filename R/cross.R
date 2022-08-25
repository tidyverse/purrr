#' Produce all combinations of list elements
#'
#' @description
#' `r lifecycle::badge("soft-deprecated")`
#'
#' These functions have been deprecated in purrr 0.4.0 because they
#' are slow and buggy, and we no longer think they are the right
#' approach to solving this problem. Please use `tidyr::expand_grid()`
#' instead.
#'
#' Here is an example of equivalent usages for `cross()` and
#' `expand_grid()`:
#'
#' ```{r}
#' data <- list(
#'   id = c("John", "Jane"),
#'   greeting = c("Hello.", "Bonjour."),
#'   sep = c("! ", "... ")
#' )
#'
#' # With deprecated `cross()`
#' data %>% cross() %>% map_chr(lift(paste))
#'
#' # With `expand_grid()`
#' tidyr::expand_grid(!!!data) %>% pmap_chr(paste)
#' ```
#'
#' @details
#' `cross2()` returns the product set of the elements of
#' `.x` and `.y`. `cross3()` takes an additional
#' `.z` argument. `cross()` takes a list `.l` and
#' returns the cartesian product of all its elements in a list, with
#' one combination by element. `cross_df()` is like
#' `cross()` but returns a data frame, with one combination by
#' row.
#'
#' `cross()`, `cross2()` and `cross3()` return the
#' cartesian product is returned in wide format. This makes it more
#' amenable to mapping operations. `cross_df()` returns the output
#' in long format just as `expand.grid()` does. This is adapted
#' to rowwise operations.
#'
#' When the number of combinations is large and the individual
#' elements are heavy memory-wise, it is often useful to filter
#' unwanted combinations on the fly with `.filter`. It must be
#' a predicate function that takes the same number of arguments as the
#' number of crossed objects (2 for `cross2()`, 3 for
#' `cross3()`, `length(.l)` for `cross()`) and
#' returns `TRUE` or `FALSE`. The combinations where the
#' predicate function returns `TRUE` will be removed from the
#' result.
#' @seealso [expand.grid()]
#' @param .x,.y,.z Lists or atomic vectors.
#' @param .l A list of lists or atomic vectors. Alternatively, a data
#'   frame. `cross_df()` requires all elements to be named.
#' @param .filter A predicate function that takes the same number of
#'   arguments as the number of variables to be combined.
#' @return `cross2()`, `cross3()` and `cross()`
#'   always return a list. `cross_df()` always returns a data
#'   frame. `cross()` returns a list where each element is one
#'   combination so that the list can be directly mapped
#'   over. `cross_df()` returns a data frame where each row is one
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
#'   cross() %>%
#'   map(lift(paste))
#'
#' # cross() returns the combinations in long format: many elements,
#' # each representing one combination. With cross_df() we'll get a
#' # data frame in long format: crossing three objects produces a data
#' # frame of three columns with each row being a particular
#' # combination. This is the same format that expand.grid() returns.
#' args <- data %>% cross_df()
#'
#' # In case you need a list in long format (and not a data frame)
#' # just run as.list() after cross_df()
#' args %>% as.list()
#'
#' # This format is often less practical for functional programming
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
#'   cross(.filter = `==`)
cross <- function(.l, .filter = NULL) {
  lifecycle::deprecate_soft(
    "0.4.0",
    "purrr::cross()",
    "tidyr::expand_grid()",
    details = c(i = "See <https://github.com/tidyverse/purrr/issues/768>.")
  )

  if (is_empty(.l)) {
    return(.l)
  }

  if (!is.null(.filter)) {
    .filter <- as_mapper(.filter)
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
      if (!is_bool(is_to_filter)) {
        abort(sprintf(
          "The filter function must return a single logical `TRUE` or `FALSE`, not %s",
          as_predicate_friendly_type_of(is_to_filter)
        ))
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
#' @rdname cross
cross2 <- function(.x, .y, .filter = NULL) {
  lifecycle::deprecate_soft(
    "0.4.0",
    "purrr::cross2()",
    "tidyr::expand_grid()",
    details = c(i = "See <https://github.com/tidyverse/purrr/issues/768>.")
  )
  cross(list(.x, .y), .filter = .filter)
}

#' @export
#' @rdname cross
cross3 <- function(.x, .y, .z, .filter = NULL) {
  lifecycle::deprecate_soft(
    "0.4.0",
    "purrr::cross3()",
    "tidyr::expand_grid()",
    details = c(i = "See <https://github.com/tidyverse/purrr/issues/768>.")
  )
  cross(list(.x, .y, .z), .filter = .filter)
}

#' @rdname cross
#' @export
cross_df <- function(.l, .filter = NULL) {
  lifecycle::deprecate_soft(
    "0.4.0",
    "purrr::cross_df()",
    "tidyr::expand_grid()",
    details = c(i = "See <https://github.com/tidyverse/purrr/issues/768>.")
  )
  check_installed("tibble")
  cross(.l, .filter = .filter) %>%
    transpose() %>%
    simplify_all() %>%
    tibble::as_tibble()
}

#' @export
#' @usage NULL
#' @rdname cross
cross_n <- function(...) {
  lifecycle::deprecate_stop("0.2.3", "purrr::cross_n()")
  cross(...)
}

#' @export
#' @usage NULL
#' @rdname cross
cross_d <- function(...) {
  lifecycle::deprecate_stop("0.2.3", "purrr::cross_d()")
  cross_df(...)
}
