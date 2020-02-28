#' Flip the order of the first two arguments of a function
#'
#' @description
#'
#' Flipping the arguments of a function allows you to use a function where the
#' second argument is the more natural input to use with the pipe (%>%)
#' operator.
#'
#' @param .f a function.
#'
#' @return a function where the first two inputs of the input function are
#'     transposed
#'
#' @examples
#' # by default, the rep function repeats each item from the first argument
#' # n times (from the second argument)
#' rep(1:3, 3:1)
#'
#' # using the flip function we instead get n repetitions of the second argument
#' flip(rep)(1:3, 3:1)
#'
#' # we can use the flip function with the imap function to create an
#' # incrementing index where each item is repeated n times
#' imap(c(2, 1, 4), flip(rep)) %>% flatten_int()
#' @export
flip <- function(.f) {
  if (class(.f) != "function") {
    abort(sprintf("`.f` must be a function, not %s", friendly_type_of(.f)))
  }
  function(.x, .y, ...) .f(.y, .x, ...)
}
