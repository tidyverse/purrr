#' Produce all combinations of list elements
#'
#' \code{cross} returns the product set of the elements of
#' \code{.x}. It is similar to \code{expand.grid} but it takes and
#' returns a list.
#'
#' @seealso expand.grid
#' @param .x A list.
#' @export
#' @examples
#' # We build all combinations of names, greetings and separators from our
#' # list of data and pass each one to paste()
#' data <- list(
#'   id = c("John", "Jane"),
#'   greeting = c("Hello.", "Bonjour."),
#'   sep = c("! ", "... ")
#' )
#' args <- cross(data)
#'
#' out <- vector("list", length(args[[1]]))
#' for (i in seq_along(out))
#'   out[[i]] <- map(args, i) %>% splat(paste)()
#' out
cross <- function(.x) {
  remaining <- prod(vapply(.x, length, numeric(1)))

  if (remaining == 0) {
    list()

  } else {
    out <- vector("list", length(.x))
    names(out) <- names(.x)
    rep_factor <- 1

    for (i in seq_along(.x)) {
      x <- .x[[i]]
      x_length <- length(x)
      remaining <- remaining / x_length

      seq <- rep.int(seq_len(x_length), rep.int(rep_factor, x_length))
      seq <- rep.int(seq, remaining)
      rep_factor <- rep_factor * x_length

      out[[i]] <- x[seq]
    }

    out
  }
}
