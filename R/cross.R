#' Produce all combinations of list elements
#'
#' \code{cross()} returns the product set of the elements of \code{.x}
#' and \code{.y}. It is similar to \code{expand.grid()} but it returns
#' a list. By default, the cartesian product is returned in wide
#' format. This makes it more amenable to mapping
#' operations. Switching \code{.wide} to \code{FALSE} turns the output
#' to the long format, the equivalent to \code{expand.grid()}'s
#' outputs.
#'
#' \code{cross3()} takes three three arguments instead of two and
#' returns the cartesian product of the elements of the three
#' objects. \code{cross_n()} takes a list \code{.l} and returns the
#' cartesian product of all its elements. If \code{.l} is a data
#' frame, \code{cross_n()} returns a data frame.
#'
#' @seealso expand.grid
#' @param .x,.y,.z Lists or atomic vectors.
#' @param .l A list of lists or atomic vectors.
#' @param .wide If \code{TRUE}, returns a list of unique combinations.
#' If \code{FALSE}, returns a list of the same size as the number of
#' arguments (2 for \code{cross()}, 3 for \code{cross3()},
#' \code{length(.l)} for \code{cross_n()}).
#' @return A list or a data frame.
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
#' data %>% 
#'   cross_n() %>%
#'   map(splat(paste))
#'
#' # For this purpose, the long format is less pratical and requires a loop
#' args <- cross_n(data, .wide = FALSE)
#'
#' out <- vector("list", length(args[[1]]))
#' for (i in seq_along(out))
#'   out[[i]] <- map(args, i) %>% splat(paste)()
#' out
cross <- function(.x, .y, .wide = TRUE) {
  cross_n(list(.x, .y), .wide = .wide)
}

#' @export
#' @rdname cross
cross3 <- function(.x, .y, .z, .wide = TRUE) {
  cross_n(list(.x, .y, .z), .wide = .wide)
}

#' @export
#' @rdname cross
cross_n <- function(.l, .wide = TRUE) {
  n <- length(.l)
  remaining <- prod(vapply(.l, length, numeric(1)))
  rep_factor <- 1

  if (remaining == 0) {
    return(list())
  }

  if (.wide) {
    model <- rep_len(list(NA), n)
    names(model) <- names(.l)
    out <- rep_len(list(model), remaining)
  } else {
    out <- vector("list", n)
    names(out) <- names(.l)
  }


  for (i in seq_len(n)) {
    x <- .l[[i]]
    x_length <- length(x)
    remaining <- remaining / x_length

    seq <- rep.int(seq_len(x_length), rep.int(rep_factor, x_length))
    seq <- rep.int(seq, remaining)
    rep_factor <- rep_factor * x_length

    if (.wide) {
      for (j in seq_along(out)) {
        out[[j]][[i]] <- x[seq][j]
      }
    } else {
      out[[i]] <- x[seq]
    }
  }

  out %>% output_hook(.l)
}
