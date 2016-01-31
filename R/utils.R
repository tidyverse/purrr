#' Pipe operator
#'
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @export
#' @importFrom magrittr %>%
#' @usage lhs \%>\% rhs
NULL


#' Modify a list
#'
#' @param _data A list.
#' @param ... New values of a list. Use \code{NULL} to remove values.
#'   Use a formula to evaluate in the context of the list values.
#' @export
#' @examples
#' x <- list(x = 1:10, y = 4)
#' update_list(x, z = 10)
#' update_list(x, z = ~ x + y)
update_list <- function(`_data`, ...) {
  new_values <- list(...)

  is_formula <- map_lgl(new_values, ~inherits(., "formula"))

  new_values[is_formula] <- lapply(new_values[is_formula], function(f) {
    stopifnot(length(f) == 2)
    eval(f[[2]], `_data`, environment(f))
  })

  utils::modifyList(`_data`, new_values)
}

#' Convert an object into a function.
#'
#' \code{as_function} is the powerhouse behind the varied function
#' specifications that purrr functions allow. This is an S3 generic so that
#' other people can make \code{as_function} work with their own objects.
#'
#' @param .f A function, formula, or atomic vector.
#'
#'   If a \strong{function}, it is used as is.
#'
#'   If a \strong{formula}, e.g. \code{~ .x + 2}, it is converted to a
#'   function with two arguments, \code{.x} or \code{.} and \code{.y}. This
#'   allows you to create very compact anonymous functions with up to
#'   two inputs.
#'
#'   If \strong{character} or \strong{integer vector}, e.g. \code{"y"}, it
#'   is converted to an extractor function, \code{function(x) x[["y"]]}. To
#'   index deeply into a nested list, use multiple values; \code{c("x", "y")}
#'   is equivalent to \code{z[["x"]][["y"]]}. You can also set \code{.null}
#'   to set a default to use instead of \code{NULL} for absent components.
#' @param ... Additional arguments passed on to methods.
#' @export
#' @examples
#' as_function(~ . + 1)
#' as_function(1)
#' as_function(c("a", "b", "c"))
#' as_function(c("a", "b", "c"), .null = NA)
as_function <- function(.f, ...) {
  UseMethod("as_function")
}

#' @export
as_function.function <- function(.f, ...) .f

#' @export
as_function.formula <- function(.f, ...) {
  .x <- NULL # hush R CMD check NOTE

  if (length(.f) != 2) {
    stop("Formula must be one sided", call. = FALSE)
  }
  make_function(alist(.x = , .y = , . = .x), .f[[2]], environment(.f))
}

#' @export
#' @rdname as_function
#' @param .null Optional additional argument for character and numeric
#'   inputs.
as_function.character <- function(.f, ..., .null) {
  idx <- .f
  if (missing(.null)) {
    function(g, ...) {
      g[[idx]]
    }
  } else {
    function(g, ...) {
      g[[idx]] %||% .null
    }
  }
}

#' @export
as_function.numeric <- function(.f, ..., .null) {
  idx <- .f

  if (missing(.null)) {
    function(g, ...) {
      g[[idx]]
    }
  } else {
    function(g, ...) {
      if (idx > length(g)) {
        .null
      } else {
        g[[idx]]
      }
    }
  }
}

#' @export
as_function.default <- function(.f, ...) {
  stop("Don't know how to convert ", paste0(class(.f), collapse = "/"),
       " into a function", call. = FALSE)
}


maybe_as_data_frame <- function(out, x) {
  if (is.data.frame(x)) {
    dplyr::as_data_frame(out)
  } else {
    out
  }
}

recycle_args <- function(args) {
  lengths <- map_int(args, length)
  n <- max(lengths)

  stopifnot(all(lengths == 1L | lengths == n))
  to_recycle <- lengths == 1L
  args[to_recycle] <- lapply(args[to_recycle], function(x) rep.int(x, n))
  args
}

names2 <- function(x) {
  names(x) %||% rep("", length(x))
}

#' Default value for \code{NULL}.
#'
#' This infix function makes it easy to replace \code{NULL}s with a
#' default value. It's inspired by the way that Ruby's or operation (\code{||})
#' works.
#'
#' @param x,y If \code{x} is NULL, will return \code{y}; otherwise returns
#'   \code{x}.
#' @export
#' @name null-default
#' @examples
#' 1 %||% 2
#' NULL %||% 2
`%||%` <- function(x, y) {
  if (is.null(x)) {
    y
  } else {
    x
  }
}

#' Infix attribute accessor
#'
#' @param x Object
#' @param name Attribute name
#' @export
#' @name get-attr
#' @examples
#' factor(1:3) %@% "levels"
#' mtcars %@% "class"
`%@%` <- function(x, name) attr(x, name, exact = TRUE)


#' Generate random samples from a Bernoulli distribution
#'
#' @param n Number of samples
#' @param p Probability of getting \code{TRUE}
#' @return A logical vector
#' @export
#' @examples
#' rbernoulli(10)
#' rbernoulli(100, 0.1)
rbernoulli <- function(n, p = 0.5) {
  sample(c(TRUE, FALSE), n, replace = TRUE, prob = c(p, 1 - p))
}

#' Generate random samples from a discrete uniform distribution
#'
#' @param n Number of samples to draw.
#' @param a,b Range of the distribution (inclusive).
#' @export
#' @examples
#' table(rdunif(1e3, 10))
rdunif <- function(n, b, a = 1) {
  sample(b - a + 1, n, replace = TRUE) + a - 1
}

# magrittr placeholder
globalVariables(".")


has_names <- function(x) {
  nms <- names(x)
  if (is.null(nms)) {
    rep_along(x, FALSE)
  } else {
    !(is.na(nms) | nms == "")
  }
}
