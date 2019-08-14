#' Find the value or position of the first match
#'
#' @inheritParams map
#' @inheritParams every
#' @param .dir If `"forward"`, the default, starts at the beginning of
#'   the vector and move towards the end; if `"backward"`, starts at
#'   the end of the vector and moves towards the beginning.
#' @param .right Soft-deprecated. Please use `.dir` instead.
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
#' 3:10 %>% detect(is_even)
#' 3:10 %>% detect_index(is_even)
#'
#' 3:10 %>% detect(is_even, .dir = "backward")
#' 3:10 %>% detect_index(is_even, .dir = "backward")
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
detect <- function(.x, .f, ..., .dir = c("forward", "backward"), .right = NULL, .default = NULL) {
  .f <- as_predicate(.f, ..., .mapper = TRUE)
  .dir <- arg_match(.dir, c("forward", "backward"))

  for (i in index(.x, .dir, .right, "detect")) {
    if (.f(.x[[i]], ...)) {
      return(.x[[i]])
    }
  }

  .default
}

#' @export
#' @rdname detect
detect_index <- function(.x, .f, ..., .dir = c("forward", "backward"), .right = NULL) {
  .f <- as_predicate(.f, ..., .mapper = TRUE)
  .dir <- arg_match(.dir, c("forward", "backward"))

  for (i in index(.x, .dir, .right, "detect_index")) {
    if (.f(.x[[i]], ...)) {
      return(i)
    }
  }

  0L
}

index <- function(x, dir, right = NULL, fn) {
  if (!is_null(right)) {
    signal_soft_deprecated(env = caller_env(2), paste_line(
      sprintf("The `.right` argument of `%s` is soft-deprecated as of purrr 0.3.0.", fn),
      "Please use the new `.dir` argument instead:",
      "",
      "  # Before",
      sprintf("  %s(x, f, .right = TRUE)", fn),
      "",
      "  # After",
      sprintf("  %s(x, f, .dir = \"backward\")", fn)
    ))
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
#' x %>% has_element(1:10)
#' x %>% has_element(3)
has_element <- function(.x, .y) {
  some(.x, identical, .y)
}
