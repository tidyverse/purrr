where_at <- function(x, at, error_arg = caller_arg(at), error_call = caller_env()) {
  if (is_formula(at)) {
    at <- rlang::as_function(at, arg = error_arg, call = error_call)
  }
  if (is.function(at)) {
    at <- at(names(x))
  }

  if (is_quosures(at)) {
    lifecycle::deprecate_warn("1.0.0", I("Using `vars()` in .at"))
    check_installed("tidyselect", "for using tidyselect in `map_at()`.")

    at <- tidyselect::vars_select(.vars = names(x), !!!at)
  }

  if (is.numeric(at) || is.logical(at) || is.character(at)) {
    if (is.character(at)) {
      at <- intersect(at, names2(x))
    }

    loc <- vec_as_location(
      at,
      length(x),
      names(x),
      missing = "error",
      arg = "at",
      call = error_call
    )
    seq_along(x) %in% loc
  } else {
    cli::cli_abort(
      "{.arg {error_arg}} must be a numeric vector, character vector, or function, not {.obj_type_friendly {at}}.",
      arg = error_arg,
      call = error_call
    )
  }
}

where_if <- function(.x, .p, ..., .error_call = caller_env()) {
  if (is_logical(.p)) {
    stopifnot(length(.p) == length(.x))
    .p
  } else {
    .p <- as_predicate(.p, ..., .mapper = TRUE, .error_call = .error_call)
    map_lgl(.x, .p, ...)
  }
}

as_predicate <- function(.fn,
                         ...,
                         .mapper,
                         .allow_na = FALSE,
                         .error_call = caller_env(),
                         .error_arg = caller_arg(.fn)) {

  force(.error_arg)
  force(.error_call)

  if (.mapper) {
    .fn <- as_mapper(.fn, ...)
  }

  function(...) {
    out <- .fn(...)

    if (!is_bool(out)) {
      if (is_na(out) && .allow_na) {
        # Always return a logical NA
        return(NA)
      }
      cli::cli_abort(
        "{.fn { .error_arg }} must return a single `TRUE` or `FALSE`, not {.obj_type_friendly {out}}.",
        arg = .error_arg,
        call = .error_call
      )
    }

    out
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

`list_slice2<-` <- function(x, i, value) {
  if (is.null(value)) {
    x[i] <- list(NULL)
  } else {
    x[[i]] <- value
  }
  x
}
