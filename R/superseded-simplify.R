#' Coerce a list to a vector
#'
#' @description
#' `r lifecycle::badge("superseded")`
#'
#' These functions were superseded in purrr 1.0.0 in favour of
#' `list_simplify()` which has more consistent semantics based on vctrs
#' principles:
#'
#' * `as_vector(x)` is now `list_simplify(x)`
#' * `simplify(x)` is now `list_simplify(x, strict = FALSE)`
#' * `simplify_all(x)` is `map(x, list_simplify, strict = FALSE)`
#'
#' Superseded functions will not go away, but will only receive critical
#' bug fixes.
#'
#' @param .x A list of vectors
#' @param .type Can be a vector mold specifying both the type and the
#'   length of the vectors to be concatenated, such as `numeric(1)`
#'   or `integer(4)`. Alternatively, it can be a string describing
#'   the type, one of: "logical", "integer", "double", "complex",
#'   "character" or "raw".
#' @export
#' @keywords internal
#' @examples
#' # was
#' as.list(letters) |> as_vector("character")
#' # now
#' as.list(letters) |> list_simplify(ptype = character())
#'
#' # was:
#' list(1:2, 3:4, 5:6) |> as_vector(integer(2))
#' # now:
#' list(1:2, 3:4, 5:6) |> list_c(ptype = integer())
as_vector <- function(.x, .type = NULL) {
  # 1.0.0
  lifecycle::signal_stage("superseded", "as_vector()", "list_simplify()")
  as_vector_(.x, .type)
}
as_vector_ <- function(.x, .type = NULL) {
  if (can_simplify(.x, .type)) {
    unlist(.x)
  } else {
    cli::cli_abort(
      "Can't coerce {.arg .x} to a vector.",
      arg = ".x"
    )
  }
}

#' @export
#' @rdname as_vector
simplify <- function(.x, .type = NULL) {
  # 1.0.0
  lifecycle::signal_stage(
    "superseded",
    "simplify()",
    I("`list_simplify(strict = FALSE)`")
  )

  if (can_simplify(.x, .type)) {
    unlist(.x)
  } else {
    .x
  }
}

#' @export
#' @rdname as_vector
simplify_all <- function(.x, .type = NULL) {
  # 1.0.0
  lifecycle::signal_stage(
    "superseded",
    "simplify_all()",
    I("`map(xs, \\(x) list_simplify(strict = FALSE))`")
  )

  map(.x, simplify)
}


# Simplify a list of atomic vectors of the same type to a vector
#
# simplify_list(list(1, 2, 3))
can_simplify <- function(x, type = NULL) {
  is_atomic <- vapply(x, is.atomic, logical(1))
  if (!all(is_atomic)) {
    return(FALSE)
  }

  mode <- unique(vapply(x, typeof, character(1)))
  if (
    length(mode) > 1 &&
      !all(c("double", "integer") %in% mode)
  ) {
    return(FALSE)
  }

  # This can be coerced safely. If type is supplied, perform
  # additional check
  is.null(type) || can_coerce(x, type)
}

can_coerce <- function(x, type) {
  actual <- typeof(x[[1]])

  if (is_mold(type)) {
    lengths <- unique(map_int(x, length))
    if (length(lengths) > 1 || !(lengths == length(type))) {
      return(FALSE)
    } else {
      type <- typeof(type)
    }
  }

  if (actual == "integer" && type %in% c("integer", "double", "numeric")) {
    return(TRUE)
  }

  if (actual %in% c("integer", "double") && type == "numeric") {
    return(TRUE)
  }

  actual == type
}


# is a mold? As opposed to a string
is_mold <- function(type) {
  modes <- c(
    "numeric",
    "logical",
    "integer",
    "double",
    "complex",
    "character",
    "raw"
  )
  length(type) > 1 || (!type %in% modes)
}
