#' Coerce a list to a vector
#'
#' \code{as_vector()} collapses a list of vectors into one vector. It
#' checks that the type of each vector is consistent with
#' \code{.type}. If the list can not be simplified, it throws an error.
#' \code{simplify} will simplify a vector if possible; \code{simplify_all}
#' will apply \code{simplify} to every element of a list.
#'
#' \code{.type} can be a vector mold specifying both the type and the
#' length of the vectors to be concatenated, such as \code{numeric(1)}
#' or \code{integer(4)}. Alternatively, it can be a string describing
#' the type, one of: "logical", "integer", "double", "complex",
#' "character" or "raw".
#'
#' @param .x A list of vectors
#' @param .type A vector mold or a string describing the type of the
#'   input vectors. The latter can be any of the types returned by
#'   \code{\link{typeof}()}, or "numeric" as a shorthand for either
#'   "double" or "integer".
#' @export
#' @examples
#' # Supply the type either with a string:
#' as.list(letters) %>% as_vector("character")
#'
#' # Or with a vector mold:
#' as.list(letters) %>% as_vector(character(1))
#'
#' # Vector molds are more flexible because they also specify the
#' # length of the concatenated vectors:
#' list(1:2, 3:4, 5:6) %>% as_vector(integer(2))
#'
#' # Note that unlike vapply(), as_vector() never adds dimension
#' # attributes. So when you specify a vector mold of size > 1, you
#' # always get a vector and not a matrix
as_vector <- function(.x, .type = NULL) {
  if (can_simplify(.x, .type)) {
    unlist(.x)
  } else {
    stop("Cannot coerce .x to a vector", call. = FALSE)
  }
}

#' @export
#' @rdname as_vector
simplify <- function(.x, .type = NULL) {
  if (can_simplify(.x, .type)) {
    unlist(.x)
  } else {
    .x
  }
}

#' @export
#' @rdname as_vector
simplify_all <- function(.x, .type = NULL) {
  map(.x, simplify, .type = .type)
}


# Simplify a list of atomic vectors of the same type to a vector
#
# simplify_list(list(1, 2, 3))
can_simplify <- function(x, type = NULL) {
  is_atomic <- vapply(x, is.atomic, logical(1))
  if (!all(is_atomic)) return(FALSE)

  mode <- unique(vapply(x, typeof, character(1)))
  if (length(mode) > 1 &&
        !all(c("double", "integer") %in% mode)) {
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
  modes <- c("numeric", "logical", "integer", "double", "complex",
    "character", "raw")
  length(type) > 1 || (!type %in% modes)
}
