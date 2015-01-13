#' `Smash' a function open to make it take a list of arguments.
#'
#' Wraps a function in \code{\link{do.call}()}, so instead of taking
#' multiple arguments, it takes a single named list which will be
#' interpreted as its arguments. This is useful when you want to pass
#' a function a row of data frame or list, and don't want to manually
#' pull it apart in your function. You can also specify default
#' arguments for \code{.f} in the call to \code{smash()}.
#'
#' @param .f Function to smash.
#' @param ... Default arguments for \code{.f}. These will be evaluated
#' once when \code{smash()} is called.
#' @return A function.
#' @seealso map_call do.call
#' @export
#' @examples
#' x <- list(x = c(1:100, NA, 1000), na.rm = TRUE, trim = 0.9)
#' smash(mean)(x)
#'
#' # Or in a pipe:
#' mean %>% smash() %>% invoke(x)
#'
#' # Default arguments can also be specified directly in smash()
#' c(1:100, NA, 1000) %>% smash(mean, na.rm = TRUE)()
#'
#' # Note that when a smashed function gets a vector, it is wrapped
#' # in a list. The above is equivalent to
#' list(c(1:100, NA, 1000)) %>% smash(mean, na.rm = TRUE)()
smash <- function (.f, ...) {
  force(.f)
  defaults <- list(...)
  function(args = list()) {
    do.call(".f", enlist(args, defaults))
  }
}

#' Map a list to a function call
#'
#' While `smash()` wraps a function in \code{\link{do.call}()},
#' `map_call()` is directly equivalent to \code{do.call()} except that
#' it takes a list as first argument instead of a function. This makes
#' `map_call()` pipable.
#' @param .x A list or a vector. Vectors are automatically wrapped in
#'   a list.
#' @param .f A function or the name of a function to call with the
#'   elements of \code{.x} as arguments.
#' @param ... Additional arguments passed on to \code{.f}.
#' @seealso smash do.call
#' @export
#' @examples
#' # We map a list of strings to paste(), with sep = "-" and the
#' # string "2001" as additional arguments
#' list("01", "01") %>%
#'   map(~ sub("^01", "10", .)) %>%
#'   map_call("paste", "2001", sep = "-")
map_call <- function(.x, .f, ...) {
  do.call(.f, enlist(.x, ...))
}
