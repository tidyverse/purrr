#' Concatenate objects in a list
#'
#' This joins all arguments in a list. Non-list objects are
#' encapsulated in a list before concatenation.
#' @param ... Objects to concatenate.
#' @export
#' @examples
#' inputs <- list(arg1 = "a", arg2 = "b")
#'
#' # enlist() concatenates the elements of inputs with arg3
#' enlist(inputs, arg3 = c("c1", "c2")) %>% str()
#' list(inputs, arg3 = c("c1", "c2")) %>% str()
#' c(inputs, arg3 = c("c1", "c2")) %>% str()
enlist <- function(...) {
  dots <- list(...)

  names <- Map(function(dot, name) {
    if (is_bare_list(dot))
      names2(dot)
    else
      name
  }, dots, names2(dots))
  names <- flatten(names)

  is_not_list <- vapply(dots, negate(is_bare_list), logical(1))
  dots[is_not_list] <- lapply(dots[is_not_list], list)
  dots %>% flatten() %>% setNames(names)
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
#'   \item Unlike base R \code{is.numeric()}, \code{is_bare_numeric()}
#'         only return \code{TRUE} for floating point numbers.
#' }
#' @param x object to be tested.
#' @seealso type-predicates
#' @name bare-type-predicates
NULL

#' @export
#' @rdname bare-type-predicates
is_bare_list <- function(x) {
  !is.object(x) && is.list(x)
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
is_bare_numeric <- function(x) {
  !is.object(x) && is.double(x)
}

#' @export
#' @rdname bare-type-predicates
is_bare_integer <- function(x) {
  !is.object(x) && is.integer(x) 
}

#' @export
#' @rdname bare-type-predicates
is_bare_character <- function(x) {
  !is.object(x) && is.character(x) 
}

#' @export
#' @rdname bare-type-predicates
is_bare_logical <- function(x) {
  !is.object(x) && is.logical(x) 
}


#' Type predicates
#'
#' These type predicates aim to make type testing in R more
#' consistent.
#'
#' Most of these predicates are simple aliases to base R functions. In
#' addition:
#' \itemize{
#'   \item Unlike \code{is.atomic()}, \code{is_atomic()} does not
#'         return \code{TRUE} for \code{NULL}.
#'   \item Unlike \code{is.vector()}, \code{is_vector()} test if an
#'         object is an atomic vector or a list. \code{is.vector}
#'         checks for the presence of attributes (other than name).
#'   \item Unlike \code{is.numeric()}, \code{is_numeric()} only
#'         returns \code{TRUE} for floating point numbers, not
#'         integers.
#' }
#' @param x object to be tested.
#' @seealso bare-type-predicates
#' @name type-predicates
NULL

#' @export
#' @rdname type-predicates
is_list <- is.list

#' @export
#' @rdname type-predicates
is_atomic <- function(x) {
  is.atomic(x) && !is.null(x)
}

#' @export
#' @rdname type-predicates
is_vector <- function(x) {
  is_atomic(x) || is.list(x)
}

#' @export
#' @rdname type-predicates
is_numeric <- is.double

#' @export
#' @rdname type-predicates
is_integer <- is.integer

#' @export
#' @rdname type-predicates
is_character <- is.character

#' @export
#' @rdname type-predicates
is_logical <- is.logical
