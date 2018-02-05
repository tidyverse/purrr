# Used internally by map and flatten.
# Exposed here for testing
coerce <- function(x, type) {
  .Call(coerce_impl, x, type)
}

coerce_lgl <- function(x) coerce(x, "logical")
coerce_int <- function(x) coerce(x, "integer")
coerce_dbl <- function(x) coerce(x, "double")
coerce_chr <- function(x) coerce(x, "character")
coerce_raw <- function(x) coerce(x, "raw")
