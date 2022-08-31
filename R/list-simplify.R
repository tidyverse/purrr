# Internal helper used by list_transform() and accumulate()
# when simplify = TRUE (the default)
list_simplify <- function(x, ptype = NULL, strict = FALSE) {
  vec_assert(x, list())

  # We choose not to simply data frames to keep length invariants
  can_simplify <- every(x, ~ vec_is(.x, size = 1) && !is.data.frame(.x))

  if (can_simplify) {
    if (!is.null(ptype)) {
      vec_c(!!!x, .ptype = ptype)
    } else {
      tryCatch(
        vec_c(!!!x),
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
      abort("Failed to simplify: not all elements vectors of  length 1")
    } else {
      x
    }
  }
}


check_ptype_simplify <- function(ptype = NULL, simplify = TRUE) {
  rlang:::check_bool(simplify)

  if (!is.null(ptype) && !simplify) {
    abort("Must not specific `ptype` when `simplify = FALSE`")
  }
}
