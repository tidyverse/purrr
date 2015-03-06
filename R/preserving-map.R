#' Apply a function to list-subsets of a list
#'
#' \code{at_each()}, \code{at()} and \code{where()} are similar to
#' \code{map()}, \code{map_at()} and \code{map_if()} respectively,
#' with the difference that they operate exclusively on functions that
#' take and return a list (or data frame). Thus, instead of mapping
#' the elements of a list (obtained with \code{.x[[i]]}), they apply a
#' function \code{.f} to each subset of size 1 of that list (obtained
#' with \code{.x[i]} and termed `list-subsets').
#'
#' Mapping the list-subsets \code{.x[i]} has several advantages. It
#' makes it possible to work with functions that exclusively take a
#' list or data frame. It enables \code{.f} to access the name of the
#' components it receives. It also enables \code{.f} to return a
#' larger list than the list-subset of size 1 it got as
#' input. Conversely, \code{.f} can also return empty lists. In these
#' cases, the output list is reshaped with a different size than the
#' input list \code{.x}.
#' @param .at A numeric or character vector indicating the positions
#'   or the names of the elements that are to be mapped.
#' @param .f A function that takes and returns a list or data frame.
#' @inheritParams map_if
#' @inheritParams map_at
#' @return If \code{.x} is a list, a list. If \code{.x} is a data
#'   frame, a data frame.
#' @seealso \code{\link{map_at}()}, \code{\link{map_if}()} and
#'   \code{\link{map}()}
#' @name preserving-map
#' @export
#' @examples
#' # Let's write a function that returns a larger list or an empty list
#' # depending on some condition. This function also uses the names
#' # metadata available in the attributes of the list-subset
#' maybe_rep <- function(x) {
#'   n <- rpois(1, 2)
#'   out <- rep_len(x, n)
#'   if (length(out) > 0) {
#'     names(out) <- paste0(names(x), seq_len(n))
#'   }
#'   out
#' }
#'
#' # The output size varies each time we map f()
#' x <- list(a = 1:4, b = letters[5:7], c = 8:9, d = letters[10])
#' x %>% at_each(maybe_rep)
#'
#' # We can apply f() on a selected subset of x
#' x %>% at(c("a", "d"), maybe_rep)
#'
#' # Or only where a condition is satisfied
#' x %>% where(is.character, maybe_rep)
#'
#'
#' # A more realistic example would be a function that takes discrete
#' # variables in a dataset and turns them into disjunctive tables, a
#' # form that is amenable to fitting some types of models.
#'
#' # A disjunctive table contains only 0 and 1 but has as many columns as
#' # unique values in the original variable. It's also nice to combine the
#' # names of each level with the name of the discrete variable so as to
#' # identify them. Given these requirements, it makes sense to have a
#' # function that takes a data frame of size 1 and returns a data frame
#' # of variable size.
#' disjoin <- function(x, sep = "_") {
#'   name <- names(x)
#'   x <- as.factor(x[[1]])
#'
#'   out <- lapply(levels(x), function(level) {
#'     as.numeric(x == level)
#'   })
#'
#'   names(out) <- paste(name, levels(x), sep = sep)
#'   dplyr::as_data_frame(out)
#' }
#'
#' # Now, we are ready to map disjoin() on each categorical variable of a
#' # data frame:
#' iris %>% where(is.factor, disjoin)
#' mtcars %>% at(c("cyl", "vs", "am"), disjoin)
at <- function(.x, .at, .f, ...) {
  if (is_formula(.f)) {
    .f <- as_function(.f)
  }

  if (is.character(.at)) {
    if (is.null(names(.x))) {
      stop(".x is not named", call. = FALSE)
    }
    .at <- match(.at, names(.x))
  }
  if (anyNA(.at)) {
    stop("some indexes are missing", call. =FALSE)
  }

  out <- vector("list", length(.x))
  for (i in seq_along(.x)) {
    res <-
      if (i %in% .at) {
        .f(.x[i], ...)
      } else {
        .x[i]
      }
    stopifnot(is.list(res))
    out[[i]] <- res
  }

  flatten(out) %>% output_hook(.x)
}

#' @rdname preserving-map
#' @export
where <- function(.x, .p, .f, ...) {
  sel <- probe(.x, .p) %>% which()
  .x %>% at(sel, .f, ...)
}

#' @rdname preserving-map
#' @export
at_each <- function(.x, .f, ...) {
  .x %>% at(seq_along(.x), .f, ...)
}
