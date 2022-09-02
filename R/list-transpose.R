#' @examples
#' # list_tranpose() is useful in conjunction with safely()
#' x <- list("a", 1, 2)
#' y <- x %>% map(safely(log))
#' y %>% str()
#' y %>% list_transpose() %>% str()
#' y %>% list_transpose(default = list(result = NA)) %>% str()
#'
#' # list_tranpose() will try to simplify by default:
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
#'
#' # And specify default if you want to simplify
#' ll %>% list_transpose(c("x", "y", "z"), default = NA)
list_transpose <- function(x, template = NULL, simplify = NA, ptype = NULL, default = NULL) {
  vec_assert(x, list())
  if (length(x) == 0) {
    return(list())
  }

  template <- template %||%
    names(x[[1]]) %||%
    cli::cli_abort("First element of {.arg x} is unnamed, please supply `template.")
  if (!is.character(template)) {
    cli::cli_abort("{.arg template} must be a character vector")
  }

  simplify <- match_template(simplify, template)
  default <- match_template(default, template)
  ptype <- match_template(ptype, template)

  out <- rep_named(template, list())
  for (nm in template) {
    res <- map(x, nm, .default = default[[nm]])
    res <- list_simplify(res, simplify = simplify[[nm]], ptype = ptype[[nm]])
    out[[nm]] <- res
  }

  out
}

match_template <- function(x, template, error_arg = caller_arg(x), error_call = caller_env()) {
  if (is_bare_list(x) && is_named(x)) {
    extra_names <- setdiff(names(x), template)
    if (length(extra_names)) {
      cli::cli_abort(
        "{.arg {error_arg}} contains unknown names: {.str extra_names}",
        call = error_call
      )
    }
    x
  } else {
    rep_named(template, list(x))
  }
}
