# Used internally by map and flatten.
# Exposed here for testing
coerce <- function(x, type) {
  .Call(coerce_impl, x, type)
}

coerce_lgl <- function(x) coerce(x, "logical")
coerce_int <- function(x) coerce(x, "integer")
coerce_dbl <- function(x) coerce(x, "double")
coerce_chr <- function(x) {
  local_deprecation_user_env()
  coerce(x, "character")
}


deprecate_to_char <- function(type) {
  lifecycle::deprecate_warn(
    "1.0.0",
    I(paste0("Automatic coercion from ", type, " to character")),
    I("an explicit call to `as.character()` within `map_chr()`"),
    always = TRUE,
    user_env = the$deprecation_user_env
  )
}


# Can rewrite after https://github.com/r-lib/rlang/issues/1643
local_deprecation_user_env <- function(
  user_env = caller_env(2),
  frame = caller_env()
) {
  old <- the$deprecation_user_env
  the$deprecation_user_env <- user_env
  defer(the$deprecation_user_env <- old, frame)
}

# Lightweight equivalent of withr::defer()
defer <- function(expr, env = caller_env(), after = FALSE) {
  thunk <- as.call(list(function() expr))
  do.call(on.exit, list(thunk, TRUE, after), envir = env)
}
