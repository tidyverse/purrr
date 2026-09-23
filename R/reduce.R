#' Reduce a list to a single value by iteratively applying a binary function
#'
#' @description
#'
#' `reduce()` is an operation that combines the elements of a vector
#' into a single value. The combination is driven by `.f`, a binary
#' function that takes two values and returns a single value: reducing
#' `f` over `1:3` computes the value `f(f(1, 2), 3)`.
#'
#' @inheritParams map
#' @param ... Additional arguments passed on to the reduce function.
#'
#'   We now generally recommend against using `...` to pass additional
#'   (constant) arguments to `.f`. Instead use a shorthand anonymous function:
#'
#'   ```R
#'   # Instead of
#'   x |> reduce(f, 1, 2, collapse = ",")
#'   # do:
#'   x |> reduce(\(x, y) f(x, y, 1, 2, collapse = ","))
#'   ```
#'
#'   This makes it easier to understand which arguments belong to which
#'   function and will tend to yield better error messages.
#'
#' @param .y For `reduce2()` an additional
#'   argument that is passed to `.f`. If `init` is not set, `.y`
#'   should be 1 element shorter than `.x`.
#' @param .f For `reduce()`, a 2-argument function. The function will be passed
#'   the accumulated value as the first argument and the "next" value as the
#'   second argument.
#'
#'   For `reduce2()`, a 3-argument function. The function will be passed the
#'   accumulated value as the first argument, the next value of `.x` as the
#'   second argument, and the next value of `.y` as the third argument.
#'
#'   The reduction terminates early if `.f` returns a value wrapped in
#'   a [done()].
#'
#' @param .init If supplied, will be used as the first value to start
#'   the accumulation, rather than using `.x[[1]]`. This is useful if
#'   you want to ensure that `reduce` returns a correct value when `.x`
#'   is empty. If missing, and `.x` is empty, will throw an error.
#' @param .dir The direction of reduction as a string, one of
#'   `"forward"` (the default) or `"backward"`. See the section about
#'   direction below.
#'
#' @section Direction:
#'
#' When `.f` is an associative operation like `+` or `c()`, the
#' direction of reduction does not matter. For instance, reducing the
#' vector `1:3` with the binary function `+` computes the sum `((1 +
#' 2) + 3)` from the left, and the same sum `(1 + (2 + 3))` from the
#' right.
#'
#' In other cases, the direction has important consequences on the
#' reduced value. For instance, reducing a vector with `list()` from
#' the left produces a left-leaning nested list (or tree), while
#' reducing `list()` from the right produces a right-leaning list.
#'
#' @seealso [accumulate()] for a version that returns all intermediate
#'   values of the reduction.
#' @examples
#' # Reducing `+` computes the sum of a vector while reducing `*`
#' # computes the product:
#' 1:3 |> reduce(`+`)
#' 1:10 |> reduce(`*`)
#'
#' # By ignoring the input vector (nxt), you can turn output of one step into
#' # the input for the next. This code takes 10 steps of a random walk:
#' reduce(1:10, \(acc, nxt) acc + rnorm(1), .init = 0)
#'
#' # When the operation is associative, the direction of reduction
#' # does not matter:
#' reduce(1:4, `+`)
#' reduce(1:4, `+`, .dir = "backward")
#'
#' # However with non-associative operations, the reduced value will
#' # be different as a function of the direction. For instance,
#' # `list()` will create left-leaning lists when reducing from the
#' # right, and right-leaning lists otherwise:
#' str(reduce(1:4, list))
#' str(reduce(1:4, list, .dir = "backward"))
#'
#' # reduce2() takes a ternary function and a second vector that is
#' # one element smaller than the first vector:
#' paste2 <- function(x, y, sep = ".") paste(x, y, sep = sep)
#' letters[1:4] |> reduce(paste2)
#' letters[1:4] |> reduce2(c("-", ".", "-"), paste2)
#'
#' x <- list(c(0, 1), c(2, 3), c(4, 5))
#' y <- list(c(6, 7), c(8, 9))
#' reduce2(x, y, paste)
#'
#'
#' # You can shortcircuit a reduction and terminate it early by
#' # returning a value wrapped in a done(). In the following example
#' # we return early if the result-so-far, which is passed on the LHS,
#' # meets a condition:
#' paste3 <- function(out, input, sep = ".") {
#'   if (nchar(out) > 4) {
#'     return(done(out))
#'   }
#'   paste(out, input, sep = sep)
#' }
#' letters |> reduce(paste3)
#'
#' # Here the early return branch checks the incoming inputs passed on
#' # the RHS:
#' paste4 <- function(out, input, sep = ".") {
#'   if (input == "j") {
#'     return(done(out))
#'   }
#'   paste(out, input, sep = sep)
#' }
#' letters |> reduce(paste4)
#' @export
reduce <- function(.x, .f, ..., .init, .dir = c("forward", "backward"), .progress = FALSE) {
  reduce_(.x, .f, ..., .init = .init, .dir = .dir, .progress = .progress, .acc = FALSE)
}
#' @rdname reduce
#' @export
reduce2 <- function(.x, .y, .f, ..., .init, .progress = FALSE) {
  reduce2_(.x, .y, .f, ..., .init = .init, .progress = .progress, .acc = FALSE)
}

