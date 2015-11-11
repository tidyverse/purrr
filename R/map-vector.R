#' Map a function and flatten the result by one-level
#'
#' \code{flatmap()} is equivalent to \code{map()} followed by
#' \code{flatten()}. You can also provide \code{.type} to check the
#' resulting type conforms to you expectations.
#'
#' Compared to \code{\link{map_lgl}()}, \code{\link{map_chr}()}, etc,
#' \code{flatmap()} is adapted to functions returning a variable
#' number of elements.
#' @inheritParams map
#' @inheritParams as_function
#' @param .type A string indicating which type you expect the results
#'   of \code{.f} should be. This can be any of the types returned by
#'   \code{\link{typeof}()}, or "numeric" as a shorthand for either
#'   "double" or "integer".
#' @export
#' @seealso \code{\link{map_lgl}()}, \code{\link{map_chr}()},
#'   \code{\link{map_dbl}()}, \code{\link{map_int}()}
#' @examples
#' # Sample a variable number of elements from each column and
#' # concatenate the results
#' var_select <- function(x) sample(x, size = rdunif(1, 5))
#' c(mtcars) %>% flatmap(var_select)
#'
#' # You can also check that the results are of expected type
#' \dontrun{
#' c(mtcars) %>% flatmap(var_select, .type = "character")
#' }
#' c(mtcars) %>% flatmap(var_select, .type = "numeric")
flatmap <- function(.x, .f, ..., .type) {
  out <- map(.x, .f = .f, ...)
  if (!missing(.type)) {
    if (!is_scalar_character(.type)) {
      stop(".type must be a string")
    }
    if (!can_simplify(out, .type)) {
      stop("Results do not conform to .type", call. = FALSE)
    }
  }
  flatten(out)
}
