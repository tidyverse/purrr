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
#' * `map_vec()` simplifies to the common type of the output. It works with
#'   most types of simple vectors like Date, POSIXct, factors, etc.
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
#'     argument. No longer recommended.
#'   * A string, integer, or list, e.g. `"idx"`, `1`, or `list("idx", 1)` which
#'     are shorthand for `\(x) pluck(x, "idx")`, `\(x) pluck(x, 1)`, and
#'     `\(x) pluck(x, "idx", 1)` respectively. Optionally supply `.default` to
#'     set a default value if the indexed element is `NULL` or does not exist.
#'
#'   `r lifecycle::badge("experimental")`
#'
#'   Wrap a function with [in_parallel()] to declare that it should be performed
#'   in parallel. See [in_parallel()] for more details.
#'   Use of `...` is not permitted in this context.
#'
#' @param ... Additional arguments passed on to the mapped function.
#'
#'   We now generally recommend against using `...` to pass additional
#'   (constant) arguments to `.f`. Instead use a shorthand anonymous function:
#'
#'   ```R
#'   # Instead of
#'   x |> map(f, 1, 2, collapse = ",")
#'   # do:
#'   x |> map(\(x) f(x, 1, 2, collapse = ","))
#'   ```
#'
#'   This makes it easier to understand which arguments belong to which
#'   function and will tend to yield better error messages.
#'
#' @param .progress Whether to show a progress bar. Use `TRUE` to turn on
#'   a basic progress bar, use a string to give it a name, or see
#'   [progress_bars] for more details.
#' @returns
#' The output length is determined by the length of the input.
#' The output names are determined by the input names.
#' The output type is determined by the suffix:
#'
#' * No suffix: a list; `.f()` can return anything.
#'
#' * `_lgl()`, `_int()`, `_dbl()`, `_chr()` return a logical, integer, double,
#'   or character vector respectively; `.f()` must return a compatible atomic
#'   vector of length 1.
#'
#' * `_vec()` return an atomic or S3 vector, the same type that `.f` returns.
#'   `.f` can return pretty much any type of vector, as long as its length 1.
#'
#' * `walk()` returns the input `.x` (invisibly). This makes it easy to
#'    use in a pipe. The return value of `.f()` is ignored.
#'
#' Any errors thrown by `.f` will be wrapped in an error with class
#' [purrr_error_indexed].
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
#'
#' @examplesIf interactive() && rlang::is_installed("mirai") && rlang::is_installed("carrier")
#' # Run in interactive sessions only as spawns additional processes
#'
#' # To use parallelized map:
#' # 1. Set daemons (number of parallel processes) first:
#' mirai::daemons(2)
#'
#' # 2. Wrap .f with in_parallel():
#' mtcars |> map_dbl(in_parallel(\(x) mean(x)))
#'
#' # Note that functions from packages should be fully qualified with `pkg::`
#' # or call `library(pkg)` within the function
#' 1:10 |>
#'   map(in_parallel(\(x) vctrs::vec_init(integer(), x))) |>
#'   map_int(in_parallel(\(x) { library(vctrs); vec_size(x) }))
#'
#' # A locally-defined function (or any required variables)
#' # should be passed via ... of in_parallel():
#' slow_lm <- function(formula, data) {
#'   Sys.sleep(0.5)
#'   lm(formula, data)
#' }
#'
#' mtcars |>
#'   split(mtcars$cyl) |>
#'   map(in_parallel(\(df) slow_lm(mpg ~ disp, data = df), slow_lm = slow_lm))
#'
#' # Tear down daemons when no longer in use:
#' mirai::daemons(0)
#'
map <- function(.x, .f, ..., .progress = FALSE) {
  map_("list", .x, .f, ..., .progress = .progress)
}

#' @rdname map
#' @export
map_lgl <- function(.x, .f, ..., .progress = FALSE) {
  map_("logical", .x, .f, ..., .progress = .progress)
}

#' @rdname map
#' @export
map_int <- function(.x, .f, ..., .progress = FALSE) {
  map_("integer", .x, .f, ..., .progress = .progress)
}

