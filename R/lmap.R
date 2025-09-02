#' Apply a function to list-elements of a list
#'
#' @description
#' `lmap()`, `lmap_at()` and `lmap_if()` are similar to `map()`, `map_at()` and
#' `map_if()`, except instead of mapping over `.x[[i]]`, they instead map over
#' `.x[i]`.
#'
#' This has several advantages:
#'
#' * It makes it possible to work with functions that exclusively take a list.
#' * It allows `.f` to access the attributes of the encapsulating list,
#'   like [names()].
#' * It allows `.f` to return a larger or small list than it receives
#'   changing the size of the output.
#'
#' @param .x A list or data frame.
#' @param .f A function that takes a length-1 list and returns a list (of any
#'   length.)
#' @inheritParams map_if
#' @inheritParams map_at
#' @inheritParams map
#' @return A list or data frame, matching `.x`. There are no guarantees about
#'   the length.
#' @family map variants
#' @export
#' @examples
#' set.seed(1014)
#'
#' # Let's write a function that returns a larger list or an empty list
#' # depending on some condition. It also uses the input name to name the
#' # output
#' maybe_rep <- function(x) {
#'   n <- rpois(1, 2)
#'   set_names(rep_len(x, n), paste0(names(x), seq_len(n)))
#' }
#'
#' # The output size varies each time we map f()
#' x <- list(a = 1:4, b = letters[5:7], c = 8:9, d = letters[10])
#' x |> lmap(maybe_rep) |> str()
#'
#' # We can apply f() on a selected subset of x
#' x |> lmap_at(c("a", "d"), maybe_rep) |> str()
#'
#' # Or only where a condition is satisfied
#' x |> lmap_if(is.character, maybe_rep) |> str()
lmap <- function(.x, .f, ...) {
  lmap_helper(.x, rep(TRUE, length(.x)), .f, ...)
}

#' @rdname lmap
#' @export
lmap_if <- function(.x, .p, .f, ..., .else = NULL) {
  where <- where_if(.x, .p)
  lmap_helper(.x, where, .f, ..., .else = .else)
}

#' @rdname lmap
#' @export
lmap_at <- function(.x, .at, .f, ...) {
  where <- where_at(.x, .at, user_env = caller_env())
  lmap_helper(.x, where, .f, ...)
}

lmap_helper <- function(
  .x,
  .ind,
  .f,
  ...,
  .else = NULL,
  .purrr_error_call = caller_env()
) {
  .f <- rlang::as_function(.f, call = .purrr_error_call)
  if (!is.null(.else)) {
    .else <- rlang::as_function(.else, call = .purrr_error_call)
  }

  out <- vector("list", length(.x))
  for (i in seq_along(.x)) {
    if (.ind[[i]]) {
      res <- .f(.x[i], ...)
    } else if (is.null(.else)) {
      res <- .x[i]
    } else {
      res <- .else(.x[i], ...)
    }

    if (!is.list(res)) {
      cli::cli_abort(
        "{.code .f(.x[[{i}]])} must return a list, not {.obj_type_friendly {res}}.",
        call = .purrr_error_call
      )
    }
    out[[i]] <- res
  }

  if (is.data.frame(.x)) {
    out <- lapply(out, as.data.frame)
    list_cbind(out)
  } else {
    list_flatten(out)
  }
}
