#' Recursively modify a list
#'
#' `modify_tree()` allows you to recursively modify a list, supplying functions
#' that either modify each leaf or each node (or both).
#'
#' @param x A list.
#' @param ... Reserved for future use. Must be empty
#' @param leaf A function applied to each leaf.
#' @param is_leaf A predicate function that determines whether an element is
#'   a leaf (by returning `FALSE`) or a node (by returning `FALSE`). The
#'   default value, `NULL`, treats bare lists as nodes and everything else
#'   (including data frames) as leaves.
#' @param pre,post Functions applied to each node. `pre` is applied on the
#'   way "down", i.e. before the leaves are transformed with `leaf`, while
#'   `post` is applied on the way "up", i.e. after the leaves are transformed.
#' @family modify variants
#' @export
#' @examples
#' x <- list(list(a = 2:1, c = list(b1 = 2), b = list(c2 = 3, c1 = 4)))
#' x |> str()
#'
#' # Transform each leaf
#' x |> modify_tree(leaf = \(x) x + 100) |>  str()
#'
#' # Recursively sort the nodes
#' sort_named <- function(x) {
#'   nms <- names(x)
#'   if (!is.null(nms)) {
#'     x[order(nms)]
#'   } else {
#'     x
#'    }
#' }
#' x |> modify_tree(post = sort_named) |> str()
modify_tree <- function(x,
                        ...,
                        leaf = identity,
                        is_leaf = NULL,
                        pre = identity,
                        post = identity) {
  check_dots_empty()
  leaf <- rlang::as_function(leaf)
  is_leaf <- as_is_leaf(is_leaf)
  post <- rlang::as_function(post)
  pre <- rlang::as_function(pre)

  worker <- function(x) {
    if (is_leaf(x)) {
      out <- leaf(x)
    } else {
      out <- pre(x)
      out <- modify(out, worker)
      out <- post(out)
    }
    out
  }

  worker(x)
}

as_is_leaf <- function(f, error_call = caller_env(), error_arg = caller_arg(f)) {
  if (is.null(f)) {
    function(x) {
      !vec_is_list(x)
    }
  } else {
    is_leaf_f <- rlang::as_function(f)
    as_predicate(
      is_leaf_f,
      .mapper = FALSE,
      .error_call = error_call,
      .error_arg = error_arg
    )
  }
}
