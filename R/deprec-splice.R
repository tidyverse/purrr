#' Splice objects and lists of objects into a list
#'
#' @description
#' `r lifecycle::badge("defunct")`
#'
#' This function was deprecated in purrr 1.0.0 and is now defunct because we no
#' longer believe that this style of implicit/automatic splicing is a good idea;
#' instead use `rlang::list2()` + `!!!` or [list_flatten()].
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
#' # Instead of splice(inputs, arg3 = c("c1", "c2")), use:
#' list(inputs, arg3 = c("c1", "c2")) |> list_flatten() |> str()
#' rlang::list2(!!!inputs, arg3 = c("c1", "c2")) |> str()
#' @export
splice <- function(...) {
  lifecycle::deprecate_stop("1.0.0", "splice()", "list_flatten()")
}
