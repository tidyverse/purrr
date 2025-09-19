#' Split a list or vector into chunks
#'
#' `list_split()` splits a list or vector into smaller chunks, providing
#' a conceptual inverse to [list_flatten()]. You can split by chunk size
#' or by providing a grouping vector.
#'
#' @param x A list or vector.
#' @param n An integer specifying the size of each chunk. If the length
#'   of `x` is not evenly divisible by `n`, the last chunk will be smaller.
#' @param groups A vector the same length as `x` that defines how to
#'   group elements. Elements with the same group value will be placed
#'   in the same chunk.
#' @param is_node A predicate function that determines whether an object
#'   is a "node" (by default, a list). See [modify_tree()] for more details.
#' @inheritParams rlang::args_dots_empty
#' @return A list where each element contains a chunk of the original input.
#' @export
#' @examples
#' # Split by chunk size
#' list_split(1:10, n = 3)
#'
#' # Split by grouping vector
#' list_split(letters[1:6], groups = c(1, 1, 2, 2, 3, 3))
#'
#' # Split a list
#' x <- list(a = 1, b = 2, c = 3, d = 4)
#' list_split(x, n = 2)
list_split <- function(x, ..., n = NULL, groups = NULL, is_node = NULL) {
  is_node <- as_is_node(is_node)
  if (!is_node(x) && !is.atomic(x) && !is.data.frame(x)) {
    cli::cli_abort(
      "{.arg x} must be a list, vector, or other node-like object."
    )
  }

  check_dots_empty()

  # validate exactly one of n or groups is provided
  if (is.null(n) && is.null(groups)) {
    cli::cli_abort("Must provide either {.arg n} or {.arg groups}.")
  }

  if (!is.null(n) && !is.null(groups)) {
    cli::cli_abort("Can't provide both {.arg n} and {.arg groups}.")
  }

  # validate inputs
  if (!is.null(n)) {
    if (!is.numeric(n) || length(n) != 1 || is.na(n) || n <= 0 || n != floor(n)) {
      cli::cli_abort("{.arg n} must be a positive integer.")
    }
    n <- as.integer(n)
  }

  if (!is.null(groups)) {
    if (length(groups) != length(x)) {
      cli::cli_abort(
        "{.arg groups} must have the same length as {.arg x} ({length(x)}).",
        "i" = "{.arg groups} has length {length(groups)}."
      )
    }
  }

  # generate indices for splitting
  indices <- generate_split_indices(x, n, groups)

  # use vec_chop for splitting
  result <- vec_chop(x, indices = indices)

  # preserve names from groups if they exist
  if (!is.null(groups) && !is.null(names(indices))) {
    names(result) <- names(indices)
  }

  result
}

generate_split_indices <- function(x, n = NULL, groups = NULL) {
  if (!is.null(n)) {
    # split by chunk size
    len <- length(x)
    if (len == 0) {
      return(list())
    }

    chunk_ids <- ceiling(seq_len(len) / n)
    split(seq_len(len), chunk_ids)
  } else {
    # split by groups
    if (length(x) == 0) {
      return(list())
    }

    split(seq_along(x), groups)
  }
}
