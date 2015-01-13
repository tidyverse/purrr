#' `Splat' arguments to a function.
#'
#' Wraps a function in \code{\link{do.call}()}, so instead of taking
#' multiple arguments, it takes a single named list which will be
#' interpreted as its arguments. This is useful when you want to pass
#' a function a row of data frame or list, and don't want to manually
#' pull it apart in your function. You can also specify default
#' arguments for \code{.f} in the call to \code{splat()}.
#'
#' @param .f Function to splat.
#' @param ... Default arguments for \code{.f}. These will be evaluated
#' once when \code{splat()} is called.
#' @return A function.
#' @seealso map_call do.call
#' @export
#' @examples
#' x <- list(x = c(1:100, NA, 1000), na.rm = TRUE, trim = 0.9)
#' splat(mean)(x)
#'
#' # Or in a pipe:
#' mean %>% splat() %>% invoke(x)
#'
#' # Default arguments can also be specified directly in splat()
#' c(1:100, NA, 1000) %>% splat(mean, na.rm = TRUE)()
#'
#' # Note that when a splatted function gets a vector, it is wrapped
#' # in a list. The above is equivalent to
#' list(c(1:100, NA, 1000)) %>% splat(mean, na.rm = TRUE)()
splat <- function (.f, ...) {
  force(.f)
  defaults <- list(...)
  function(args = list()) {
    do.call(".f", enlist(args, defaults))
  }
}