reduce_ <- function(
  .x,
  .f,
  ...,
  .init,
  .dir,
  .progress = FALSE,
  .acc = FALSE,
  .purrr_user_env = caller_env(2),
  .purrr_error_call = caller_env()
) {
  .progress <- as_progress(
    .progress,
    user_env = .purrr_user_env,
    caller_env = .purrr_error_call
  )
  left <- arg_match0(.dir, c("forward", "backward")) == "forward"
  init_missing <- missing(.init)

  # Consistent with `map()`
  .x <- vctrs_vec_compat(.x, .purrr_user_env)
  obj_check_vector(.x, arg = ".x", call = .purrr_error_call)

  out <- reduce_init(.x, .init, left = left, error_call = .purrr_error_call)
  input_names <- accumulate_names(names(.x), init_missing, left)

  .f <- as_mapper(.f, ...)

  n <- vec_size(.x)
  i <- 0L

  # We refer to `.f`, `.x`, `i`, and `...` all from C level
  call_with_cleanup(reduce_impl, .acc, environment(), n, i, out, left, init_missing, input_names, .progress)
}

reduce2_ <- function(
  .x,
  .y,
  .f,
  ...,
  .init,
  .progress = FALSE,
  .acc = FALSE,
  .purrr_user_env = caller_env(2),
  .purrr_error_call = caller_env()
) {
  .progress <- as_progress(
    .progress,
    user_env = .purrr_user_env,
    caller_env = .purrr_error_call
  )
  # This can be easily converted into `.dir` parameter if one so wishes
  left <- TRUE
  init_missing <- missing(.init)

  # Consistent with `map()`
  .x <- vctrs_vec_compat(.x, .purrr_user_env)
  obj_check_vector(.x, arg = ".x", call = .purrr_error_call)

  out <- reduce_init(.x, .init, left = left, error_call = .purrr_error_call)
  # Here it'd only take replicating analogous line from `reduce_()` to use
  # `.x` names for the output like `map2()` does
  input_names <- NULL

  .y <- vctrs_vec_compat(.y, .purrr_user_env)
  obj_check_vector(.y, arg = ".y", call = .purrr_error_call)

  .f <- as_mapper(.f, ...)

  n <- vec_size(.x)
  i <- 0L

  expected_y_size <- n - init_missing
  if (vec_size(.y) != expected_y_size) {
    cli::cli_abort(
      "{.arg .y} must have length {expected_y_size}, not {vec_size(.y)}.",
      arg = ".y",
      call = .purrr_error_call
    )
  }

  # We refer to `.f`, `.x`, `.y`, `i`, and `...` all from C level
  call_with_cleanup(reduce2_impl, .acc, environment(), n, i, out, left, init_missing, input_names, .progress)
}

