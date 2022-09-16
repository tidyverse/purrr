#' Recursively modify a list
#'
#' `rmodify()` allows you to recursively modify a vector, supplying functions
#' to either modify each leaf or each node (or both).
#'
#' @param x A list.
#' @param f_leaf A function applied to each leaf.
#' @param f_pre A function applied to each node or leaf, before leaves are
#'   transformed.
#' @param f_post A function applied to each node or leaf, after leaves are
#'   transformed.
#' @param p_leaf A function that determines whether an element is a leaf or a
#'   node. The default value, `NULL`, will treats lists as nodes and everything
#'   else as leaves.
#' @export
#' @examples
#' x <- list(list(1, list(2), list(3)))
#' x %>% str()
#' x %>% rmodify(\(x) x + 1) %>% str()
rmodify <- function(x,
                    f_leaf = identity,
                    f_pre = identity,
                    f_post = identity,
                    p_leaf = NULL) {

  f_post <- rlang::as_function(f_post)
  f_pre <- rlang::as_function(f_pre)
  f_leaf <- rlang::as_function(f_leaf)
  if (is.null(p_leaf)) {
    p_leaf <- is_leaf
  } else {
    p_leaf <- as_predicate(p_leaf)
  }

  worker <- function(x) {
    out <- f_pre(x)
    if (p_leaf(out)) {
      out <- f_leaf(out)
    } else {
      out <- modify(out, worker)
    }
    out <- f_post(out)
    out
  }

  out <- f_pre(x)
  out <- modify(out, worker)
  out <- f_post(out)
  out
}

is_leaf <- function(x) {
  !is.list(x)
}
