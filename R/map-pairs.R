#' Apply a binary function sequentially on a list.
#'
#' \code{map_neighbours()} applies \code{.f} to all sequential pairs
#' of the elements of \code{.x}.
#'
#' \code{probe_neighbours()} is similar but applies a predicate
#' function \code{.p} and return a logical
#' vector. \code{every_neighbours()} checks that a predicate function
#' returns \code{TRUE} on all pairs. \code{some_neighbours()} checks
#' that at least one pair returns \code{TRUE}.
#' @param .x A list or vector.
#' @param .f A function of at least two arguments.
#' @param .p A predicate function of at least two arguments.
#' @param ... Additional arguments passed on to \code{.f} or \code{.p}.
#' @return A list for \code{map_neighbours()}, a logical vector for
#' \code{probe_neighbours()}, \code{TRUE} or \code{FALSE} for
#' \code{every_neighbours()} and \code{some_neighbours()}.
#' @seealso \code{\link{map_pairs}()} and \code{\link{probe_pairs}()}.
#' @export
#' @examples
#' # map_neighbours() is particularly useful to check that all
#' # elements of a list are identical:
#' l <- list(list("a"), list("b", "c"), list("a"), list("a"))
#' l %>% map_neighbours(identical) %>% map_call(all)
#' l[-2] %>% map_neighbours(identical) %>% map_call(all)
#'
#' # Since identical() is a binary predicate function, you can also
#' # use probe_neighbours()
#' l %>% probe_neighbours(identical) %>% all()
#'
#' # Even more succintly:
#' l %>% every_neighbours(identical)
map_neighbours <- function(.x, .f, ...) {
  if (length(.x) < 2) {
    stop(".x should have at least 2 elements")
  }
  seq <- seq_along(.x)[-length(.x)] %>%
    lapply(function(x) c(x, x+1))
  lapply(seq, function(index) {
    .f(.x[[index[1]]], .x[[index[2]]], ...)
  })
}

#' @rdname map_neighbours
#' @export
probe_neighbours <- function(.x, .p, ...) {
  out <- map_neighbours(.x, .p, ...)
  all_logical <- vapply(out, is_logical, logical(1)) %>% all()
  if (!all_logical) {
    stop(".p should be a predicate function", call. = FALSE)
  }
  unlist(out)
}

#' @rdname map_neighbours
#' @export
every_neighbours <- function(.x, .p, ...) {
  out <- probe_neighbours(.x, .p, ...)
  all(out)
}

#' @rdname map_neighbours
#' @export
some_neighbours <- function(.x, .p, ...) {
  out <- probe_neighbours(.x, .p, ...)
  any(out)
}

#' @rdname map_neighbours
#' @usage NULL
#' @export
map_neighbors <- map_neighbours

#' @rdname map_neighbours
#' @usage NULL
#' @export
probe_neighbors <- probe_neighbours

#' @rdname map_neighbours
#' @usage NULL
#' @export
every_neighbors <- every_neighbours

#' @rdname map_neighbours
#' @usage NULL
#' @export
some_neighbors <- some_neighbours


#' Apply a binary function to pairs of list elements
#'
#' Apply a binary function to pairs of the elements of \code{.x}. The
#' pairs are generated with \code{\link{cross_n}()} and can be
#' filtered using the \code{.filter} argument. The default filter
#' leaves only unique combinations. The elements of the combinations
#' are recorded for each element of the returned list in the
#' \code{parent} attribute.
#'
#' \code{probe_pairs()} is similar but applies a predicate function
#' \code{.p} and returns a logical vector. \code{every_pair()} checks
#' that a predicate function returns \code{TRUE} on all
#' pairs. \code{some_pairs()} checks that at least one pair returns
#' \code{TRUE}.
#' @inheritParams map_neighbours
#' @param .filter A predicate function passed on to \code{cross_n()}
#' to filter out unwanted combinations of the elements of
#' \code{.x}. When \code{NULL}, all combinations are kept.
#' @return A list for \code{map_pairs()}, a logical vector for
#' \code{probe_pairs()}, \code{TRUE} or \code{FALSE} for
#' \code{every_pairs()} and \code{some_pairs()}.
#' @seealso \code{\link{map_neighbours}()} and
#' \code{\link{probe_neighbours}()}.
#' @export
#' @examples
#' l <- as.list(1:5)
#' map_pairs(l, sum) %>% str()
#' probe_pairs(l, `==`, .filter = NULL) %>% str()
map_pairs <- function(.x, .f, ..., .filter = `>=`) {
  if (length(.x) < 2) {
    stop(".x should have at least 2 elements")
  }
  seq_n <- seq_along(.x)
  names <- names(.x) %||% seq_n
  ids <- cross(seq_n, seq_n, .filter = .filter)

  pairs <- ids %>%
    at_depth(2, function(index) .x[[index]]) %>%
    lapply(smash(.f, ...))
  pairs <- Map(function(pair, id) {
    attr(pair, "parent") <- id
    pair
  }, pairs, ids)

  pairs
}

#' @rdname map_pairs
#' @export
probe_pairs <- function(.x, .p, ..., .filter = `>=`) {
  out <- map_pairs(.x, .p, ..., .filter = .filter)
  all_logical <- vapply(out, is_logical, logical(1)) %>% all()
  if (!all_logical) {
    stop(".p should be a predicate function", call. = FALSE)
  }
  unlist(out)
}

#' @rdname map_pairs
#' @export
every_pair <- function(.x, .p, ..., .filter = `>=`) {
  out <- probe_pairs(.x, .p, ..., .filter = .filter)
  all(out)
}

#' @rdname map_pairs
#' @export
some_pairs <- function(.x, .p, ..., .filter = `>=`) {
  out <- probe_pairs(.x, .p, ..., .filter = .filter)
  any(out)
}
