#' Apply a function to each element of a vector and combine the results
#'
#' These functions are variants of [map()] that combine the results with
#' [list_c()], [list_rbind()], and [list_cbind()] respectively. Compared
#' to `map()`, `.f` can return an output of any length, which means that
#' there's no longer a one-to-one correspondence between each element of the
#' input and each element of the output
#'
#' @inheritParams map
#' @inheritParams list_c
#' @export
#' @examples
#' map(1:3, ~ rep(.x, .x))
#' map_c(1:3, ~ rep(.x, .x))
map_c <- function(.x, .f, ..., .ptype = NULL) {
  out <- map(.x, .f, ...)
  list_c(out, ptype = .ptype)
}

#' @export
#' @rdname map_c
map_rbind <- function(.x, .f, ..., .id = NULL, .ptype = NULL) {
  out <- map(.x, .f, ...)
  list_rbind(out, id = .id, ptype = .ptype)
}

#' @export
#' @rdname map_c
map_cbind <- function(.x, .f, ..., .name_repair = c("unique", "universal", "check_unique"), .size = NULL) {
  out <- map(.x, .f, ...)
  list_cbind(out, name_repair = .name_repair, size = .size)
}