accumulate_names <- function(nms, init_missing, left) {
  if (is_null(nms)) {
    return(NULL)
  }

  if (!init_missing) {
    nms <- c(".init", nms)
  }
  if (!left) {
    nms <- rev(nms)
  }

  nms
}

reduce_init <- function(x, init, left = TRUE, error_call = caller_env()) {
  if (!missing(init)) {
    init
  } else {
    if (is_empty(x)) {
      cli::cli_abort(
        "Must supply {.arg .init} when {.arg .x} is empty.",
        arg = ".init",
        call = error_call
      )
    } else if (left) {
      x[[1]]
    } else {
      x[[length(x)]]
    }
  }
}

#' Accumulate intermediate results of a vector reduction
#'
#' @description
#'
#' `accumulate()` sequentially applies a 2-argument function to elements of a
#' vector. Each application of the function uses the initial value or result
#' of the previous application as the first argument. The second argument is
#' the next value of the vector. The results of each application are
#' returned in a list. The accumulation can optionally terminate before
#' processing the whole vector in response to a `done()` signal returned by
#' the accumulation function.
#'
#' By contrast to `accumulate()`, `reduce()` applies a 2-argument function in
#' the same way, but discards all results except that of the final function
#' application.
#'
#' `accumulate2()` sequentially applies a function to elements of two lists, `.x` and `.y`.
#'
#' @inheritParams map
#'
#' @param .y For `accumulate2()` an additional
#'   argument that is passed to `.f`. If `init` is not set, `.y`
#'   should be 1 element shorter than `.x`.
#'
#' @param .f For `accumulate()` `.f` is 2-argument function. The function will
#'     be passed the accumulated result or initial value as the first argument.
#'     The next value in sequence is passed as the second argument.
#'
#'   For `accumulate2()`, a 3-argument function. The
#'   function will be passed the accumulated result as the first
#'   argument. The next value in sequence from `.x` is passed as the second argument. The
#'   next value in sequence from `.y` is passed as the third argument.
#'
#'   The accumulation terminates early if `.f` returns a value wrapped in
#'   a [done()].
#'
#' @param .init If supplied, will be used as the first value to start
#'   the accumulation, rather than using `.x[[1]]`. This is useful if
#'   you want to ensure that `reduce` returns a correct value when `.x`
#'   is empty. If missing, and `.x` is empty, will throw an error.
#' @param .dir The direction of accumulation as a string, one of
#'   `"forward"` (the default) or `"backward"`. See the section about
#'   direction below.
#' @param .simplify If `NA`, the default, the accumulated list of
#'   results is simplified to an atomic vector if possible.
#'   If `TRUE`, the result is simplified, erroring if not possible.
#'   If `FALSE`, the result is not simplified, always returning a list.
#' @param .ptype If `simplify` is `NA` or `TRUE`, optionally supply a vector
#'   prototype to enforce the output type.
#' @return A vector the same length of `.x` with the same names as `.x`.
#'
#'   If `.init` is supplied, the length is extended by 1. If `.x` has
#'   names, the initial value is given the name `".init"`, otherwise
#'   the returned vector is kept unnamed.
#'
#'   If `.dir` is `"forward"` (the default), the first element is the
#'   initial value (`.init` if supplied, or the first element of `.x`)
#'   and the last element is the final reduced value. In case of a
#'   right accumulation, this order is reversed.
#'
#'   The accumulation terminates early if `.f` returns a value wrapped
#'   in a [done()]. If the done box is empty, the last value is
#'   used instead and the result is one element shorter (but always
#'   includes the initial value, even when terminating at the first
#'   iteration).
#'
#' @inheritSection reduce Direction
#'
#' @seealso [reduce()] when you only need the final reduced value.
#' @examples
#' # With an associative operation, the final value is always the
#' # same, no matter the direction. You'll find it in the first element for a
#' # backward (left) accumulation, and in the last element for forward
#' # (right) one:
#' 1:5 |> accumulate(`+`)
#' 1:5 |> accumulate(`+`, .dir = "backward")
#'
#' # The final value is always equal to the equivalent reduction:
#' 1:5 |> reduce(`+`)
#'
#' # It is easier to understand the details of the reduction with
#' # `paste()`.
#' accumulate(letters[1:5], paste, sep = ".")
#'
#' # Note how the intermediary reduced values are passed to the left
#' # with a left reduction, and to the right otherwise:
#' accumulate(letters[1:5], paste, sep = ".", .dir = "backward")
#'
#' # By ignoring the input vector (nxt), you can turn output of one step into
#' # the input for the next. This code takes 10 steps of a random walk:
#' accumulate(1:10, \(acc, nxt) acc + rnorm(1), .init = 0)
#'
#' # `accumulate2()` is a version of `accumulate()` that works with
#' # 3-argument functions and one additional vector:
#' paste2 <- function(acc, nxt, sep = ".") paste(acc, nxt, sep = sep)
#' letters[1:4] |> accumulate(paste2)
#' letters[1:4] |> accumulate2(c("-", ".", "-"), paste2)
#'
#' # You can shortcircuit an accumulation and terminate it early by
#' # returning a value wrapped in a done(). In the following example
#' # we return early if the result-so-far, which is passed on the LHS,
#' # meets a condition:
#' paste3 <- function(out, input, sep = ".") {
#'   if (nchar(out) > 4) {
#'     return(done(out))
#'   }
#'   paste(out, input, sep = sep)
#' }
#' letters |> accumulate(paste3)
#'
#' # Note how we get twice the same value in the accumulation. That's
#' # because we have returned it twice. To prevent this, return an empty
#' # done box to signal to accumulate() that it should terminate with the
#' # value of the last iteration:
#' paste3 <- function(out, input, sep = ".") {
#'   if (nchar(out) > 4) {
#'     return(done())
#'   }
#'   paste(out, input, sep = sep)
#' }
#' letters |> accumulate(paste3)
#'
#' # Here the early return branch checks the incoming inputs passed on
#' # the RHS:
#' paste4 <- function(out, input, sep = ".") {
#'   if (input == "f") {
#'     return(done())
#'   }
#'   paste(out, input, sep = sep)
#' }
#' letters |> accumulate(paste4)
#'
#'
#' # Simulating stochastic processes with drift
#' \dontrun{
#' library(dplyr)
#' library(ggplot2)
#'
#' map(1:5, \(i) rnorm(100)) |>
#'   set_names(paste0("sim", 1:5)) |>
#'   map(\(l) accumulate(l, \(acc, nxt) .05 + acc + nxt)) |>
#'   map(\(x) tibble(value = x, step = 1:100)) |>
#'   list_rbind(names_to = "simulation") |>
#'   ggplot(aes(x = step, y = value)) +
#'     geom_line(aes(color = simulation)) +
#'     ggtitle("Simulations of a random walk with drift")
#' }
#' @export
accumulate <- function(
  .x,
  .f,
  ...,
  .init,
  .dir = c("forward", "backward"),
  .simplify = NA,
  .ptype = NULL,
  .progress = FALSE
) {
  res <- reduce_(.x, .f, ..., .init = .init, .dir = .dir, .progress = .progress, .acc = TRUE)
  list_simplify_internal(res, .simplify, .ptype)
}
#' @rdname accumulate
#' @export
accumulate2 <- function(.x, .y, .f, ..., .init, .simplify = NA, .ptype = NULL, .progress = FALSE) {
  res <- reduce2_(.x, .y, .f, ..., .init = .init, .progress = .progress, .acc = TRUE)
  list_simplify_internal(res, .simplify, .ptype)
}
