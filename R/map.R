#' Apply a function to each element of a vector
#'
#' @description
#' The map functions transform their input by applying a function to
#' each element of a list or atomic vector and returning an object of
#' the same length as the input.
#'
#' * `map()` always returns a list. See the [modify()] family for
#'   versions that return an object of the same type as the input.
#'
#' * `map_lgl()`, `map_int()`, `map_dbl()` and `map_chr()` return an
#'   atomic vector of the indicated type (or die trying). For these functions,
#'   `.f` must return a length-1 vector of the appropriate type.
#'
#' * `walk()` calls `.f` for its side-effect and returns
#'   the input `.x`.
#'
#' @param .x A list or atomic vector.
#' @param .f A function, specified in one of the following ways:
#'
#'   * A named function, e.g. `mean`.
#'   * An anonymous function, e.g. `\(x) x + 1` or `function(x) x + 1`.
#'   * A formula, e.g. `~ .x + 1`. You must use `.x` to refer to the first
#'     argument. Only recommended if you require backward compatibility with
#'     older versions of R.
#'   * A string, integer, or list, e.g. `"idx"`, `1`, or `list("idx", 1)` which
#'     are shorthand for `\(x) pluck(x, "idx")`, `\(x) pluck(x, 1)`, and
#'     `\(x) pluck(x, "idx", 1)` respectively. Optionally supply `.default` to
#'     set a default value if the indexed element is `NULL` or does not exist.
#'
#' @param ... Additional arguments passed on to the mapped function.
#'
#'   Note that the arguments that differ in each call come before `.f`,
#'   and the arguments that are the same come after `.f`.
#' @param .progress Whether to show a progress bar. See [progress_bars]
#'   for details.
#' @returns
#' The output length is determined by the length of the input.
#' The output type is determined by the suffix:
#'
#' * No suffix: a list.
#'
#' * `_lgl`, `_int`, `_dbl`, `_chr` return a logical, integer, double,
#'   or character vector respectively. It will be named if the input was named.
#'
#' * `walk()` returns the input `.x` (invisibly). This makes it easy to
#'    use in a pipe.
#' @export
#' @family map variants
#' @seealso [map_if()] for applying a function to only those elements
#'   of `.x` that meet a specified condition.
#' @examples
#' # Compute normal distributions from an atomic vector
#' 1:10 |>
#'   map(rnorm, n = 10)
#'
#' # You can also use an anonymous function
#' 1:10 |>
#'   map(\(x) rnorm(10, x))
#'
#' # Simplify output to a vector instead of a list by computing the mean of the distributions
#' 1:10 |>
#'   map(rnorm, n = 10) |>  # output a list
#'   map_dbl(mean)           # output an atomic vector
#'
#' # Using set_names() with character vectors is handy to keep track
#' # of the original inputs:
#' set_names(c("foo", "bar")) |> map_chr(paste0, ":suffix")
#'
#' # Working with lists
#' favorite_desserts <- list(Sophia = "banana bread", Eliott = "pancakes", Karina = "chocolate cake")
#' favorite_desserts |> map_chr(\(food) paste(food, "rocks!"))
#'
#' # Extract by name or position
#' # .default specifies value for elements that are missing or NULL
#' l1 <- list(list(a = 1L), list(a = NULL, b = 2L), list(b = 3L))
#' l1 |> map("a", .default = "???")
#' l1 |> map_int("b", .default = NA)
#' l1 |> map_int(2, .default = NA)
#'
#' # Supply multiple values to index deeply into a list
#' l2 <- list(
#'   list(num = 1:3,     letters[1:3]),
#'   list(num = 101:103, letters[4:6]),
#'   list()
#' )
#' l2 |> map(c(2, 2))
#'
#' # Use a list to build an extractor that mixes numeric indices and names,
#' # and .default to provide a default value if the element does not exist
#' l2 |> map(list("num", 3))
#' l2 |> map_int(list("num", 3), .default = NA)
#'
#' # Working with data frames
#' # Use map_lgl(), map_dbl(), etc to return a vector instead of a list:
#' mtcars |> map_dbl(sum)
#'
#' # A more realistic example: split a data frame into pieces, fit a
#' # model to each piece, summarise and extract R^2
#' mtcars |>
#'   split(mtcars$cyl) |>
#'   map(\(df) lm(mpg ~ wt, data = df)) |>
#'   map(summary) |>
#'   map_dbl("r.squared")
map <- function(.x, .f, ..., .progress = FALSE) {
  .f <- as_mapper(.f, ...)
  .Call(map_impl, environment(), ".x", ".f", "list", .progress)
}

#' @rdname map
#' @export
map_lgl <- function(.x, .f, ..., .progress = FALSE) {
  .f <- as_mapper(.f, ...)
  .Call(map_impl, environment(), ".x", ".f", "logical", .progress)
}

#' @rdname map
#' @export
map_chr <- function(.x, .f, ..., .progress = FALSE) {
  .f <- as_mapper(.f, ...)
  .Call(map_impl, environment(), ".x", ".f", "character", .progress)
}

#' @rdname map
#' @export
map_int <- function(.x, .f, ..., .progress = FALSE) {
  .f <- as_mapper(.f, ...)
  .Call(map_impl, environment(), ".x", ".f", "integer", .progress)
}

#' @rdname map
#' @export
map_dbl <- function(.x, .f, ..., .progress = FALSE) {
  .f <- as_mapper(.f, ...)
  .Call(map_impl, environment(), ".x", ".f", "double", .progress)
}

#' @rdname map
#' @export
walk <- function(.x, .f, ...) {
  map(.x, .f, ...)
  invisible(.x)
}
