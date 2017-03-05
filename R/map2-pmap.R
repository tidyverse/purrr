#' Map over multiple inputs simultaneously.
#'
#' These functions are variants of `map()` iterate over multiple
#' arguments in parallel. `map2()` and `walk2()` are specialised for the two
#' argument case; `pmap()` and `pwalk()` allow you to provide any number of
#' arguments in a list.
#'
#' Note that arguments to be vectorised over come before the `.f`,
#' and arguments that are supplied to every call come after `.f`.
#'
#' @inheritParams map
#' @param .x,.y Vectors of the same length. A vector of length 1 will
#'   be recycled.
#' @param .l A list of lists. The length of `.l` determines the
#'   number of arguments that `.f` will be called with. List
#'   names will be used if present.
#' @return An atomic vector, list, or data frame, depending on the suffix.
#'   Atomic vectors and lists will be named if `.x` or the first
#'   element of `.l` is named.
#'
#'   If all input is length 0, the output will be length 0. If any
#'   input is length 1, it will be recycled to the length of the longest.
#' @export
#' @examples
#' x <- list(1, 10, 100)
#' y <- list(1, 2, 3)
#' z <- list(5, 50, 500)
#'
#' map2(x, y, ~ .x + .y)
#' # Or just
#' map2(x, y, `+`)
#'
#' # Split into pieces, fit model to each piece, then predict
#' by_cyl <- mtcars %>% split(.$cyl)
#' mods <- by_cyl %>% map(~ lm(mpg ~ wt, data = .))
#' map2(mods, by_cyl, predict)
#'
#' pmap(list(x, y, z), sum)
#'
#' # Matching arguments by position
#' pmap(list(x, y, z), function(a, b ,c) a / (b + c))
#'
#' # Matching arguments by name
#' l <- list(a = x, b = y, c = z)
#' pmap(l, function(c, b, a) a / (b + c))
#'
#' # Vectorizing a function over multiple arguments
#' df <- data.frame(
#'   x = c("apple", "banana", "cherry"),
#'   pattern = c("p", "n", "h"),
#'   replacement = c("x", "f", "q"),
#'   stringsAsFactors = FALSE
#'   )
#' pmap(df, gsub)
#' pmap_chr(df, gsub)
#'
#' ## Use `...` to absorb unused components of input list .l
#' df <- data.frame(
#'   x = 1:3 + 0.1,
#'   y = 3:1 - 0.1,
#'   z = letters[1:3]
#' )
#' plus <- function(x, y) x + y
#' \dontrun{
#' ## this won't work
#' pmap(df, plus)
#' }
#' ## but this will
#' plus2 <- function(x, y, ...) x + y
#' pmap_dbl(df, plus2)
#'
#' @useDynLib purrr map2_impl
map2 <- function(.x, .y, .f, ...) {
  .f <- as_function(.f, ...)
  .Call(map2_impl, environment(), ".x", ".y", ".f", "list")
}

#' @export
#' @rdname map2
map2_lgl <- function(.x, .y, .f, ...) {
  .f <- as_function(.f, ...)
  .Call(map2_impl, environment(), ".x", ".y", ".f", "logical")
}
#' @export
#' @rdname map2
map2_int <- function(.x, .y, .f, ...) {
  .f <- as_function(.f, ...)
  .Call(map2_impl, environment(), ".x", ".y", ".f", "integer")
}
#' @export
#' @rdname map2
map2_dbl <- function(.x, .y, .f, ...) {
  .f <- as_function(.f, ...)
  .Call(map2_impl, environment(), ".x", ".y", ".f", "double")
}
#' @export
#' @rdname map2
map2_chr <- function(.x, .y, .f, ...) {
  .f <- as_function(.f, ...)
  .Call(map2_impl, environment(), ".x", ".y", ".f", "character")
}
#' @rdname map2
#' @export
map2_df <- function(.x, .y, .f, ..., .id = NULL) {
  .f <- as_function(.f, ...)
  res <- map2(.x, .y, .f, ...)
  dplyr::bind_rows(res, .id = .id)
}

#' @export
#' @rdname map2
#' @useDynLib purrr pmap_impl
pmap <- function(.l, .f, ...) {
  .f <- as_function(.f, ...)
  .Call(pmap_impl, environment(), ".l", ".f", "list")
}

#' @export
#' @rdname map2
pmap_lgl <- function(.l, .f, ...) {
  .f <- as_function(.f, ...)
  .Call(pmap_impl, environment(), ".l", ".f", "logical")
}
#' @export
#' @rdname map2
pmap_int <- function(.l, .f, ...) {
  .f <- as_function(.f, ...)
  .Call(pmap_impl, environment(), ".l", ".f", "integer")
}
#' @export
#' @rdname map2
pmap_dbl <- function(.l, .f, ...) {
  .f <- as_function(.f, ...)
  .Call(pmap_impl, environment(), ".l", ".f", "double")
}
#' @export
#' @rdname map2
pmap_chr <- function(.l, .f, ...) {
  .f <- as_function(.f, ...)
  .Call(pmap_impl, environment(), ".l", ".f", "character")
}
#' @rdname map2
#' @export
pmap_df <- function(.l, .f, ..., .id = NULL) {
  .f <- as_function(.f, ...)
  res <- pmap(.l, .f, ...)
  dplyr::bind_rows(res, .id = .id)
}


#' @export
#' @rdname map2
walk2 <- function(.x, .y, .f, ...) {
  pwalk(list(.x, .y), .f, ...)
  invisible(.x)
}

#' @export
#' @rdname map2
pwalk <- function(.l, .f, ...) {
  .f <- as_function(.f, ...)
  args_list <- recycle_args(.l) %>% transpose()
  for (args in args_list) {
    do.call(".f", c(args, list(...)))
  }
  invisible(.l)
}
