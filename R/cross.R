#' Produce all combinations of list elements
#'
#' \code{cross} returns the product set of the elements of
#' \code{.x}. It is similar to \code{expand.grid} but it takes and
#' returns a list and the output is more amenable to mapping
#' operations.
#'
#' @seealso expand.grid
#' @param .x A list.
#' @param .wide If \code{TRUE}, returns a list of unique combinations.
#'   If \code{FALSE}, returns a list of the same size as \code{.x}
#'   (this format is equivalent to \code{as.list(expand.grid(.x))}).
#' @export
#' @examples
#' # We build all combinations of names, greetings and separators from our
#' # list of data and pass each one to paste()
#' data <- list(
#'   id = c("John", "Jane"),
#'   greeting = c("Hello.", "Bonjour."),
#'   sep = c("! ", "... ")
#' )
#'
#' cross(data) %>%
#'   map(splat(paste))
#'
#' # This is equivalent to:
#' args <- cross(data, .wide = FALSE)
#'
#' out <- vector("list", length(args[[1]]))
#' for (i in seq_along(out))
#'   out[[i]] <- map(args, i) %>% splat(paste)()
#' out
cross <- function(.x, .wide = TRUE) {
  remaining <- prod(vapply(.x, length, numeric(1)))

  if (remaining == 0) {
    return(list())
  }

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

  if (.wide) {
    unzip(out) %>% map(as.list)
  } else {
    out
  }
}
