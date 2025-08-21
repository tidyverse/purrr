where_at <- function(
  x,
  at,
  user_env,
  error_arg = caller_arg(at),
  error_call = caller_env()
) {
  if (is_formula(at)) {
    at <- rlang::as_function(at, arg = error_arg, call = error_call)
  }
  if (is.function(at)) {
    at <- at(names2(x))
  }

  if (is_quosures(at)) {
    lifecycle::deprecate_soft(
      when = "1.0.0",
      what = I("Using `vars()` in .at"),
      user_env = user_env
    )
    check_installed("tidyselect", "for using tidyselect in `map_at()`.")

    at <- tidyselect::vars_select(.vars = names2(x), !!!at)
  }

  if (is.numeric(at) || is.logical(at) || is.character(at)) {
    if (is.character(at)) {
      at <- intersect(at, names2(x))
    }

    loc <- vec_as_location(
      at,
      length(x),
      names2(x),
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

where_if <- function(.x, .p, ..., .purrr_error_call = caller_env()) {
  if (is_logical(.p)) {
    stopifnot(length(.p) == length(.x))
    .p
  } else {
    .p <- as_predicate(.p, ..., .mapper = TRUE, .purrr_error_call = NULL)
    map_(.x, .p, ..., .type = "logical", .purrr_error_call = .purrr_error_call)
  }
}

as_predicate <- function(
  .fn,
  ...,
  .mapper,
  .allow_na = FALSE,
  .purrr_error_call = caller_env(),
  .purrr_error_arg = caller_arg(.fn)
) {
  force(.purrr_error_call)
  force(.purrr_error_arg)

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
        "{.fn { .purrr_error_arg }} must return a single `TRUE` or `FALSE`, not {.obj_type_friendly {out}}.",
        arg = .purrr_error_arg,
        call = .purrr_error_call
      )
    }

    out
  }
}

paste_line <- function(...) {
  paste(chr(...), collapse = "\n")
}

`list_slice2<-` <- function(x, i, value) {
  if (is.null(value)) {
    x[i] <- list(NULL)
  } else {
    x[[i]] <- value
  }
  x
}

vctrs_list_compat <- function(
  x,
  user_env,
  error_call = caller_env(),
  error_arg = caller_arg(x)
) {
  out <- vctrs_vec_compat(x, user_env)
  obj_check_list(out, call = error_call, arg = error_arg)
  out
}

# When we want to use vctrs, but treat lists like purrr does
# Treat data frames and S3 scalar lists like bare lists.
# But ensure rcrd vctrs retain their class.
vctrs_vec_compat <- function(x, user_env) {
  if (inherits(x, "by")) {
    class(x) <- NULL
  }

  if (is.null(x)) {
    list()
  } else if (is.pairlist(x)) {
    lifecycle::deprecate_soft(
      when = "1.0.0",
      what = I("Use of pairlists in map functions"),
      details = "Please coerce explicitly with `as.list()`",
      user_env = user_env
    )
    as.list(x)
  } else if (is.array(x) && length(dim(x)) > 1) {
    dim(x) <- NULL
    x
  } else if (is_call(x) || is.expression(x)) {
    lifecycle::deprecate_soft(
      when = "1.0.0",
      what = I("Use of calls and pairlists in map functions"),
      details = "Please coerce explicitly with `as.list()`",
      user_env = user_env
    )
    as.list(x)
  } else if (isS4(x)) {
    set_names(lapply(seq_along(x), function(i) x[[i]]), names(x))
  } else if (is.data.frame(x) || (is.list(x) && !vec_is(x))) {
    unclass(x)
  } else {
    x
  }
}
