#' Concatenate objects in a list
#'
#' This joins all arguments in a list. Non-list objects are
#' encapsulated in a list before concatenation.
#' @param ... Objects to concatenate.
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

#' Test for bare object type 
#'
#' These predicates check for a given type but only return \code{TRUE}
#' for bare R objects. Bare objects have no class attributes. For
#' example, a data frame is a list, but not a bare list.
#'
#' Like \code{\link{is_atomic}()} and unlike base R
#' \code{is.atomic()}, \code{is_bare_atomic()} does not return
#' \code{TRUE} for \code{NULL}.
#' @param x object to be tested.
#' @name bare-predicates
#' @seealso is_atomic
NULL

#' @export
#' @rdname bare-predicates
is_bare_list <- function(x) {
  !is.object(x) && is.list(x)
}

#' @export
#' @rdname bare-predicates
is_bare_numeric <- function(x) {
  !is.object(x) && is.numeric(x)
}

#' @export
#' @rdname bare-predicates
is_bare_double <- function(x) {
  !is.object(x) && is.double(x) 
}

#' @export
#' @rdname bare-predicates
is_bare_integer <- function(x) {
  !is.object(x) && is.integer(x) 
}

#' @export
#' @rdname bare-predicates
is_bare_atomic <- function(x) {
  !is.object(x) && is_atomic(x)
}

#' @export
#' @rdname bare-predicates
is_bare_vector <- function(x) {
  is_bare_atomic(x) || is_bare_list(x)
}


#' Is an object atomic
#'
#' \code{is_atomic} is equivalent to \code{is.atomic} but does not
#' return \code{TRUE} for \code{NULL}.
#' @param x object to be tested.
#' @seealso bare-predicates
#' @export
is_atomic <- function(x) {
  is.atomic(x) && !is.null(x)
}
