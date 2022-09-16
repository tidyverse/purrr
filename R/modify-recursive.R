#' Recursively modify a list
#'
#' `rmodify()` allows you to recursively modify a list, supplying functions
#' that either modify each leaf or each node (or both).
#'
#' @param x A list.
#' @param f_leaf A function applied to each leaf.
#' @param p_leaf A predicate function that returns `TRUE` when an element is
#'   a leaf, determining whether `f_leaf` or `f_pre`/`f_post` is applied to
#'   it. The default value, `NULL`, treats lists as nodes and everything else
#'   as leaves.
#' @param f_pre,f_post Functions applied to each node. `f_pre` is applied
#'   the tree is traversed "down", i.e. before the leaves are transformed
#'   with `f_leaf`, while `f_post` is applied on the way "up", i.e.
#'   after the leaves are transformed.
#' @family map variants
#' @export
#' @examples
#' x <- list(list(a = 2:1, c = list(b1 = 2), b = list(c2 = 3, c1 = 4)))
#' x |> str()
#'
#' # Transform each leaf
#' x |> rmodify(f_leaf = \(x) x + 100) |>  str()
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
#' x |> rmodify(f_post = sort_named) |> str()
rmodify <- function(x,
                    f_leaf = identity,
                    p_leaf = NULL,
                    f_pre = identity,
                    f_post = identity) {
  if (!is_vector(x)) {
    cli::cli_abort("{.arg x} must be a vector, not {.obj_type_friendly {x}}.")
  }

  f_post <- rlang::as_function(f_post)
  f_pre <- rlang::as_function(f_pre)
  f_leaf <- rlang::as_function(f_leaf)
  if (is.null(p_leaf)) {
    is_leaf <- function(x) {
      !is.list(x)
    }
  } else {
    p_leaf <- rlang::as_function(p_leaf)
    is_leaf <- as_predicate(p_leaf, .mapper = FALSE)
  }

  worker <- function(x) {
    if (is_leaf(x)) {
      out <- f_leaf(x)
    } else {
      out <- f_pre(x)
      out <- modify(out, worker)
      out <- f_post(out)
    }
    out
  }

  worker(x)
}