#' @rdname map
#' @export
map_dbl <- function(.x, .f, ..., .progress = FALSE) {
  map_("double", .x, .f, ..., .progress = .progress)
}

#' @rdname map
#' @export
map_chr <- function(.x, .f, ..., .progress = FALSE) {
  local_deprecation_user_env()
  map_("character", .x, .f, ..., .progress = .progress)
}

map_ <- function(
  .type,
  .x,
  .f,
  ...,
  .progress = FALSE,
  .purrr_user_env = caller_env(2),
  .purrr_error_call = caller_env()
) {
  .x <- vctrs_vec_compat(.x, .purrr_user_env)
  vec_assert(.x, arg = ".x", call = .purrr_error_call)

  if (running_in_parallel(.f)) {
    return(mmap_(.x, .f, .progress, .type, .purrr_error_call, ...))
  }

  .f <- as_mapper(.f, ...)

  n <- vec_size(.x)
  names <- vec_names(.x)

  i <- 0L
  with_indexed_errors(
    i = i,
    names = names,
    error_call = .purrr_error_call,
    call_with_cleanup(map_impl, environment(), .type, .progress, n, names, i)
  )
}

mmap_ <- function(.x, .f, .progress, .type, error_call, ...) {
  if (...length()) {
    cli::cli_abort(
      "Can't use `...` with parallelized functions.",
      call = error_call
    )
  }

  m <- mirai::mirai_map(.x, .f)

  options <- c(".stop", if (isTRUE(.progress)) ".progress")
  x <- with_parallel_indexed_errors(
    mirai::collect_mirai(m, options = options),
    interrupt_expr = mirai::stop_mirai(m),
    error_call = error_call
  )
  if (.type != "list") {
    x <- simplify_impl(x, ptype = vector(mode = .type), error_call = error_call)
  }
  x
}

#' @rdname map
#' @param .ptype If `NULL`, the default, the output type is the common type
#'   of the elements of the result. Otherwise, supply a "prototype" giving
#'   the desired type of output.
#' @export
map_vec <- function(.x, .f, ..., .ptype = NULL, .progress = FALSE) {
  out <- map(.x, .f, ..., .progress = .progress)
  simplify_impl(out, ptype = .ptype)
}

#' @rdname map
#' @export
walk <- function(.x, .f, ..., .progress = FALSE) {
  map(.x, .f, ..., .progress = .progress)
  invisible(.x)
}

with_indexed_errors <- function(
  expr,
  i,
  names = NULL,
  error_call = caller_env()
) {
  withCallingHandlers(
    expr,
    error = function(cnd) {
      if (i == 0L) {
        # Error happened before or after loop
      } else {
        message <- c(i = "In index: {i}.")
        if (!is.null(names) && !is.na(names[[i]]) && names[[i]] != "") {
          name <- names[[i]]
          message <- c(message, i = "With name: {name}.")
        } else {
          name <- NULL
        }

        cli::cli_abort(
          message,
          location = i,
          name = name,
          parent = cnd,
          call = error_call,
          class = "purrr_error_indexed"
        )
      }
    }
  )
}

with_parallel_indexed_errors <- function(
  expr,
  interrupt_expr = NULL,
  error_call = caller_env()
) {
  withCallingHandlers(
    expr,
    error = function(cnd) {
      location <- cnd$location
      iname <- cnd$name
      cli::cli_abort(
        c(
          i = "In index: {location}.",
          i = if (length(iname) && nzchar(iname)) "With name: {iname}."
        ),
        location = location,
        name = iname,
        parent = cnd$parent,
        call = error_call,
        class = "purrr_error_indexed"
      )
    },
    interrupt = function(cnd) {
      interrupt_expr
    }
  )
}

#' Indexed errors (`purrr_error_indexed`)
#'
#' @description
#'
#' ```{r, child = "man/rmd/indexed-error.Rmd"}
#' ```
#'
#' @keywords internal
#' @name purrr_error_indexed
NULL
