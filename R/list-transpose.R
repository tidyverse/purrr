#' Transpose a list
#'
#' @description
#' `list_transpose()` turns a list-of-lists "inside-out"; it turns a pair of
#' lists into a list of pairs, or a list of pairs into pair of lists. For
#' example, if you had a list of length `n` where each component had values `a`
#' and `b`, `list_transpose()` would make a list with elements `a` and
#' `b` that contained lists of length n.
#'
#' It's called transpose because `x[["a"]][["b"]]` is equivalent to
#' `transpose(x)[["b"]][["a"]]`, i.e. transposing a list flips the order of
#' indices in a similar way to transposing a matrix.
#'
#' @param x A list of vectors to transpose.
#' @param template A "template" that specifies the names of output list.
#'   Usually taken from the name of the first element of `x`.
#' @param simplify Should the result be simplified?
#'   * `TRUE`: simplify or die trying.
#'   * `NA`: simplify if possible.
#'   * `FALSE`: never try to simplify, always leaving as a list.
#'
#'   Alternatively, a named list specifying the simplification by output column.
#' @param ptype An optional vector prototype used to control the simplification.
#'   Alternatively, a named list specifying the prototype by output column.
#' @param default A default value to use if a value is absent of `NULL`.
#'   Alternatively, a named list specifying the prototype by output column.
#' @export
#' @examples
#' # list_transpose() is useful in conjunction with safely()
#' x <- list("a", 1, 2)
#' y <- x %>% map(safely(log))
#' y %>% str()
#' # Put all the errors and results together
#' y %>% list_transpose() %>% str()
#' # Supply a default result to further simplify
#' y %>% list_transpose(default = list(result = NA)) %>% str()
#'
#' # list_transpose() will try to simplify by default:
#' x <- list(list(a = 1, b = 2), list(a = 3, b = 4), list(a = 5, b = 6))
#' x %>% list_transpose()
#' # use simplify = FALSE to always return lists:
#' x %>% list_transpose(simplify = FALSE) %>% str()
#'
#' # Provide explicit template if you know which elements you want to extract
#' ll <- list(
#'   list(x = 1, y = "one"),
#'   list(z = "deux", x = 2)
#' )
#' ll %>% list_transpose()
#' ll %>% list_transpose(template = c("x", "y", "z"))
#'
#' # And specify default if you want to simplify
#' ll %>% list_transpose(c("x", "y", "z"), default = NA)
list_transpose <- function(x, template = NULL, simplify = NA, ptype = NULL, default = NULL) {
  vec_check_list(x)
  if (length(x) == 0) {
    return(list())
  }

  template <- template %||%
    names(x[[1]]) %||%
    cli::cli_abort("First element of {.arg x} is unnamed, please supply {.arg template}.")
  if (!is.character(template)) {
    cli::cli_abort("{.arg template} must be a character vector.")
  }

  simplify <- match_template(simplify, template)
  default <- match_template(default, template)
  ptype <- match_template(ptype, template)

  out <- rep_named(template, list())
  for (nm in template) {
    res <- map(x, nm, .default = default[[nm]])
    res <- list_simplify(res,
      simplify = simplify[[nm]] %||% NA,
      ptype = ptype[[nm]],
      error_arg = paste0("output `", nm, "`")
    )
    out[[nm]] <- res
  }

  out
}

match_template <- function(x, template, error_arg = caller_arg(x), error_call = caller_env()) {
  if (is_bare_list(x) && is_named(x)) {
    extra_names <- setdiff(names(x), template)
    if (length(extra_names)) {
      cli::cli_abort(
        "{.arg {error_arg}} contains unknown names: {.str {extra_names}}",
        call = error_call
      )
    }
    x
  } else {
    rep_named(template, list(x))
  }
}
