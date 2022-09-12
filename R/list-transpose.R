#' Transpose a list
#'
#' @description
#' `list_transpose()` turns a list-of-lists "inside-out". For instance it turns a pair of
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
#' @param simplify Should the result be [simplified][list_simplify]?
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
#' # this makes list_tranpose() not completely symmetric
#' x %>% list_transpose() %>% list_transpose()
#'
#' # use simplify = FALSE to always return lists:
#' x %>% list_transpose(simplify = FALSE) %>% str()
#' x %>%
#'   list_transpose(simplify = FALSE) %>%
#'   list_transpose(simplify = FALSE) %>% str()
#'
#' # Provide explicit template if you know which elements you want to extract
#' ll <- list(
#'   list(x = 1, y = "one"),
#'   list(z = "deux", x = 2)
#' )
#' ll %>% list_transpose()
#' ll %>% list_transpose(template = c("x", "y", "z"))
#' ll %>% list_transpose(template = 1)
#'
#' # And specify default if you want to simplify
#' ll %>% list_transpose(c("x", "y", "z"), default = NA)
list_transpose <- function(x, template = NULL, simplify = NA, ptype = NULL, default = NULL) {
  vec_check_list(x)
  if (length(x) == 0) {
    return(list())
  }

  template <- template %||% vec_index(x[[1]])
  if (!is.character(template) && !is.numeric(template)) {
    cli::cli_abort(
      "{.arg template} must be a character or numeric vector, not {.obj_type_friendly {template}}.",
      arg = template
    )
  }

  simplify <- match_template(simplify, template)
  default <- match_template(default, template)
  ptype <- match_template(ptype, template)

  out <- rep_along(template, list())
  if (is.character(template)) {
    names(out) <- template
  }

  for (i in seq_along(template)) {
    idx <- template[[i]]
    res <- map(x, idx, .default = default[[i]])
    res <- list_simplify_internal(res,
      simplify = simplify[[i]] %||% NA,
      ptype = ptype[[i]]
    )
    out[[i]] <- res
  }

  out
}

match_template <- function(x, template, error_arg = caller_arg(x), error_call = caller_env()) {
  if (is.character(template)) {
    if (is_bare_list(x) && is_named(x)) {
      extra_names <- setdiff(names(x), template)
      if (length(extra_names)) {
        cli::cli_abort(
          "{.arg {error_arg}} contains unknown names: {.str {extra_names}}",
          arg = error_arg,
          call = error_call
        )
      }

      out <- rep_named(template, list(NULL))
      out[names(x)] <- x
      out
    } else {
      rep_named(template, list(x))
    }
  } else if (is.numeric(template)) {
    if (is_bare_list(x) && length(x) > 0) {
      if (length(x) != length(template)) {
        cli::cli_abort("List {.arg {error_arg}} must be same length as numeric template")
      }
      x
    } else {
      rep_along(template, list(x))
    }
  } else {
    abort("Invalid x", .internal = TRUE)
  }
}
