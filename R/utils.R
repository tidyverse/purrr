#' Pipe operator
#'
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @export
#' @importFrom magrittr %>%
#' @usage lhs \%>\% rhs
NULL

at_selection <- function(x, at, error_arg = caller_arg(at), error_call = caller_env()) {
  if (is_formula(at)) {
    at <- rlang::as_function(at, arg = error_arg, call = error_call)
  }
  if (is.function(at)) {
    at <- at(names(x))
  }

  if (is.numeric(at) || is.logical(at) || is.character(at)) {
    if (is.character(at)) {
      at <- intersect(at, names2(x))
    }

    # at <- vec_as_subscript(at, arg = "at", call = error_call)
    vec_as_location(
      at,
      length(x),
      names(x),
      missing = "error",
      arg = "at",
      call = error_call
    )
  } else if (is_quosures(at)) {
    lifecycle::deprecate_warn("1.0.0", I("Using `vars()` in .at"))
    check_installed("tidyselect", "for using tidyselect in `map_at()`.")

    tidyselect::vars_select(.vars = names(x), !!!at)
  } else {
    cli::cli_abort(
      "{.arg {error_arg}} must be a numeric vector, character vector, or function, not {.obj_type_friendly {at}}.",
      call = error_call
    )
  }
}

#' Infix attribute accessor
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' This function was deprecated in purrr 0.3.0. Instead, lease use the `%@%`
#' operator exported in rlang. It has an interface more consistent with `@`:
#' uses NSE, supports S4 fields, and has an assignment variant.
#'
#' @param x Object
#' @param name Attribute name
#' @export
#' @name get-attr
#' @keywords internal
`%@%` <- function(x, name) {
  lifecycle::deprecate_warn("0.3.0", I("%@%"), I("rlang::%@%"), always = TRUE)
  attr(x, name, exact = TRUE)
}

#' Generate random sample from a Bernoulli distribution
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' This function was deprecated in purrr 1.0.0 because it's not related to the
#' core purpose of purrr.
#'
#' @param n Number of samples
#' @param p Probability of getting `TRUE`
#' @return A logical vector
#' @keywords internal
#' @export
#' @examples
#' rbernoulli(10)
#' rbernoulli(100, 0.1)
rbernoulli <- function(n, p = 0.5) {
  lifecycle::deprecate_warn("1.0.0", "rbernoulli()")
  stats::runif(n) > (1 - p)
}

#' Generate random sample from a discrete uniform distribution
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' This function was deprecated in purrr 1.0.0 because it's not related to the
#' core purpose of purrr.
#'
#' @param n Number of samples to draw.
#' @param a,b Range of the distribution (inclusive).
#' @keywords internal
#' @export
#' @examples
#' table(rdunif(1e3, 10))
#' table(rdunif(1e3, 10, -5))
rdunif <- function(n, b, a = 1) {
  lifecycle::deprecate_warn("1.0.0", "rdunif()")

  stopifnot(is.numeric(a), length(a) == 1)
  stopifnot(is.numeric(b), length(b) == 1)

  a1 <- min(a, b)
  b1 <- max(a, b)

  sample(b1 - a1 + 1, n, replace = TRUE) + a1 - 1
}

# magrittr placeholder
globalVariables(".")

paste_line <- function(...) {
  paste(chr(...), collapse = "\n")
}
cat_line <- function(...) {
  cat(paste0(paste_line(...), "\n"))
}

# From rlang
friendly_type_of <- function(x, length = FALSE) {
  if (is.object(x)) {
    return(sprintf("a `%s` object", paste_classes(x)))
  }

  friendly <- as_friendly_type(typeof(x))

  if (length && is_vector(x)) {
    friendly <- paste0(friendly, sprintf(" of length %s", length(x)))
  }

  friendly
}
as_friendly_type <- function(type) {
  switch(type,
    logical = "a logical vector",
    integer = "an integer vector",
    numeric = ,
    double = "a double vector",
    complex = "a complex vector",
    character = "a character vector",
    raw = "a raw vector",
    string = "a string",
    list = "a list",

    NULL = "NULL",
    environment = "an environment",
    externalptr = "a pointer",
    weakref = "a weak reference",
    S4 = "an S4 object",

    name = ,
    symbol = "a symbol",
    language = "a call",
    pairlist = "a pairlist node",
    expression = "an expression vector",
    quosure = "a quosure",
    formula = "a formula",

    char = "an internal string",
    promise = "an internal promise",
    ... = "an internal dots object",
    any = "an internal `any` object",
    bytecode = "an internal bytecode object",

    primitive = ,
    builtin = ,
    special = "a primitive function",
    closure = "a function",

    type
  )
}
paste_classes <- function(x) {
  paste(class(x), collapse = "/")
}

is_number <- function(x) {
  is_integerish(x, n = 1, finite = TRUE)
}
is_quantity <- function(x) {
  typeof(x) %in% c("integer", "double") && length(x) == 1 && !is.na(x)
}

friendly_type_of_element <- function(x) {
  if (is.object(x)) {
    classes <- paste0("`", paste_classes(x), "`")
    if (single) {
      friendly <- sprintf("a single %s element", classes)
    } else {
      friendly <- sprintf("a %s element", classes)
    }
    return(friendly)
  }

  switch(typeof(x),
    logical   = "a single logical",
    integer   = "a single integer",
    double    = "a single double",
    complex   = "a single complex number",
    character = "a single string",
    raw       = "a single raw value",
    list      = "a list of one element",
    abort("Expected a base vector type")
  )
}
