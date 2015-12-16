#' Split, order and sort lists by their components.
#'
#' @inheritParams map
#' @export
#' @examples
#' l1 <- transpose(list(x = sample(10), y = 1:10))
#' l1
#' l1 %>% order_by("x")
#' l1 %>% sort_by("x")
#'
#' l2 <- rerun(5, g = sample(2, 1), y = rdunif(5, 10))
#' l2 %>% split_by("g") %>% str()
#' l2 %>% split_by("g") %>% map(. %>% map("y"))
split_by <- function(.x, .f, ...) {
  vals <- map(.x, .f, ...)
  split(.x, simplify_all(transpose(vals)))
}

#' @export
#' @rdname split_by
order_by <- function(.x, .f, ...) {
  vals <- map(.x, .f, ...)
  do.call("order", simplify_all(transpose(vals)))
}

#' @export
#' @rdname split_by
sort_by <- function(.x, .f, ...) {
  .x[order_by(.x, .f, ...)]
}
