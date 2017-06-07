#' Splice objects and lists of objects into a list
#'
#' This splices all arguments into a list. Non-list objects and lists
#' with a S3 class are encapsulated in a list before concatenation.
#'
#' @param ... Objects to concatenate.
#' @return A list.
#' @export
#' @examples
#' inputs <- list(arg1 = "a", arg2 = "b")
#'
#' # splice() concatenates the elements of inputs with arg3
#' splice(inputs, arg3 = c("c1", "c2")) %>% str()
#' list(inputs, arg3 = c("c1", "c2")) %>% str()
#' c(inputs, arg3 = c("c1", "c2")) %>% str()
splice <- function(...) {
  splice_if(list(...), is_bare_list)
}

splice_if <- function(.x, .p) {
  unspliced <- !probe(.x, .p)
  out <- modify_if(.x, unspliced, list)

  # Copy outer names to inner
  if (!is.null(names(.x))) {
    out[unspliced] <- map2(out[unspliced], names(out)[unspliced], set_names)
  }

  flatten(out)
}
