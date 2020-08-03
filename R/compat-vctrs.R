
# https://github.com/r-lib/vctrs/issues/183
vec_simplify <- function(x,
                         name_spec = NULL,
                         name_repair = c("minimal", "unique", "check_unique", "universal")) {
  vec_assert(x)

  if (!vec_is_list(x)) {
    return(x)
  }
  if (!every(x, vec_is_scalar_atomic)) {
    return(x)
  }

  ptype <- tryCatch(
    vctrs_error_incompatible_type = function(...) NULL,
    vec_ptype_common(!!!x)
  )

  if (is_null(ptype)) {
    return(x)
  }

  vec_unchop(x, ptype = ptype)
}

list_as_atomic <- function(x,
                           ptype = NULL,
                           name_spec = NULL,
                           name_repair = c("minimal", "unique", "check_unique", "universal")) {
  if (!every(x, vec_is_scalar_atomic)) {
    abort(c(
      "Can't convert list to a vector.",
      x = "Some elements are not scalar vectors."
    ))
  }

  vec_unchop(
    x,
    ptype = ptype,
    name_spec = name_spec,
    name_repair = name_repair
  )
}

vec_is_scalar_atomic <- function(x) {
  vec_is(x) && !vec_is_list(x) && vec_size(x) == 1L
}
