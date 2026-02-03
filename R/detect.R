#' Find the value or position of the first match
#'
#' @inheritParams keep
#' @inheritParams map
#' @param .f A function, specified in one of the following ways:
#'
#'   * A named function, e.g. `mean`.
#'   * An anonymous function, e.g. `\(x) x + 1` or `function(x) x + 1`.
#'   * A formula, e.g. `~ .x + 1`. Use `.x` to refer to the first argument. No
#'     longer recommended.
#'   * A string, integer, or list, e.g. `"idx"`, `1`, or `list("idx", 1)` which
#'     are shorthand for `\(x) pluck(x, "idx")`, `\(x) pluck(x, 1)`, and
#'     `\(x) pluck(x, "idx", 1)` respectively. Optionally supply `.default` to
#'     set a default value if the indexed element is `NULL` or does not exist.
#' @param .dir If `"forward"`, the default, starts at the beginning of
#'   the vector and move towards the end; if `"backward"`, starts at
#'   the end of the vector and moves towards the beginning.
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
#' # Since `.f` is passed to as_mapper(), you can supply a pluck object:
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
  .default = NULL
) {
  index <- which_satisfies_predicate(.x, .p = .f, ..., .dir = .dir, .negate = FALSE, .p_arg_name = ".f")
  if (index == 0) .default else .x[[index]]
}

#' @export
#' @rdname detect
detect_index <- function(.x, .f, ..., .dir = c("forward", "backward")) {
  which_satisfies_predicate(.x, .p = .f, ..., .dir = .dir, .negate = FALSE, .p_arg_name = ".f")
}

#' Which element satisfies a predicate?
#'
#' @inheritParams detect_index
#' @param .negate If `TRUE`, this function finds the first element that
#'  _doesn't_ satisfy the predicate instead.
#' @param .p_arg_name Name of the `.p` argument in the caller function.
#'  Used to handle the fact that `detect()` and `detect_index()` use `.f`
#'  instead of expected `p`.
#'
#' @return The position of the matching item; if no match, 0.
#'
#' @noRd
which_satisfies_predicate <- function(
  .x,
  .p,
  ...,
  .dir = c("forward", "backward"),
  .negate = FALSE,
  .p_arg_name = ".p",
  .purrr_user_env = caller_env(2),
  .purrr_error_call = caller_env()
) {
  left <- arg_match0(.dir, c("forward", "backward")) == "forward"
  # Not using `as_predicate()` as R level predicate result checks are too slow.
  # Checks are done at the C level instead (#1169).
  .p <- as_mapper(.p, ...)

  # Consistent with `map()`
  .x <- vctrs_vec_compat(.x, .purrr_user_env)
  obj_check_vector(.x, arg = ".x", call = .purrr_error_call)

  n <- vec_size(.x)

  i <- 0L

  # We refer to `.p`, `.x`, `i`, `...`, `.p_arg_name`, and `.purrr_error_call` all from C level
  .Call(detect_index_impl, environment(), n, i, left, .negate)
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
