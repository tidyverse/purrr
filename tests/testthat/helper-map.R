
named <- function(x) {
  if (is_null(names(x))) {
    names(x) <- names2(x)
  }
  x
}

# Until we can reexport from rlang
vars <- function(...) rlang::quos(...)
