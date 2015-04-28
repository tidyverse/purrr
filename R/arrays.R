#' Coerce array to list
#'
#' \code{flatten_margin()} and \code{enlist_margin} enable arrays to
#' be used with purrr's functionals by turning them into list. The
#' coercion is controlled by the \code{margin} argument:
#' \code{flatten_margin()} creates a flat list along all dimensions
#' mentioned in \code{margin} and \code{enlist_margin()} creates an
#' hierarchical list with as many levels as dimensions specified in
#' \code{margin}.
#'
#' When no no margin is specified, all dimensions will be flattened or
#' enlisted by default. When \code{margin} is \code{0}, the array is
#' simply wrapped in a list.
#' @param array An array to coerce into a list.
#' @param margin A numeric vector indicating by position which indices
#'   will be flattened or enlisted. If \code{NULL}, a full margin is
#'   used.
#' @name array-coercion
#' @export
#' @examples
#' # We create an array with 3 dimensions
#' x <- array(1:12, c(2, 2, 3))
#'
#' # A full margin for such an array would be the vector 1:3. This is
#' # the default if you don't specify a margin
#'
#' # Flattening along the full margin is equivalent to as.list(array)
#' # and produces a list of size length(x):
#' flatten_margin(x) %>% str()
#'
#' # Flattening along the first dimension yields a list of length 2
#' # with each element containing a 2x3 arrays:
#' flatten_margin(x, 1) %>% str()
#'
#' # Flattening along the first and third dimensions yields a list of
#' # length 2x3 whose elements contain a vector of length 2:
#' flatten_margin(x, c(1, 3)) %>% str()
#'
#' # Enlisting the full margin creates a list of lists of lists:
#' enlist_margin(x) %>% str()
#'
#' # The ordering and the depth of the hierarchy is controlled by the
#' # margin argument:
#' enlist_margin(x, c(3, 1)) %>% str()
flatten_margin <- function(array, margin = NULL) {
    dim(array) <- dim(array) %||% length(array)
    margin <- margin %||% seq_along(dim(array))

  if (identical(margin, 0)) {
    list(array)
  } else {
    apply(array, margin, list) %>% flatten()
  }
}

#' @rdname array-coercion
#' @export
enlist_margin <- function(array, margin = NULL) {
  dim(array) <- dim(array) %||% length(array)
  margin <- margin %||% seq_along(dim(array))

  if (length(margin) > 1) {
    new_margin <- ifelse(margin[-1] > margin[[1]], margin[-1] - 1, margin[-1])
    apply(array, margin[[1]], . %>% enlist_margin(new_margin))
  } else {
    flatten_margin(array, margin)
  }
}
