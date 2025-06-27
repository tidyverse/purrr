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
reduce <- function(.x, .f, ..., .init, .dir = c("forward", "backward")) {
  reduce_impl(.x, .f, ..., .init = .init, .dir = .dir)
}
#' @rdname reduce
#' @export
reduce2 <- function(.x, .y, .f, ..., .init) {
  reduce2_impl(.x, .y, .f, ..., .init = .init, .left = TRUE)
}

reduce_impl <- function(
  .x,
  .f,
  ...,
  .init,
  .dir,
  .acc = FALSE,
  .purrr_error_call = caller_env()
) {
  left <- arg_match0(.dir, c("forward", "backward")) == "forward"

  out <- reduce_init(.x, .init, left = left, error_call = .purrr_error_call)
  idx <- reduce_index(.x, .init, left = left)

  if (.acc) {
    acc_out <- accum_init(out, idx, left = left)
    acc_idx <- accum_index(acc_out, left = left)
  }

  .f <- as_mapper(.f, ...)

  # Left-reduce passes the result-so-far on the left, right-reduce
  # passes it on the right. A left-reduce produces left-leaning
  # computation trees while right-reduce produces right-leaning trees.
  if (left) {
    fn <- .f
  } else {
    fn <- function(x, y, ...) .f(y, x, ...)
  }

  for (i in seq_along(idx)) {
    prev <- out
    elt <- .x[[idx[[i]]]]

    out <- forceAndCall(2, fn, out, elt, ...)

    if (is_done_box(out)) {
      return(reduce_early(out, prev, .acc, acc_out, acc_idx[[i]], left))
    }

    if (.acc) {
      acc_out[[acc_idx[[i]]]] <- out
    }
  }

  if (.acc) {
    acc_out
  } else {
    out
  }
}

