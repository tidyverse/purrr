#' Progress bars in purrr
#'
#' @description
#' purrr's map functions have a `.progress` argument that you can use to
#' create a progress bar. `.progress` can be:
#'
#' * `FALSE`, the default: does not create a progress bar.
#' * `TRUE`: creates a basic unnamed progress bar.
#' * A string: creates a basic progress bar with the given name.
#' * A named list of progress bar parameters, as described below.
#'
#' It's good practice to name your progress bars, to make it clear what
#' calculation or process they belong to. We recommend keeping the names
#' under 20 characters, so the whole progress bar fits comfortably even on
#' on narrower displays.
#'
#' ## Progress bar parameters
#'
#' * `clear`: whether to remove the progress bar from the screen after
#'   termination. Defaults to `TRUE`.
#' * `format`: format string. This overrides the default format string of
#'   the progress bar type. It must be given for the `custom` type.
#'   Format strings may contain R expressions to evaluate in braces.
#'   They support cli [pluralization][cli::pluralization], and
#'   [styling][cli::inline-markup] and they can contain special
#'   [progress variables][cli::progress-variables].
#' * `format_done`: format string for successful termination. By default
#'   the same as `format`.
#' * `format_failed`: format string for unsuccessful termination.
#'   By default the same as `format`.
#' * `name`: progress bar name. This is by default the empty string and it
#'   is displayed at the beginning of the progress bar.
#' * `show_after`: numeric scalar. Only show the progress bar after this
#'   number of seconds. It overrides the `cli.progress_show_after`
#'   global option.
#' * `type`: progress bar type. Currently supported types are:
#'   * `iterator`: the default, a for loop or a mapping function,
#'   * `tasks`: a (typically small) number of tasks,
#'   * `download`: download of one file,
#'   * `custom`: custom type, `format` must not be `NULL` for this type.
#'   The default display is different for each progress bar type.
#'
#' ## Further documentation
#'
#' purrr's progress bars are powered by cli, so see
#' [Introduction to progress bars in cli](https://cli.r-lib.org/articles/progress.html)
#' and [Advanced cli progress bars](https://cli.r-lib.org/articles/progress-advanced.html)
#' for more details.
#'
#' @name progress_bars
NULL

# Creates a cli progress bar and returns it wrapped in a
# `"purrr_progress_bar"` object, which the C mapping loops tick directly
# instead of creating their own bar. This allows multiple map phases (e.g.
# the predicate and transformation maps in `map_if()`) to share a single
# progress bar. The bar is closed automatically when `env` exits.
as_progress <- function(
  progress,
  total,
  user_env = caller_env(2),
  error_call = caller_env(),
  env = caller_env()
) {
  if (is.null(progress) || inherits(progress, "purrr_progress_bar")) {
    return(progress)
  }
  if (isFALSE(progress)) {
    return(NULL)
  }
  if (!(isTRUE(progress) || is_string(progress) || is.list(progress))) {
    stop_input_type(
      progress,
      c("TRUE", "FALSE", "a string", "a named list"),
      arg = ".progress",
      call = error_call
    )
  }

  opts <- if (isTRUE(progress)) {
    list()
  } else if (is_string(progress)) {
    list(name = progress)
  } else {
    progress
  }
  bar_env <- opts$caller %||% env
  opts$caller <- NULL
  # `show_after` is supported by cli's C API but not the R-level
  # `cli_progress_bar()`; apply it to the bar object directly below
  show_after <- opts$show_after
  opts$show_after <- NULL

  id <- inject(cli::cli_progress_bar(total = total, .envir = bar_env, !!!opts))

  # TODO: Hack! Retrieve cli's internal bar object so that the C loop can
  # tick this bar. Remove once cli provides a way to pass an R-created bar
  # to its C API: https://github.com/r-lib/cli/issues/850
  bar <- utils::getFromNamespace("clienv", "cli")$progress[[id]]
  # The C tick functions read these fields as doubles
  bar$current <- as.double(bar$current)
  bar$tick <- as.double(bar$tick)
  if (!is.null(show_after)) {
    bar$show_after <- bar$start + show_after
    bar$show_50 <- bar$start + show_after / 2
  }

  structure(list(bar = bar, id = id), class = "purrr_progress_bar")
}

# For maps implemented with an R loop (e.g. `lmap()`), which can't be
# ticked from C
progress_tick <- function(progress) {
  if (inherits(progress, "purrr_progress_bar")) {
    cli::cli_progress_update(id = progress$id)
  }
}
