#' Coerce array to list
#'
#' \code{array_branch()} and \code{array_tree()} enable arrays to be
#' used with purrr's functionals by turning them into lists. The
#' details of the coercion are controlled by the \code{margin}
#' argument. \code{array_tree()} creates an hierarchical list (a tree)
#' that has as many levels as dimensions specified in \code{margin},
#' while \code{array_branch()} creates a flat list (by analogy, a
#' branch) along all mentioned dimensions.
#'
#' When no margin is specified, all dimensions are used by
#' default. When \code{margin} is a numeric vector of length zero, the
#' whole array is wrapped in a list.
#' @param array An array to coerce into a list.
#' @param margin A numeric vector indicating the positions of the
#'   indices to be to be enlisted. If \code{NULL}, a full margin is
#'   used. If \code{numeric(0)}, the array as a whole is wrapped in a
#'   list.
#' @name array-coercion
#' @export
#' @examples
#' # We create an array with 3 dimensions
#' x <- array(1:12, c(2, 2, 3))
#'
#' # A full margin for such an array would be the vector 1:3. This is
#' # the default if you don't specify a margin
#'
#' # Creating a branch along the full margin is equivalent to
#' # as.list(array) and produces a list of size length(x):
#' array_branch(x) %>% str()
#'
#' # A branch along the first dimension yields a list of length 2
#' # with each element containing a 2x3 array:
#' array_branch(x, 1) %>% str()
#'
#' # A branch along the first and third dimensions yields a list of
#' # length 2x3 whose elements contain a vector of length 2:
#' array_branch(x, c(1, 3)) %>% str()
#'
#' # Creating a tree from the full margin creates a list of lists of
#' # lists:
#' array_tree(x) %>% str()
#'
#' # The ordering and the depth of the tree are controlled by the
#' # margin argument:
#' array_tree(x, c(3, 1)) %>% str()
array_branch <- function(array, margin = NULL) {
    dim(array) <- dim(array) %||% length(array)
    margin <- margin %||% seq_along(dim(array))

  if (length(margin) == 0) {
    list(array)
  } else {
    apply(array, margin, list) %>% flatten()
  }
}

#' @rdname array-coercion
#' @export
array_tree <- function(array, margin = NULL) {
  dim(array) <- dim(array) %||% length(array)
  margin <- margin %||% seq_along(dim(array))

  if (length(margin) > 1) {
    new_margin <- ifelse(margin[-1] > margin[[1]], margin[-1] - 1, margin[-1])
    apply(array, margin[[1]], . %>% array_tree(new_margin))
  } else {
    array_branch(array, margin)
  }
}
