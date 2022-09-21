#' Splice objects and lists of objects into a list
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' This function was deprecated in purrr 1.0.0 because we no longer believe that
#' this style of implicit/automatic splicing is a good idea; instead use
#' `rlang::list2()` + `!!!` or [list_flatten()].
#'
#' `splice()` splices all arguments into a list. Non-list objects and lists
#' with a S3 class are encapsulated in a list before concatenation.
#'
#' @param ... Objects to concatenate.
#' @return A list.
#' @keywords internal
#' @examples
#' inputs <- list(arg1 = "a", arg2 = "b")
#'
#' # splice() concatenates the elements of inputs with arg3
#' splice(inputs, arg3 = c("c1", "c2")) |> str()
#' list(inputs, arg3 = c("c1", "c2")) |> str()
#' c(inputs, arg3 = c("c1", "c2")) |> str()
#' @export
splice <- function(...) {
  lifecycle::deprecate_soft("1.0.0", "splice()", "list_flatten()")

  splice_if(list(...), is_bare_list)
}

splice_if <- function(.x, .p) {
  unspliced <- !where_if(.x, .p)
  out <- modify_if(.x, unspliced, list)
  list_flatten(out, name_spec = "{inner}")
}
