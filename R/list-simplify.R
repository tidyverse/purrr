list_simplify <- function(x, simplify = NA, ptype = NULL, error_arg = "`x`", error_call = caller_env()) {
  vec_check_list(x)

  if (length(simplify) > 1 || !is.logical(simplify)) {
    abort("`simplify` must be `TRUE`, `FALSE`, or `NA`")
  }
  if (!is.null(ptype) && isFALSE(simplify)) {
    abort("Must not specify `ptype` when `simplify = FALSE`")
  }

  # Ensures result is a list
  if (isFALSE(simplify)) {
    return(x)
  }
  strict <- !is.na(simplify)

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
        "Failed to simplify {error_arg}: not all elements vectors of length 1.",
        call = error_call
      )
    } else {
      x
    }
  }
}
