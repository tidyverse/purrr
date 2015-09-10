#' Split, order and sort lists by their components.
#'
#' @inheritParams map
#' @export
#' @examples
#' l1 <- zip(list(x = sample(10), y = 1:10))
#' l1
#' l1 %>% order_by("x")
#' l1 %>% sort_by("x")
#'
#' l2 <- rerun(5, g = sample(2, 1), y = rdunif(5, 10))
#' l2 %>% split_by("g") %>% str()
#' l2 %>% split_by("g") %>% map(. %>% map("y"))
split_by <- function(.x, .f, ...) {
  vals <- map(.x, .f, ...)
  split(.x, zip(vals, .simplify = TRUE))
}

#' @export
#' @rdname split_by
order_by <- function(.x, .f, ...) {
  vals <- map(.x, .f, ...)
  do.call("order", zip(vals, .simplify = TRUE))
}

#' @export
#' @rdname split_by
sort_by <- function(.x, .f, ...) {
  .x[order_by(.x, .f, ...)]
}
