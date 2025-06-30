#' Find the value or position of the first match
#'
#' @inheritParams keep
#' @inheritParams map
#' @param .f A function, specified in one of the following ways:
#'
#'   * A named function, e.g. `mean`.
#'   * An anonymous function, e.g. `\(x) x + 1` or `function(x) x + 1`.
#'   * A formula, e.g. `~ .x + 1`. You must use `.x` to refer to the first
#'     argument. No longer recommended.
#'   * A string, integer, or list, e.g. `"idx"`, `1`, or `list("idx", 1)` which
#'     are shorthand for `\(x) pluck(x, "idx")`, `\(x) pluck(x, 1)`, and
#'     `\(x) pluck(x, "idx", 1)` respectively. Optionally supply `.default` to
#'     set a default value if the indexed element is `NULL` or does not exist.
#' @param .dir If `"forward"`, the default, starts at the beginning of
#'   the vector and move towards the end; if `"backward"`, starts at
#'   the end of the vector and moves towards the beginning.
#' @param .right `r lifecycle::badge("deprecated")` Please use `.dir` instead.
#' @param .default The value returned when nothing is detected.
#' @return `detect` the value of the first item that matches the
#'  predicate; `detect_index` the position of the matching item.
#'  If not found, `detect` returns `NULL` and `detect_index`
#'  returns 0.
#'
#' @seealso [keep()] for keeping all matching values.
#' @export
#' @examples
#' is_even <- function(x) x %% 2 == 0
#'
#' 3:10 |> detect(is_even)
#' 3:10 |> detect_index(is_even)
#'
#' 3:10 |> detect(is_even, .dir = "backward")
#' 3:10 |> detect_index(is_even, .dir = "backward")
#'
#'
#' # Since `.f` is passed to as_mapper(), you can supply a
#' # lambda-formula or a pluck object:
#' x <- list(
#'   list(1, foo = FALSE),
#'   list(2, foo = TRUE),
#'   list(3, foo = TRUE)
#' )
#'
#' detect(x, "foo")
#' detect_index(x, "foo")
#'
#'
#' # If you need to find all values, use keep():
#' keep(x, "foo")
#'
#' # If you need to find all positions, use map_lgl():
#' which(map_lgl(x, "foo"))
detect <- function(
  .x,
  .f,
  ...,
  .dir = c("forward", "backward"),
  .right = NULL,
  .default = NULL
) {
  .f <- as_predicate(.f, ..., .mapper = TRUE)
  .dir <- arg_match0(.dir, c("forward", "backward"))

  for (i in index(.x, .dir, .right, "detect")) {
    if (.f(.x[[i]], ...)) {
      return(.x[[i]])
    }
  }

  .default
}

#' @export
#' @rdname detect
detect_index <- function(
  .x,
  .f,
  ...,
  .dir = c("forward", "backward"),
  .right = NULL
) {
  .f <- as_predicate(.f, ..., .mapper = TRUE)
  .dir <- arg_match0(.dir, c("forward", "backward"))

  for (i in index(.x, .dir, .right, "detect_index")) {
    if (.f(.x[[i]], ...)) {
      return(i)
    }
  }

  0L
}


index <- function(x, dir, right = NULL, fn) {
  if (!is_null(right)) {
    lifecycle::deprecate_warn(
      when = "0.3.0",
      what = paste0(fn, "(.right)"),
      with = paste0(fn, "(.dir)"),
      always = TRUE
    )
    dir <- if (right) "backward" else "forward"
  }

  idx <- seq_along(x)
  if (dir == "backward") {
    idx <- rev(idx)
  }
  idx
}

#' Does a list contain an object?
#'
#' @inheritParams map
#' @param .y Object to test for
#' @export
#' @examples
#' x <- list(1:10, 5, 9.9)
#' x |> has_element(1:10)
#' x |> has_element(3)
has_element <- function(.x, .y) {
  some(.x, identical, .y)
}
