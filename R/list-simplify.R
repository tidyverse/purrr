list_simplify <- function(x, simplify = NA, ptype = NULL) {
  vec_assert(x, list())
  if (length(simplify) > 1 || !is.logical(simplify)) {
    abort("`simplify` must be `TRUE`, `FALSE`, or `NA`")
  }
  if (!is.null(ptype) && isFALSE(simplify)) {
    abort("Must not specify `ptype` when `simplify = FALSE`")
  }

  if (isFALSE(simplify)) {
    return(x)
  }
  strict <- !is.na(simplify)

  # We choose not to simply data frames to preserve length invariants
  can_simplify <- every(x, ~ vec_is(.x, size = 1) && !is.data.frame(.x))

  if (can_simplify) {
    if (!is.null(ptype)) {
      vec_unchop(x, ptype = ptype)
    } else {
      tryCatch(
        vec_unchop(x),
        vctrs_error_incompatible_type = function(err) {
          if (strict) {
            abort("Failed to simplify", parent = err)
          } else {
            x
          }
        }
      )
    }
  } else {
    if (strict) {
      abort("Failed to simplify: not all elements vectors of length 1")
    } else {
      x
    }
  }
}
