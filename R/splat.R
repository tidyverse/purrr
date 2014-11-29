#' `Splat' arguments to a function.
#'
#' Wraps a function in \code{\link{do.call}()}, so instead of taking multiple
#' arguments, it takes a single named list which will be interpreted as its arguments.
#' This is useful when you want to pass a function a row of data frame or
#' list, and don't want to manually pull it apart in your function.
#'
#' @param .f Function to splat.
#' @return A function.
#' @export
#' @examples
#' x <- list(x = c(1:100, NA, 1000), na.rm = TRUE, trim = 0.9)
#' splat(mean)(x)
#'
#' # Or in a pipe:
#' mean %>% splat() %>% invoke(x)
splat <- function (.f) {
  force(.f)
  function(args = list()) {
    do.call(.f, args)
  }
}

