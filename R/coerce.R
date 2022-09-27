# Used internally by map and flatten.
# Exposed here for testing
coerce <- function(x, type) {
  .Call(coerce_impl, x, type)
}

coerce_lgl <- function(x) coerce(x, "logical")
coerce_int <- function(x) coerce(x, "integer")
coerce_dbl <- function(x) coerce(x, "double")
coerce_chr <- function(x) coerce(x, "character")


deprecate_to_char <- function(type, call = caller_env()) {
  lifecycle::deprecate_warn(
    "1.0.0",
    I(paste0("Automatic coercion from ", type, " to character")),
    I("an explicit call to as.character() within map_chr()"),
    always = TRUE,
    user_env = call
  )
}
