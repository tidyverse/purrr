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
#'   only contain only data frames or `NULL`.
#' @param ptype An optional prototype to ensure that the output type is always
#'   the same.
#' @param names_to By default, `names(x)` are lost. To keep them, supply a
#'   string to `names_to` and the names will be saved into a column with that
#'   name. If `names_to` is supplied and `x` is not named, the position of
#'   the elements will be used instead of the names.
#' @param size An optional integer size to ensure that every input has the
#'   same size (i.e. number of rows).
#' @param name_repair One of `"unique"`, `"universal"`, or `"check_unique"`.
#'   See [vctrs::vec_as_names()] for the meaning of these options.
#' @param keep_empty  An optional logical. If FALSE (the default), then the empty element is silently ignored;
#'  if TRUE, then the empty element is kept as an NA`.
#' @inheritParams rlang::args_dots_empty
#' @export
#' @examples
#' x1 <- list(a = 1, b = 2, c = 3)
#' list_c(x1)
#'
#' x2 <- list(
#'   a = data.frame(x = 1:2),
#'   b = data.frame(y = "a"),
#'   c = NULL)
#' )
#' list_rbind(x2)
#' list_rbind(x2, names_to = "id")
#' list_rbind(x2, names_to = "id", keep_empty = TRUE)
#' list_rbind(unname(x2), names_to = "id")
#' list_cbind(x2)
#' list_cbind(x2, keep_empty = TRUE)
#'
list_c <- function(x, ..., ptype = NULL, keep_empty = FALSE) {
  vec_check_list(x)
  check_dots_empty()

  if(keep_empty) x <- convert_empty_element_to_NA(x)

  # For `list_c()`, we don't expose `list_unchop()`'s `name_spec` arg,
  # and instead strip outer names to avoid collisions with inner names
  x <- unname(x)

  list_unchop(
    x,
    ptype = ptype,
    error_call = current_env()
  )
}

#' @export
#' @rdname list_c
list_cbind <- function(
    x,
    ...,
    name_repair = c("unique", "universal", "check_unique"),
    size = NULL,
    keep_empty = FALSE
  ) {
  check_list_of_data_frames(x)
  check_dots_empty()
  if(keep_empty) x <- convert_empty_element_to_NA(x)

  vec_cbind(!!!x, .name_repair = name_repair, .size = size, .error_call = current_env())
}

#' @export
#' @rdname list_c
list_rbind <- function(x, ..., names_to = rlang::zap(), ptype = NULL, keep_empty = FALSE) {
  check_list_of_data_frames(x)
  check_dots_empty()
  if(keep_empty) x <- convert_empty_element_to_NA(x)

  vec_rbind(!!!x, .names_to = names_to, .ptype = ptype, .error_call = current_env())
}


check_list_of_data_frames <- function(x, error_call = caller_env()) {
  vec_check_list(x, call = error_call)

  is_df_or_null <- map_lgl(x, function(x) is.data.frame(x) || is.null(x))

  if (all(is_df_or_null)) {
    return()
  }

  bad <- which(!is_df_or_null)
  cli::cli_abort(
    c(
      "Each element of {.arg x} must be either a data frame or {.code NULL}.",
      i = "Elements {bad} are not."
    ),
    arg = "x",
    call = error_call
  )
}

## used to convert empty elements into NA for list_binding functions
convert_empty_element_to_NA = function(x) {
  map(x, function(x) if(vctrs::vec_is_empty(x)) NA else x)
}
