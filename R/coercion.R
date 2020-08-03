#' Simplify to a vector
#'
#' @description
#'
#' - `simplify()` tries to transform inputs into atomic vectors. If
#'   the input is already an atomic vector, it is returned as is.  If
#'   the input is a list containing atomic vectors of size 1 and whose
#'   types are [compatible][faq-compatibility-types], the
#'   elements of the lists are assembled into the corresponding atomic
#'   vector.
#'
#' - Whereas `simplify()` never fails, `as_vector()` is strict. It
#'   throws an error if it can't convert the list to an atomic vector.
#'
#' @param .x An atomic vector or a list of vectors. Atomic vectors are
#'   returned as is. Lists are simplified into an atomic vector if
#'   possible.
#' @param .type For `as_vector()`, an optional vector prototype of
#'   [size][vec_size] 0, e.g. `integer(0)`. An error is thrown when
#'   `.type` is supplied and `.x` can't be simplified (for example
#'   because it is a list containing vectors with sizes different than
#'   1, or vectors incompatible with `.type`).
#'
#'   `r lifecycle::badge("soft-deprecated")` For `simplify()`, this
#'   argument is now deprecated. For `as_vector()`, `.type` previously
#'   could be a string describing a type as returned by `typeof()`, or
#'   a vector of length > 0 to signal the expected length of each
#'   element. These behaviours are now deprecated.
#' @export
#' @examples
#' # Simplify the contents of the list into a vector
#' list(1, 2, FALSE) %>% simplify()
#'
#' # If the input is already a vector it is returned as is:
#' 1:3 %>% simplify()
#'
#' # If the list can't be simplified it is returned as is. This is the
#' # case when not all ements are size 1:
#' list(1:10, 2, FALSE) %>% simplify()
#'
#' # Or because their types is not compatible:
#' list(1, 2, "foo") %>% simplify()
#'
#' # `as_vector()` throws an error in these cases:
#' try(
#'   list(1:10, 2, FALSE) %>% as_vector()
#' )
simplify <- function(.x, .type = NULL) {
  if (!is_null(.type)) {
    lifecycle::deprecate_soft("0.4.0", "purrr::simplify(.type = )")
  }
  ptype <- as_vector_ptype_compat(.x, type = .type)

  if (is_zap(ptype)) {
    return(.x)
  }

  # Flatten `.x` for compatibility if a mould of length > 1 is supplied
  if (is_mould(ptype) && vec_is_list(.x)) {
    return(vec_c(!!!.x, .ptype = ptype))
  }

  if (!is_null(ptype)) {
    common_ptype <- tryCatch(
      vctrs_error_incompatible_type = function(...) NULL,
      vec_ptype_common(!!!.x)
    )
    if (is_null(common_ptype)) {
      return(.x)
    }

    out <- vec_simplify(.x)
    out <- vec_cast(out, ptype)
    return(out)
  }

  vec_simplify(.x)
}
#' @rdname simplify
#' @export
simplify_all <- function(.x, .type = NULL) {
  map(.x, simplify, .type = .type)
}

#' @rdname simplify
#' @export
as_vector <- function(.x, .type = NULL) {
  ptype <- as_vector_ptype_compat(
    .x,
    type = .type,
    fn = "as_vector",
    env = caller_env()
  )

  if (is_zap(ptype)) {
    abort(c(
      "Can't convert list to a vector.",
      x = "Some elements don't match the type mould."
    ))
  }

  # Flatten `.x` for compatibility if a mould of length > 1 is
  # supplied. We have already signalled a deprecation warning.
  if (is_mould(ptype)) {
    return(vec_c(!!!.x, .ptype = ptype))
  }

  if (vec_is_list(.x)) {
    list_as_atomic(.x, .type)
  } else {
    .x
  }
}

# This is for temporary compatibility with mode() names and prototypes
# of length > 1
as_vector_ptype_compat <- function(x,
                                   type = NULL,
                                   fn = NULL,
                                   env = NULL) {
  if (is_string(type, coercion_types)) {
    if (!is_null(fn)) {
      deprecate_type_mould(fn, env)
    }
    return(switch(type,
      logical = logical(),
      integer = integer(),
      numeric = ,
      double = double(),
      complex = complex(),
      character = character(),
      raw = raw()
    ))
  }

  if (is_mould(type)) {
    if (!is_null(fn)) {
      deprecate_type_mould(fn, env)
    }
    lengths <- unique(map_int(x, length))
    if (length(lengths) > 1 || !(lengths == length(type))) {
      return(zap())
    }
  }

  type
}

deprecate_type_mould <- function(fn, env) {
  lifecycle::deprecate_soft(
    "0.4.0",
    sprintf("purrr::%s(.type = '`.type` must be a prototype of size zero')", fn),
    env = env
  )
}

coercion_types <- c(
  "numeric",
  "logical",
  "integer",
  "double",
  "complex",
  "character",
  "raw"
)
is_mould <- function(type) {
  length(type > 1) && !is.data.frame(type)
}
