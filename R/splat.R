#' `Splat' arguments to a function.
#'
#' Wraps a function in \code{\link{do.call}()}, so instead of taking multiple
#' arguments, it takes a single named list which will be interpreted
#' as its arguments.  This is useful when you want to pass a function
#' a row of data frame or list, and don't want to manually pull it
#' apart in your function. You can also specify default arguments for
#' \code{.f} in the call to \code{splat()}.
#'
#' @param .f Function to splat.
#' @param ... Default arguments for \code{.f}.
#' @return A function.
#' @export
#' @examples
#' x <- list(x = c(1:100, NA, 1000), na.rm = TRUE, trim = 0.9)
#' splat(mean)(x)
#'
#' # Or in a pipe:
#' mean %>% splat() %>% invoke(x)
#'
#' # With functions that take a variable number of main arguments,
#' # like \code{paste()}, it is often easier to specify default
#' # arguments directly in \code{splat()}.
#' c("01", "01", "2001") %>% splat(paste, sep = "-")()
splat <- function (.f, ...) {
  force(.f)
  defaults <- list(...)
  function(args = list()) {
    do.call(.f, c(args, defaults))
  }
}

