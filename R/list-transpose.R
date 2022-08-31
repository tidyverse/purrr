#' @examples
#' # transpose() is useful in conjunction with safely() & quietly()
#' x <- list("a", 1, 2)
#' y <- x %>% map(safely(log))
#' y %>% str()
#' y %>% list_transpose() %>% str()
#' y %>% list_transpose(default = list(result = NA)) %>% str()
#'
#' # list_tranpose() will simplify by default:
#' x <- list(list(a = 1, b = 2), list(a = 3, b = 4), list(a = 5, b = 6))
#' x %>% list_transpose()
#' # use simplify = FALSE to always return lists:
#' x %>% list_transpose(simplify = FALSE) |> str()
#'
#' # Provide explicit component names to prevent loss of those that don't
#' # appear in first component
#' ll <- list(
#'   list(x = 1, y = "one"),
#'   list(z = "deux", x = 2)
#' )
#' ll %>% list_transpose()
#' ll %>% list_transpose(c("x", "y", "z"))
#' ll %>% list_transpose(c("x", "y", "z"), default = NA)
list_transpose <- function(x, template = vec_index(x[[1]]), simplify = TRUE, ptype = NULL, default = NULL) {
  vec_assert(x, list())
  if (length(x) == 0) {
    return(list())
  }

  # TODO: name these appropriate
  if (is_bool(simplify)) {
    simplify <- rep(list(simplify), length(template))
  }
  if (!(has_names(default) && is.list(default))) {
    default <- rep(list(default), length(template))
  }
  if (!(has_names(ptype) && is.list(ptype))) {
    ptype <- rep(list(ptype), length(template))
  }

  out <- vector("list", length(template))
  if (is.character(template)) {
    names(out) <- template
  }

  for (i in seq_along(template)) {
    res <- map(x, template[[i]], .default = default[[i]])
    if (simplify[[i]]) {
      res <- list_simplify(res, ptype[[i]])
    }
    out[[i]] <- res
  }

  out
}

