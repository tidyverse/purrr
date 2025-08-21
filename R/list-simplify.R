#' Simplify a list to an atomic or S3 vector
#'
#' Simplification maintains a one-to-one correspondence between the input
#' and output, implying that each element of `x` must contain a one element
#' vector or a one-row data frame. If you don't want to maintain this
#' correspondence, then you probably want either [list_c()]/[list_rbind()] or
#' [list_flatten()].
#'
#' @param x A list.
#' @param strict What should happen if simplification fails? If `TRUE`
#'   (the default) it will error. If `FALSE` and `ptype` is not supplied,
#'   it will return `x` unchanged.
#' @param ptype An optional prototype to ensure that the output type is always
#'   the same.
#' @inheritParams rlang::args_dots_empty
#' @returns A vector the same length as `x`.
#' @export
#' @examples
#' list_simplify(list(1, 2, 3))
#'
#' # Only works when vectors are length one and have compatible types:
#' try(list_simplify(list(1, 2, 1:3)))
#' try(list_simplify(list(1, 2, "x")))
#'
#' # Unless you strict = FALSE, in which case you get the input back:
#' list_simplify(list(1, 2, 1:3), strict = FALSE)
#' list_simplify(list(1, 2, "x"), strict = FALSE)
list_simplify <- function(x, ..., strict = TRUE, ptype = NULL) {
  check_dots_empty()
  check_bool(strict)

  simplify_impl(x, strict = strict, ptype = ptype)
}

# Wrapper used by purrr functions that do automatic simplification
list_simplify_internal <- function(
  x,
  simplify = NA,
  ptype = NULL,
  error_arg = caller_arg(x),
  error_call = caller_env()
) {
  check_bool(simplify, allow_na = TRUE, call = error_call)
  if (!is.null(ptype) && isFALSE(simplify)) {
    cli::cli_abort(
      "Can't specify {.arg ptype} when `simplify = FALSE`.",
      arg = "ptype",
      call = error_call
    )
  }

  if (isFALSE(simplify)) {
    return(x)
  }

  simplify_impl(
    x,
    strict = !is.na(simplify),
    ptype = ptype,
    error_arg = error_arg,
    error_call = error_call
  )
}

simplify_impl <- function(
  x,
  strict = TRUE,
  ptype = NULL,
  error_arg = caller_arg(x),
  error_call = caller_env()
) {
  obj_check_list(x, arg = error_arg, call = error_call)

  # Handle the cases where we definitely can't simplify
  if (strict) {
    list_check_all_vectors(x, arg = error_arg, call = error_call)
    list_check_all_size(x, 1, arg = error_arg, call = error_call)
  } else {
    can_simplify <- list_all_vectors(x) && all(list_sizes(x) == 1L)

    if (!can_simplify) {
      return(x)
    }
  }

  names <- vec_names(x)
  x <- vec_set_names(x, NULL)

  out <- tryCatch(
    list_unchop(
      x,
      ptype = ptype,
      error_arg = error_arg,
      error_call = error_call
    ),
    vctrs_error_incompatible_type = function(err) {
      if (strict || !is.null(ptype)) {
        cnd_signal(err)
      } else {
        x
      }
    }
  )
  vec_set_names(out, names)
}
