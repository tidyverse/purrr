#' Apply a function to list-elements of a list
#'
#' `lmap()`, `lmap_at()` and `lmap_if()` are similar to
#' `map()`, `map_at()` and `map_if()`, with the
#' difference that they operate exclusively on functions that take
#' \emph{and} return a list (or data frame). Thus, instead of mapping
#' the elements of a list (as in \code{.x[[i]]}), they apply a
#' function `.f` to each subset of size 1 of that list (as in
#' `.x[i]`). We call those elements `list-elements`).
#'
#' Mapping the list-elements `.x[i]` has several advantages. It
#' makes it possible to work with functions that exclusively take a
#' list or data frame. It enables `.f` to access the attributes
#' of the encapsulating list, like the name of the components it
#' receives. It also enables `.f` to return a larger list than
#' the list-element of size 1 it got as input. Conversely, `.f`
#' can also return empty lists. In these cases, the output list is
#' reshaped with a different size than the input list `.x`.
#' @param .x A list or data frame.
#' @param .f A function that takes and returns a list or data frame.
#' @inheritParams map_if
#' @inheritParams map_at
#' @inheritParams map
#' @return If `.x` is a list, a list. If `.x` is a data
#'   frame, a data frame.
#' @family map variants
#' @export
#' @examples
#' # Let's write a function that returns a larger list or an empty list
#' # depending on some condition. This function also uses the names
#' # metadata available in the attributes of the list-element
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
#' x %>% lmap(maybe_rep)
#'
#' # We can apply f() on a selected subset of x
#' x %>% lmap_at(c("a", "d"), maybe_rep)
#'
#' # Or only where a condition is satisfied
#' x %>% lmap_if(is.character, maybe_rep)
#'
#'
#' # A more realistic example would be a function that takes discrete
#' # variables in a dataset and turns them into disjunctive tables, a
#' # form that is amenable to fitting some types of models.
#'
#' # A disjunctive table contains only 0 and 1 but has as many columns
#' # as unique values in the original variable. Ideally, we want to
#' # combine the names of each level with the name of the discrete
#' # variable in order to identify them. Given these requirements, it
#' # makes sense to have a function that takes a data frame of size 1
#' # and returns a data frame of variable size.
#' disjoin <- function(x, sep = "_") {
#'   name <- names(x)
#'   x <- as.factor(x[[1]])
#'
#'   out <- lapply(levels(x), function(level) {
#'     as.numeric(x == level)
#'   })
#'
#'   names(out) <- paste(name, levels(x), sep = sep)
#'   out
#' }
#'
#' # Now, we are ready to map disjoin() on each categorical variable of a
#' # data frame:
#' iris %>% lmap_if(is.factor, disjoin)
#' mtcars %>% lmap_at(c("cyl", "vs", "am"), disjoin)
lmap <- function(.x, .f, ...) {
  lmap_at(.x, seq_along(.x), .f, ...)
}

#' @rdname lmap
#' @export
lmap_if <- function(.x, .p, .f, ..., .else = NULL) {
  sel <- probe(.x, .p)

  .x <- lmap_at(.x, which(sel), .f, ...)

  if (!is_null(.else)) {
    .x <- lmap_at(.x, which(!sel), .else, ...)
  }

  .x
}

#' @rdname lmap
#' @export
lmap_at <- function(.x, .at, .f, ...) {
  if (is_formula(.f)) {
    .f <- as_mapper(.f, ...)
  }

  where <- at_selection(names(.x), .at)
  sel <- inv_which(.x, where)

  out <- vector("list", length(.x))
  for (i in seq_along(.x)) {
    res <-
      if (sel[[i]]) {
        .f(.x[i], ...)
      } else {
        .x[i]
      }
    stopifnot(is.list(res))
    out[[i]] <- res
  }

  maybe_as_data_frame(flatten(out), .x)
}
