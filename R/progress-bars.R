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
