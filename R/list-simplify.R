#' Simplify a list to an atomic or S3 vector
#'
#' Simplification maintains a one-to-one correspondence between the input
#' and output, implying that each element of `x` must contain a vector of
#' length 1. If you don't want to maintain this correspondence, then you
#' probably want either [list_c()] or [list_flatten()].
#'
#' @param x A list.
#' @param strict What should happen if simplification fails? If `TRUE`,
#'   it will error. If `FALSE` and `ptype` is not supplied, it will return `x`
#'   unchanged.
#' @param ptype An optional prototype to ensure that the output type is always
#'   the same.
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
list_simplify <- function(x, strict = TRUE, ptype = NULL) {
  if (!is_bool(strict)) {
    cli::cli_abort(
      "{.arg strict} must be `TRUE` or `FALSE`, not {.obj_type_friendly {strict}}.",
      arg = "strict"
    )
  }

  simplify_impl(x, strict = strict, ptype = ptype)
}

# Wrapper used by purrr functions that do automatic simplification
list_simplify_internal <- function(x,
                                   simplify = NA,
                                   ptype = NULL,
                                   error_arg = caller_arg(x),
                                   error_call = caller_env()) {
  if (length(simplify) > 1 || !is.logical(simplify)) {
    cli::cli_abort(
      "{.arg simplify} must be `TRUE`, `FALSE`, or `NA`.",
      arg = "simplify",
      call = error_call
    )
  }
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

simplify_impl <- function(x,
                          strict = TRUE,
                          ptype = NULL,
                          error_arg = caller_arg(x),
                          error_call = caller_env()) {
  vec_check_list(x, arg = error_arg, call = error_call)

  if (strict) {
    list_check_all_vectors(x, arg = error_arg, call = error_call)
    can_simplify <- all(list_sizes(x) == 1L)
  } else {
    can_simplify <- list_all_vectors(x) && all(list_sizes(x) == 1L)
  }

  if (can_simplify) {

    # TODO: use `error_call` when available
    tryCatch(
      {
        names <- vec_names(x)
        x <- vec_set_names(x, NULL)
        out <- list_unchop(x, ptype = ptype)
        vec_set_names(out, names)
      },
      vctrs_error_incompatible_type = function(err) {
        if (strict || !is.null(ptype)) {
          cnd_signal(err)
        } else {
          x
        }
      }
    )
  } else {
    if (strict) {
      bad <- detect_index(x, function(x) vec_size(x) != 1)
      cli::cli_abort(
        c(
          "All elements must be length 1.",
          i = "`{error_arg}[[{bad}]]` is length {vec_size(x[[bad]])}."
        ),
        call = error_call
      )
    } else {
      x
    }
  }
}
