#' Combine list elements into a single data structure
#'
#' @description
#' * `list_c()` combines elements into a vector by concatenating them together
#'   with [vctrs::vec_c()].
#'
#' * `list_rbind()` combines elements into a data frame by row-binding them
#'   together with [vctrs::vec_rbind()].
#'
#' * `list_cbind()` combines elements into a data frame by column-binding them
#'   together with [vctrs::vec_cbind()].
#'
#' @param x A list.
#' @param ptype An optional prototype to ensure that the output type is always
#'   the same.
#' @param size An optional integer size to ensure that every input has the
#'   same size (i.e. number of rows).
#' @param name_repair One of `"unique"`, `"universal"`, or `"check_unique"`.
#'   See [vctrs::vec_as_names()] for the meaning of these options.
#' @export
#' @examples
#' x1 <- list(a = 1, b = 2, c = 3)
#' list_c(x1)
#'
#' x2 <- list(
#'   data.frame(x = 1:2),
#'   data.frame(y = "a")
#' )
#' list_rbind(x2)
#' list_cbind(x2)
list_c <- function(x, ptype = NULL) {
  check_is_list(x)
  vctrs::vec_unchop(x, ptype = ptype)
}

#' @export
#' @rdname list_c
list_cbind <- function(
    x,
    name_repair = c("unique", "universal", "check_unique"),
    size = NULL
  ) {
  check_is_list(x)
  vctrs::vec_cbind(!!!x, .name_repair = name_repair, .size = size)
}

#' @export
#' @rdname list_c
list_rbind <- function(x, id = NULL, ptype = NULL) {
  check_is_list(x)
  vctrs::vec_rbind(!!!x, .names_to = id, .ptype = ptype)
}

check_is_list <- function(x, error_call = caller_env()) {
  if (!vctrs::vec_is_list(x)) {
    cli::cli_abort(
      "{.arg x} must be a list, not {friendly_type_of(x)}",
      call = error_call
    )
  }
}
