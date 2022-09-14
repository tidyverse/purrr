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
      arg = error_arg,
      call = error_call
    )
  }
}

paste_line <- function(...) {
  paste(chr(...), collapse = "\n")
}

is_number <- function(x) {
  is_integerish(x, n = 1, finite = TRUE)
}
is_quantity <- function(x) {
  typeof(x) %in% c("integer", "double") && length(x) == 1 && !is.na(x)
}
