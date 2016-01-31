#' Map a function over lower levels of a nested list
#'
#' \code{at_depth()} maps a function on lower levels of nested
#' lists. In essence, \code{at_depth()} is a recursive map.
#'
#' \itemize{
#'  \item \code{x \%>\% at_depth(0, fun)} is equivalent to \code{fun(x)}.
#'  \item \code{x \%>\% at_depth(1, fun)} is equivalent to \code{map(x, fun)}.
#'  \item \code{x \%>\% at_depth(2, fun)} is equivalent to \code{map(x, . \%>\% map(fun))}.
#' }
#'
#' @inheritParams map
#' @inheritParams as_function
#' @param .x A deep list
#' @param .depth Level of \code{.x} to map on.
#' @export
#' @examples
#' l1 <- list(
#'   obj1 = list(
#'     prop1 = list(param1 = 1:2, param2 = 3:4),
#'     prop2 = list(param1 = 5:6, param2 = 7:8)
#'   ),
#'   obj2 = list(
#'     prop1 = list(param1 = 9:10, param2 = 11:12),
#'     prop2 = list(param1 = 13:14, param2 = 15:16)
#'   )
#' )
#'
#' # In the above list, "obj" is level 1, "prop" is level 2 and "param"
#' # is level 3. To apply sum() on all params, we map it at depth 3:
#' l1 %>% at_depth(3, sum)
#'
#' # map() lets us pluck the elements prop1/param2 in obj1 and obj2:
#' l1 %>% map(c("prop1", "param2")) %>% str()
#'
#' # But what if we want to pluck all param2 elements? Then we need to
#' # act at a lower level:
#' l1 %>% at_depth(2, "param2") %>% str()
#'
#'
#' # at_depth can be used in a complementary way with other purrr
#' # functions to make them operate at a lower level
#' l2 <- list(
#'   obj1 = list(
#'     prop1 = list(c(1, 2), c(3, 4), c(5, 6)),
#'     prop2 = list(c("a", "b"), c("c", "d"), c("e", "f"))
#'   ),
#'   obj2 = list(
#'     prop1 = list(c(10, 20), c(30, 40), c(50, 60)),
#'     prop2 = list(c("A", "B"), c("C", "D"), c("E", "F"))
#'   )
#' )
#'
#' # Here we ask pmap() to map paste() simultaneously over all
#' # elements of the objects at the second level. paste() is thus
#' # effectively mapped at level 3.
#' l2 %>% at_depth(2, pmap, paste, sep = " / ")
at_depth <- function(.x, .depth, .f, ...) {
  .f <- as_function(.f, ...)

  recurse <- function(x, depth) {
    if (depth > 1) {
      if (is.atomic(x)) {
        stop("List not deep enough", call. = FALSE)
      }
      lapply(x, recurse, depth = depth - 1)

    } else {
      lapply(x, .f, ...)
    }
  }

  if (.depth == 0) {
    .f(.x, ...)
  } else if (.depth > 0) {
    recurse(.x, .depth)
  } else {
    stop(".depth cannot be negative", call. = FALSE)
  }
}
