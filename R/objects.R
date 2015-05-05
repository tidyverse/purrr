#' Concatenate objects in a list
#'
#' This joins all arguments in a list. List objects (i.e., S3 objects)
#' are encapsulated in a list before concatenation.
#' @param ... Objects to concatenate.
#' @param .objects If \code{FALSE}, all S3 objects are encapsulated in
#'   a list prior to concatenation. If \code{TRUE}, no objects are
#'   encapsulated and \code{enlist()} behaves like
#'   \code{c()}. Alternatively, \code{.objects} can be a character
#'   vector of classes. These classes will not be encapsulated before
#'   concatenation. \code{.objects} can also be a predicate
#'   function. The elements of \code{.x} for which \code{.objects}
#'   returns \code{TRUE} will not be encapsulated.
#' @export
#' @examples
#' inputs <- list(arg1 = "a", arg2 = "b")
#'
#' # enlist() concatenates the elements of inputs with arg3
#' enlist(inputs, arg3 = c("c1", "c2")) %>% str()
#' list(inputs, arg3 = c("c1", "c2")) %>% str()
#' c(inputs, arg3 = c("c1", "c2")) %>% str()
#'
#' # With the .objects argument, you can specify which S3 objects
#' # should be treated as bare lists
#' x <- list(a = 1, b = 2)
#' df <- mtcars[1:3]
#' object <- structure(as.list(letters[1:5]), class = "letters")
#'
#' # Here all S3 objects are encapsulated
#' enlist(x, c = df, d = 3, e = object) %>% str()
#'
#' # Now `df` is treated as a bare list and is not encapsulated
#' enlist(x, c = df, d = 3, e = object, .objects = "data.frame") %>% str()
#'
#' # The predicate p() returns TRUE for `object`, preventing its
#' # encapsulation
#' p <- function(x) identical(x[[1]], "a")
#' enlist(x, c = df, d = 3, e = object, .objects = p) %>% str()
enlist <- function(..., .objects = FALSE) {
  dots <- list(...)
  if (length(dots) == 0) {
    return(dots)
  }

  if (!is_false(.objects)) {
    if (is_true(.objects)) {
      p <- is.list
    } else if (is.character(.objects)) {
      p <- function(x) inherits(x, .objects)
    } else if (!is.function(.objects)) {
      stop(".objects should be a character/logical vector or a predicate function",
        call. = FALSE)
    }
    objects <- vapply(dots, p, logical(1))
    dots[objects] <- lapply(dots[objects], c)
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
  dots %>% flatten() %>% setNames(names)
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


#' Is a vector/list empty?
#'
#' @param x object to test
#' @export
#' @examples
#' is_empty(NULL)
#' is_empty(list())
#' is_empty(list(NULL))
is_empty <- function(x) length(x) == 0


#' Is an object a logical vector of length 1?
#'
#' @inheritParams is_empty
#' @export
#' @examples
#' if ("TRUE") is_true("TRUE")
#' is_false(0)
#' is_false(FALSE)
is_true <- function(x) identical(TRUE, x)

#' @export
#' @rdname is_true
is_false <- function(x) identical(FALSE, x)
