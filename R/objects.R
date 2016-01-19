#' Splice objects and lists of objects into a list
#'
#' This splices all arguments into a list. Non-list objects and lists
#' with a S3 class are encapsulated in a list before concatenation.
#' @param ... Objects to concatenate.
#' @export
#' @examples
#' inputs <- list(arg1 = "a", arg2 = "b")
#'
#' # splice() concatenates the elements of inputs with arg3
#' splice(inputs, arg3 = c("c1", "c2")) %>% str()
#' list(inputs, arg3 = c("c1", "c2")) %>% str()
#' c(inputs, arg3 = c("c1", "c2")) %>% str()
splice <- function(...) {
  dots <- list(...)
  if (length(dots) == 0) {
    return(dots)
  }

  names <- Map(function(dot, name) {
    if (is_bare_list(dot))
      names2(dot)
    else
      name
  }, dots, names2(dots))
  names <- flatten(names)

  is_not_list <- vapply(dots, negate(is_bare_list), logical(1))
  dots[is_not_list] <- lapply(dots[is_not_list], list)
  dots %>% flatten() %>% stats::setNames(names)
}


#' Prepend a vector
#'
#' This is a companion to \code{\link{append}()} to help merging two
#' lists or atomic vectors. \code{prepend()} is a clearer semantic
#' signal than `c()` that a vector is to be merged at the beginning of
#' another, especially in a pipe chain.
#'
#' @param x the vector to be modified.
#' @param values to be included in the modified vector.
#' @param before a subscript, before which the values are to be appended.
#' @return A merged vector.
#' @export
#' @examples
#' x <- as.list(1:3)
#'
#' x %>% append("a")
#' x %>% prepend("a")
#' x %>% prepend(list("a", "b"), before = 3)
prepend <- function(x, values, before = 1) {
  n <- length(x)
  stopifnot(before > 0 && before <= n)

  if (before == 1) {
    c(values, x)
  } else {
    c(x[1:(before - 1)], values, x[before:n])
  }
}


#' Bare type predicates
#'
#' These predicates check for a given type but only return \code{TRUE}
#' for bare R objects. Bare objects have no class attributes. For
#' example, a data frame is a list, but not a bare list.
#'
#' \itemize{
#'   \item Like \code{\link{is_atomic}()} and unlike base R
#'         \code{is.atomic()}, \code{is_bare_atomic()} does not return
#'         \code{TRUE} for \code{NULL}.
#'   \item Unlike base R \code{is.numeric()}, \code{is_bare_double()}
#'         only returns \code{TRUE} for floating point numbers.
#' }
#' @param x object to be tested.
#' @seealso \link{type-predicates} \link{scalar-type-predicates}
#' @name bare-type-predicates
NULL

#' @export
#' @rdname bare-type-predicates
is_bare_list <- function(x) {
  !is.object(x) && is_list(x)
}

#' @export
#' @rdname bare-type-predicates
is_bare_atomic <- function(x) {
  !is.object(x) && is_atomic(x)
}

#' @export
#' @rdname bare-type-predicates
is_bare_vector <- function(x) {
  is_bare_atomic(x) || is_bare_list(x)
}

#' @export
#' @rdname bare-type-predicates
is_bare_double <- function(x) {
  !is.object(x) && is_double(x)
}

#' @export
#' @rdname bare-type-predicates
is_bare_integer <- function(x) {
  !is.object(x) && is_integer(x)
}

#' @export
#' @rdname bare-type-predicates
is_bare_numeric <- function(x) {
  !is.object(x) && is_numeric(x)
}

#' @export
#' @rdname bare-type-predicates
is_bare_character <- function(x) {
  !is.object(x) && is_character(x)
}

#' @export
#' @rdname bare-type-predicates
is_bare_logical <- function(x) {
  !is.object(x) && is_logical(x)
}