reduce_early <- function(out, prev, acc, acc_out, acc_idx, left = TRUE) {
  if (is_done_box(out, empty = TRUE)) {
    out <- prev
    offset <- if (left) -1L else 1L
  } else {
    out <- unbox(out)
    offset <- 0L
  }

  if (!acc) {
    return(out)
  }

  acc_idx <- acc_idx + offset
  acc_out[[acc_idx]] <- out

  if (left) {
    acc_out[seq_len(acc_idx)]
  } else {
    acc_out[seq(acc_idx, length(acc_out))]
  }
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
reduce_index <- function(x, init, left = TRUE) {
  n <- length(x)

  if (left) {
    if (missing(init)) {
      seq_len2(2L, n)
    } else {
      seq_len(n)
    }
  } else {
    if (missing(init)) {
      rev(seq_len(n - 1L))
    } else {
      rev(seq_len(n))
    }
  }
}

accum_init <- function(first, idx, left) {
  len <- length(idx) + 1L
  out <- new_list(len)

  if (left) {
    out[[1]] <- first
  } else {
    out[[len]] <- first
  }

  out
}
accum_index <- function(out, left) {
  n <- length(out)

  if (left) {
    seq_len2(2, n)
  } else {
    rev(seq_len(n - 1L))
  }
}

reduce2_impl <- function(
  .x,
  .y,
  .f,
  ...,
  .init,
  .left = TRUE,
  .acc = FALSE,
  .purrr_error_call = caller_env()
) {
  out <- reduce_init(.x, .init, left = .left, error_call = .purrr_error_call)
  x_idx <- reduce_index(.x, .init, left = .left)
  y_idx <- reduce_index(.y, NULL, left = .left)

  if (length(x_idx) != length(y_idx)) {
    cli::cli_abort(
      "{.arg .y} must have length {length(x_idx)}, not {length(y_idx)}.",
      arg = ".y",
      call = .purrr_error_call
    )
  }

  .f <- as_mapper(.f, ...)

  if (.acc) {
    acc_out <- accum_init(out, x_idx, left = .left)
    acc_idx <- accum_index(acc_out, left = .left)
  }

  for (i in seq_along(x_idx)) {
    prev <- out

    x_i <- x_idx[[i]]
    y_i <- y_idx[[i]]

    out <- forceAndCall(3, .f, out, .x[[x_i]], .y[[y_i]], ...)

    if (is_done_box(out)) {
      return(reduce_early(out, prev, .acc, acc_out, acc_idx[[i]]))
    }

    if (.acc) {
      acc_out[[acc_idx[[i]]]] <- out
    }
  }

  if (.acc) {
    acc_out
  } else {
    out
  }
}

seq_len2 <- function(start, end) {
  if (start > end) {
    return(integer(0))
  }

  start:end
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
#' @param .y For `accumulate2()` `.y` is the second argument of the pair. It
#'     needs to be 1 element shorter than the vector to be accumulated (`.x`).
#'     If `.init` is set, `.y` needs to be one element shorted than the
#'     concatenation of the initial value and `.x`.
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
#' @section Life cycle:
#'
#' `accumulate_right()` is soft-deprecated in favour of the `.dir`
#' argument as of rlang 0.3.0. Note that the algorithm has
#' slightly changed: the accumulated value is passed to the right
#' rather than the left, which is consistent with a right reduction.
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
  .ptype = NULL
) {
  .dir <- arg_match0(.dir, c("forward", "backward"))
  .f <- as_mapper(.f, ...)

  res <- reduce_impl(.x, .f, ..., .init = .init, .dir = .dir, .acc = TRUE)
  names(res) <- accumulate_names(names(.x), .init, .dir)

  res <- list_simplify_internal(res, .simplify, .ptype)
  res
}
#' @rdname accumulate
#' @export
accumulate2 <- function(.x, .y, .f, ..., .init, .simplify = NA, .ptype = NULL) {
  res <- reduce2_impl(.x, .y, .f, ..., .init = .init, .acc = TRUE)
  res <- list_simplify_internal(res, .simplify, .ptype)
  res
}

accumulate_names <- function(nms, init, dir) {
  if (is_null(nms)) {
    return(NULL)
  }

  if (!missing(init)) {
    nms <- c(".init", nms)
  }
  if (dir == "backward") {
    nms <- rev(nms)
  }

  nms
}

#' Reduce from the right (retired)
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `reduce_right()` is soft-deprecated as of purrr 0.3.0. Please use
#' the `.dir` argument of `reduce()` instead. Note that the algorithm
#' has changed. Whereas `reduce_right()` computed `f(f(3, 2), 1)`,
#' `reduce(.dir = \"backward\")` computes `f(1, f(2, 3))`. This is the
#' standard way of reducing from the right.
#'
#' To update your code with the same reduction as `reduce_right()`,
#' simply reverse your vector and use a left reduction:
#'
#' ```R
#' # Before:
#' reduce_right(1:3, f)
#'
#' # After:
#' reduce(rev(1:3), f)
#' ```
#'
#' `reduce2_right()` is deprecated as of purrr 0.3.0 without
#' replacement. It is not clear what algorithmic properties should a
#' right reduction have in this case. Please reach out if you know
#' about a use case for a right reduction with a ternary function.
#'
#' @inheritParams reduce
#' @keywords internal
#' @export
reduce_right <- function(.x, .f, ..., .init) {
  lifecycle::deprecate_warn(
    when = "0.3.0",
    what = "reduce_right()",
    with = "reduce(.dir)",
    always = TRUE
  )

  .x <- rev(.x) # Compatibility
  reduce_impl(.x, .f, ..., .dir = "forward", .init = .init)
}
#' @rdname reduce_right
#' @export
reduce2_right <- function(.x, .y, .f, ..., .init) {
  lifecycle::deprecate_warn(
    when = "0.3.0",
    what = "reduce2_right()",
    with = I("reverse your vectors and use `reduce2()`"),
    always = TRUE
  )

  reduce2_impl(.x, .y, .f, ..., .init = .init, .left = FALSE)
}

#' @rdname reduce_right
#' @export
accumulate_right <- function(.x, .f, ..., .init) {
  lifecycle::deprecate_warn(
    when = "0.3.0",
    what = "accumulate_right()",
    with = "accumulate(.dir)",
    always = TRUE
  )

  # Note the order of arguments is switched
  f <- function(y, x) {
    .f(x, y, ...)
  }

  accumulate(.x, f, .init = .init, .dir = "backward")
}
