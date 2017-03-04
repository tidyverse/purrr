#' Apply a function to each element of a vector
#'
#' @description
#' The map function transform the input, returning a vector the same length
#' as the input. `map()` returns a list or a data frame; `map_lgl()`,
#' `map_int()`, `map_dbl()` and `map_chr()` return vectors of the
#' corresponding type (or die trying); `map_df()` returns a data frame by
#' row-binding the individual elements.
#'
#' `walk()` calls `.f` for its side-effect and returns the input `.x`.
#'
#' @inheritParams as_function
#' @param .x A list or atomic vector.
#' @param ... Additional arguments passed on to `.f`.
#' @return `map()` always returns a list the same length as `.x`.
#'
#'   `map_lgl()` returns a logical vector, `map_int()` an integer
#'   vector, `map_dbl()`, a double vector, `map_chr()`, a character
#'   vector. The output of `.f` will be automatically typed upwards,
#'   e.g. logical -> integer -> double -> character. The output
#'   is always the same length as the input.
#'
#'   `walk()` (invisibly) the input `.x`. It's called primarily for
#'   its side effects, but this makes it easier to combine in a pipe.
#' @seealso [map2()] and [pmap()] to map over multiple
#'   inputs simulatenously
#' @export
#' @examples
#' 1:10 %>%
#'   map(rnorm, n = 10) %>%
#'   map_dbl(mean)
#'
#' # Or use an anonymous function
#' 1:10 %>%
#'   map(function(x) rnorm(10, x))
#'
#' # Or a formula
#' 1:10 %>%
#'   map(~ rnorm(10, .x))
#'
#' # A more realistic example: split a data frame into pieces, fit a
#' # model to each piece, summarise and extract R^2
#' mtcars %>%
#'   split(.$cyl) %>%
#'   map(~ lm(mpg ~ wt, data = .x)) %>%
#'   map(summary) %>%
#'   map_dbl("r.squared")
#'
#' # Use map_lgl(), map_dbl(), etc to reduce to a vector.
#' # * list
#' mtcars %>% map(sum)
#' # * vector
#' mtcars %>% map_dbl(sum)
#'
#' # If each element of the output is a data frame, use
#' # map_df to row-bind them together:
#' mtcars %>%
#'   split(.$cyl) %>%
#'   map(~ lm(mpg ~ wt, data = .x)) %>%
#'   map_df(~ as.data.frame(t(as.matrix(coef(.)))))
#' # (if you also want to preserve the variable names see
#' # the broom package)
#' @useDynLib purrr map_impl map_by_slice_impl
map <- function(.x, .f, ...) {
  .f <- as_function(.f, ...)
  .Call(map_impl, environment(), ".x", ".f", "list")
}

#' @rdname map
#' @export
map_lgl <- function(.x, .f, ...) {
  .f <- as_function(.f, ...)
  .Call(map_impl, environment(), ".x", ".f", "logical")
}

# Internal version of map_lgl() that works with logical vectors
probe <- function(.x, .p, ...) {
  if (is_logical(.p)) {
    stopifnot(length(.p) == length(.x))
    .p
  } else {
    map_lgl(.x, .p, ...)
  }
}

#' @rdname map
#' @export
map_chr <- function(.x, .f, ...) {
  .f <- as_function(.f, ...)
  .Call(map_impl, environment(), ".x", ".f", "character")
}

#' @rdname map
#' @export
map_int <- function(.x, .f, ...) {
  .f <- as_function(.f, ...)
  .Call(map_impl, environment(), ".x", ".f", "integer")
}

#' @rdname map
#' @export
map_dbl <- function(.x, .f, ...) {
  .f <- as_function(.f, ...)
  .Call(map_impl, environment(), ".x", ".f", "double")
}

