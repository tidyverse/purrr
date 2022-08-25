# nocov start --- compat-lifecycle

# This file serves as a reference for currently unexported rlang
# lifecycle functions. Please find the most recent version in rlang's
# repository. These functions require rlang in your `Imports`
# DESCRIPTION field but you don't need to import rlang in your
# namespace.

# Changelog
# =========
#
# 2021-04-19
#
# - Removed `lifecycle()` function. You can now use the following in
#   your roxygen documentation to inline a badge:
#
#    ```
#    `r lifecycle::badge()`
#    ```
#
#   This is a build-time dependency on lifecycle so there is no need
#   to add lifecycle to Imports just to use badges. See also
#   `?usethis::use_lifecycle()` for importing or updating the badge
#   images in your package.
#
# - Soft-namespaced private objects.


#' Signal deprecation
#'
#' @description
#'
#' These functions provide two levels of verbosity for deprecation
#' warnings.
#'
#' * `signal_soft_deprecated()` warns only if called from the global
#'   environment (so the user can change their script) or from the
#'   package currently being tested (so the package developer can fix
#'   the package).
#'
#' * `warn_deprecated()` warns unconditionally.
#'
#' * `stop_defunct()` fails unconditionally.
#'
#' Both functions warn only once per session by default to avoid
#' overwhelming the user with repeated warnings.
#'
#' @param msg The deprecation message.
#' @param id The id of the deprecation. A warning is issued only once
#'   for each `id`. Defaults to `msg`, but you should give a unique ID
#'   when the message is built programmatically and depends on inputs.
#' @param env The environment in which the soft-deprecated function
#'   was called. A warning is issued if called from the global
#'   environment. If testthat is running, a warning is also called if
#'   the retired function was called from the package being tested.
#'
#' @section Controlling verbosity:
#'
#' The verbosity of retirement warnings can be controlled with global
#' options. You'll generally want to set these options locally with
#' one of these helpers:
#'
#' * `with_lifecycle_silence()` disables all soft-deprecation and
#'   deprecation warnings.
#'
#' * `with_lifecycle_warnings()` enforces warnings for both
#'   soft-deprecated and deprecated functions. The warnings are
#'   repeated rather than signalled once per session.
#'
#' * `with_lifecycle_errors()` enforces errors for both
#'   soft-deprecated and deprecated functions.
#'
#' All the `with_` helpers have `scoped_` variants that are
#' particularly useful in testthat blocks.
#'
#' @noRd
NULL

signal_soft_deprecated <- function(msg, id = msg, env = rlang::caller_env(2)) {
  msg <- .rlang_lifecycle_validate_message(msg)
  stopifnot(
    rlang::is_string(id),
    rlang::is_environment(env)
  )

  if (rlang::is_true(rlang::peek_option("lifecycle_disable_warnings"))) {
    return(invisible(NULL))
  }

  env_inherits_global <- function(env) {
    # `topenv(emptyenv())` returns the global env. Return `FALSE` in
    # that case to allow passing the empty env when the
    # soft-deprecation should not be promoted to deprecation based on
    # the caller environment.
    if (rlang::is_reference(env, emptyenv())) {
      return(FALSE)
    }

    rlang::is_reference(topenv(env), rlang::global_env())
  }

  if (rlang::is_true(rlang::peek_option("lifecycle_verbose_soft_deprecation")) ||
      env_inherits_global(env)) {
    warn_deprecated(msg, id)
    return(invisible(NULL))
  }

  # Test for environment names rather than reference/contents because
  # testthat clones the namespace
  tested_package <- Sys.getenv("TESTTHAT_PKG")
  if (nzchar(tested_package) &&
        identical(Sys.getenv("NOT_CRAN"), "true") &&
        rlang::env_name(topenv(env)) == rlang::env_name(rlang::ns_env(tested_package))) {
    warn_deprecated(msg, id)
    return(invisible(NULL))
  }

  rlang::signal(msg, "lifecycle_soft_deprecated")
}

warn_deprecated <- function(msg, id = msg) {
  msg <- .rlang_lifecycle_validate_message(msg)
  stopifnot(rlang::is_string(id))

  if (rlang::is_true(rlang::peek_option("lifecycle_disable_warnings"))) {
    return(invisible(NULL))
  }

  if (!rlang::is_true(rlang::peek_option("lifecycle_repeat_warnings")) &&
        rlang::env_has(.rlang_lifecycle_deprecation_env, id)) {
    return(invisible(NULL))
  }

  rlang::env_poke(.rlang_lifecycle_deprecation_env, id, TRUE);

  has_colour <- function() rlang::is_installed("crayon") && crayon::has_color()
  silver <- function(x) if (has_colour()) crayon::silver(x) else x

  if (rlang::is_true(rlang::peek_option("lifecycle_warnings_as_errors"))) {
    .Signal <- stop_defunct
  } else {
    .Signal <- .Deprecated
  }

  if (!rlang::is_true(rlang::peek_option("lifecycle_repeat_warnings"))) {
    msg <- paste0(msg, "\n", silver("This warning is displayed once per session."))
  }

  .Signal(msg = msg)
}
.rlang_lifecycle_deprecation_env <- new.env(parent = emptyenv())

stop_defunct <- function(msg) {
  msg <- .rlang_lifecycle_validate_message(msg)
  err <- rlang::cnd(
    c("defunctError", "error", "condition"),
    old = NULL,
    new = NULL,
    package = NULL,
    message = msg
  )
  stop(err)
}

local_lifecycle_silence <- function(frame = rlang::caller_env()) {
  rlang::local_options(.frame = frame,
    lifecycle_disable_warnings = TRUE
  )
}
with_lifecycle_silence <- function(expr) {
  local_lifecycle_silence()
  expr
}

local_lifecycle_warnings <- function(frame = rlang::caller_env()) {
  rlang::local_options(.frame = frame,
    lifecycle_disable_warnings = FALSE,
    lifecycle_verbose_soft_deprecation = TRUE,
    lifecycle_repeat_warnings = TRUE
  )
}
with_lifecycle_warnings <- function(expr) {
  local_lifecycle_warnings()
  expr
}

local_lifecycle_errors <- function(frame = rlang::caller_env()) {
  local_lifecycle_warnings(frame = frame)
  rlang::local_options(.frame = frame,
    lifecycle_warnings_as_errors = TRUE
  )
}
with_lifecycle_errors <- function(expr) {
  local_lifecycle_errors()
  expr
}

.rlang_lifecycle_validate_message <- function(msg) {
  stopifnot(rlang::is_character(msg))
  paste0(msg, collapse = "\n")
}

# nocov end
