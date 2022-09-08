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
#' @param x A list. For `list_rbind()` and `list_cbind()` the list must
#'   only contain data frames.
#' @param ptype An optional prototype to ensure that the output type is always
#'   the same.
#' @param id By default, `names(x)` are lost. Alternatively, supply a string
#'   and the names will be saved into a column with name `{id}`. If `id`
#'   is supplied and `x` is not named, the position of the elements will
#'   be used instead of the names.
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
#'   a = data.frame(x = 1:2),
#'   b = data.frame(y = "a")
#' )
#' list_rbind(x2)
#' list_rbind(x2, id = "id")
#' list_rbind(unname(x2), id = "id")
#'
#' list_cbind(x2)
list_c <- function(x, ptype = NULL) {
  vec_check_list(x)
  vctrs::vec_unchop(x, ptype = ptype)
}

#' @export
#' @rdname list_c
list_cbind <- function(
    x,
    name_repair = c("unique", "universal", "check_unique"),
    size = NULL
  ) {
  check_list_of_data_frames(x)

  vctrs::vec_cbind(!!!x, .name_repair = name_repair, .size = size, .call = current_env())
}

#' @export
#' @rdname list_c
list_rbind <- function(x, id = rlang::zap(), ptype = NULL) {
  check_list_of_data_frames(x)

  vctrs::vec_rbind(!!!x, .names_to = id, .ptype = ptype, .call = current_env())
}


check_list_of_data_frames <- function(x, error_call = caller_env()) {
  vec_check_list(x, call = error_call)

  is_df <- map_lgl(x, is.data.frame)

  if (all(is_df)) {
    return()
  }

  bad <- which(!is_df)
  cli::cli_abort(
    "All elements of {.arg x} must be data frames. Elements {bad} are not.",
    call = error_call
  )
}