#' @rdname map
#' @param .id If not `NULL` a variable with this name will be created
#'   giving either the name or the index of the data frame.
#' @export
map_df <- function(.x, .f, ..., .id = NULL) {
  .f <- as_function(.f, ...)
  res <- map(.x, .f, ...)
  dplyr::bind_rows(res, .id = .id)
}


#' @export
#' @rdname map
walk <- function(.x, .f, ...) {
  .f <- as_function(.f, ...)
  for (i in seq_along(.x)) {
    .f(.x[[i]], ...)
  }
  invisible(.x)
}


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
#' @usage NULL
map3 <- function(.x, .y, .z, .f, ...) {
  warning("`map3(x, y, z)` is deprecated. Please use `pmap(list(x, y, z))` ",
    "instead", call. = FALSE)
  pmap(list(.x, .y, .z), .f, ...)
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
#' @usage NULL
#' @rdname map2
map_n <- function(...) {
  warning("`map_n()` is deprecated; please use `pmap()` instead.",
    call. = FALSE)
  pmap(...)
}

#' @export
#' @rdname map2
walk2 <- function(.x, .y, .f, ...) {
  pwalk(list(.x, .y), .f, ...)
  invisible(.x)
}

#' @export
#' @usage NULL
#' @rdname map2
walk3 <- function(.x, .y, .z, .f, ...) {
  warning("`walk3(x, y, z)` is deprecated. Please use `pwalk(list(x, y, z))` ",
    "instead", call. = FALSE)
  pwalk(list(.x, .y, .z), .f, ...)
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

#' @export
#' @rdname map2
#' @usage NULL
walk_n <- function(...) {
  warning("`walk_n()` is deprecated; please use `pwalk()` instead.",
    call. = FALSE)
  pwalk(...)
}

#' Modify elements conditionally
#'
#' `map_if()` maps a function over the elements of `.x`
#' satisfying a predicate. `map_at()` is similar but will modify
#' the elements corresponding to a character vector of names or a
#' numeric vector of positions.
#' @inheritParams map
#' @param .p A single predicate function, a formula describing such a
#'   predicate function, or a logical vector of the same length as `.x`.
#'   Alternatively, if the elements of `.x` are themselves lists of
#'   objects, a string indicating the name of a logical element in the
#'   inner lists. Only those elements where `.p` evaluates to
#'   `TRUE` will be modified.
#' @param .at A character vector of names or a numeric vector of
#'   positions. Only those elements corresponding to `.at` will be
#'   modified.
#' @return A list.
#' @name conditional-map
#' @examples
#' # Convert factors to characters
#' iris %>%
#'   map_if(is.factor, as.character) %>%
#'   str()
#'
#' # Specify which columns to map with a numeric vector of positions:
#' mtcars %>% map_at(c(1, 4, 5), as.character) %>% str()
#'
#' # Or with a vector of names:
#' mtcars %>% map_at(c("cyl", "am"), as.character) %>% str()
#'
#' list(x = rbernoulli(100), y = 1:100) %>%
#'   transpose() %>%
#'   map_if("x", ~ update_list(., y = ~ y * 100)) %>%
#'   transpose() %>%
#'   simplify_all()
#'
NULL

#' @rdname conditional-map
#' @export
map_if <- function(.x, .p, .f, ...) {
  .x <- unclass(.x)
  sel <- probe(.x, .p)
  .x[sel] <- map(.x[sel], .f, ...)
  .x
}

#' @rdname conditional-map
#' @export
map_at <- function(.x, .at, .f, ...) {
  .x <- c(.x)
  sel <- inv_which(.x, .at)
  .x[sel] <- map(.x[sel], .f, ...)
  .x
}

inv_which <- function(x, sel) {
  if (is.character(sel)) {
    names <- names(x)
    if (is.null(names)) {
      stop("character indexing requires a named object", call. = FALSE)
    }
    names %in% sel
  } else if (is.numeric(sel)) {
    seq_along(x) %in% sel
  } else {
    stop("unrecognised index type", call. = FALSE)
  }
}

