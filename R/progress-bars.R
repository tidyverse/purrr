
#' Progress bars in purrr
#'
#' Some purrr functions have a `.progress` argument, that you can use to
#' create a progress bar.
#'
#' Possible values for `.progress`:
#'
#' * `NULL`: This is the default. purrr does not create a progress bar.
#' * `FALSE`: A synonym of `NULL`. purrr does not create a progress bar.
#' * `TRUE`: purrr creates a progress bar with the default settings and
#'   without a name.
#' * A character scalar. Used as the name of the progress bar, which
#'   otherwise has the default settings.
#' * A named list of progress bar parameters, see below.
#'
#' ## Progress bar parameters
#'
#' * `clear`: whether to remove the progress bar from the screen after
#'   termination. Defaults to `TRUE`.
#' * `format`: format string. This overrides the detault format string of
#'   the progress bar type. It must be given for the `custom` type.
#'   Format strings may contain R expressions to evaluate in braces.
#'   They support cli [pluralization][cli::pluralization], and
#'   [styling][inline-markup] and they can contain special
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
#'   * `iterator`: the detault, a for loop or a mapping function,
#'   * `tasks`: a (typically small) number of tasks,
#'   * `download`: download of one file,
#'   * `custom`: custom type, `format` must not be `NULL` for this type.
#'   The default display is different for each progress bar type.
#'
#' ## Naming your progress bars
#'
#' It is good practice to name your progress bars, to make it clear what
#' calculation or process they belong to. It is best to keep the names
#' shorter than 20 characters, so the whole progress bar fits comfortably
#' on narrower displays as well.
#'
#' ## Further documentation
#'
#' See [Introduction to progress bars in cli](https://cli.r-lib.org/articles/progress.html)
#' and [Advanced cli progress bars](https://cli.r-lib.org/articles/progress-advanced.html)
#' in the cli documentation.
#'
#' @name progress_bars
NULL