#' Type predicates
#'
#' These type predicates aim to make type testing in R more
#' consistent. They are wrappers around \code{\link{typeof}}, so
#' operate at a level beneath S3/S4 etc.
#'
#' Compare to base R functions:
#' \itemize{
#'   \item Unlike \code{is.atomic()}, \code{is_atomic()} does not
#'      return \code{TRUE} for \code{NULL}.
#'   \item Unlike \code{is.vector()}, \code{is_vector()} test if an
#'         object is an atomic vector or a list. \code{is.vector}
#'         checks for the presence of attributes (other than name).
#'   \item \code{is_numeric()} is not generic so, (e.g.) dates and date times
#'     are \code{TRUE}, not \code{FALSE}.
#'   \item \code{is_function()} returns \code{TRUE} only for regular
#'     functions, not special or primitive functions.
#' }
#' @param x object to be tested.
#' @seealso \link{bare-type-predicates} \link{scalar-type-predicates}
#' @name type-predicates
NULL

#' @export
#' @rdname type-predicates
is_list <- function(x) {
  typeof(x) == "list"
}

#' @export
#' @rdname type-predicates
is_atomic <- function(x) {
  typeof(x) %in% c("logical", "integer", "double", "complex", "character", "raw")
}

#' @export
#' @rdname type-predicates
is_vector <- function(x) {
  is_atomic(x) || is.list(x)
}

#' @export
#' @rdname type-predicates
is_numeric <- function(x) {
  typeof(x) %in% c("integer", "double")
}

#' @export
#' @rdname type-predicates
is_integer <- function(x) {
  typeof(x) == "integer"
}

#' @export
#' @rdname type-predicates
is_double <- function(x) {
  typeof(x) == "double"
}

#' @export
#' @rdname type-predicates
is_character <- function(x) {
  typeof(x) == "character"
}

#' @export
#' @rdname type-predicates
is_logical <- function(x) {
  typeof(x) == "logical"
}

#' @export
#' @rdname type-predicates
is_null <- function(x) {
  typeof(x) == "NULL"
}

#' @export
#' @rdname type-predicates
is_function <- function(x) {
  typeof(x) == "closure"
}

is_name <- function(x) {
  typeof(x) == "name"
}

is_call <- function(x) {
  typeof(x) == "language"
}

is_language <- function(x) {
  is_call(x) || is_name(x) || is_atomic(x)
}

#' Scalar type predicates
#'
#' These predicates check for a given type and whether the vector is
#' "scalar", that is, of length 1.
#' @param x object to be tested.
#' @seealso \link{type-predicates} \link{bare-type-predicates}
#' @name scalar-type-predicates
NULL

#' @export
#' @rdname scalar-type-predicates
is_scalar_list <- function(x) {
  is_list(x) && length(x) == 1
}

#' @export
#' @rdname scalar-type-predicates
is_scalar_atomic <- function(x) {
  is_atomic(x) && length(x) == 1
}

#' @export
#' @rdname scalar-type-predicates
is_scalar_vector <- function(x) {
  is_vector(x) && length(x) == 1
}

#' @export
#' @rdname scalar-type-predicates
is_scalar_numeric <- function(x) {
  is_numeric(x) && length(x) == 1
}

#' @export
#' @rdname scalar-type-predicates
is_scalar_integer <- function(x) {
  is_integer(x) && length(x) == 1
}

#' @export
#' @rdname scalar-type-predicates
is_scalar_double <- function(x) {
  is_double(x) && length(x) == 1
}

#' @export
#' @rdname scalar-type-predicates
is_scalar_character <- function(x) {
  is_character(x) && length(x) == 1
}

#' @export
#' @rdname scalar-type-predicates
is_scalar_logical <- function(x) {
  is_logical(x) && length(x) == 1
}

#' Is a vector/list empty?
#'
#' @param x object to test
#' @export
#' @examples
#' is_empty(NULL)
#' is_empty(list())
#' is_empty(list(NULL))
is_empty <- function(x) length(x) == 0

#' Is a formula?
#'
#' @inheritParams is_empty
#' @export
#' @examples
#' x <- disp ~ am
#' is_formula(x)
is_formula <- function(x) inherits(x, "formula")
