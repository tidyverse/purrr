#' Simplify a list to an atomic or S3 vector
#'
#' @details
#' Simplification maintains a one-to-one correspondence between the input
#' and output, implying that each element of `x` must contain a vector of
#' length 1. If you don't want to maintain this correspondence, then you
#' probably want either [list_c()] or [list_flatten()].
#'
#' @param x A list.
#' @param strict What should happen if simplification fails? If `TRUE`,
#'   will error. If `FALSE`, will return `x` unchanged.
#' @param ptype An optional prototype to ensure that the output type is always
#'   the same.
#' @returns A vector the same length as `x`.
#' @export
#' @examples
#' list_simplify(list(1, 2, 3))
#'
#' try(list_simplify(list(1, 2, "x")))
#' try(list_simplify(list(1, 2, 1:3)))
list_simplify <- function(x, strict = TRUE, ptype = NULL) {
  simplify_impl(x, strict = strict, ptype = ptype)
}

# Wrapper used by purrr functions that do automatic simplification
list_simplify_internal <- function(
    x,
    simplify = NA,
    ptype = NULL,
    error_arg = "x",
    error_call = caller_env()
  ) {
  if (length(simplify) > 1 || !is.logical(simplify)) {
    cli::cli_abort("{.arg simplify} must be `TRUE`, `FALSE`, or `NA`.", arg = "simplify")
  }
  if (!is.null(ptype) && isFALSE(simplify)) {
    cli::cli_abort("Must not specify {.arg ptype} when `simplify = FALSE`.")
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
    error_arg = "`x`",
    error_call = caller_env()
  ) {
  vec_check_list(x, arg = error_arg, call = error_call)

  can_simplify <- every(x, vec_is, size = 1)

  if (can_simplify) {
    tryCatch(
      vec_unchop(x, ptype = ptype),
      vctrs_error_incompatible_type = function(err) {
        if (strict || !is.null(ptype)) {
          cli::cli_abort(
            "Failed to simplify {error_arg}.",
            parent = err,
            call = error_call
          )
        } else {
          x
        }
      }
    )
  } else {
    if (strict) {
      cli::cli_abort(
        "Can't simplify {.arg {error_arg}} because all elements vectors must be length 1.",
        call = error_call
      )
    } else {
      x
    }
  }
}
