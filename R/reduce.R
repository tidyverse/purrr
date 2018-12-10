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
#' @param .y For `reduce2()` and `accumulate2()`, an additional
#'   argument that is passed to `.f`. If `init` is not set, `.y`
#'   should be 1 element shorter than `.x`.
#' @param .f For `reduce()`, and `accumulate()`, a 2-argument
#'   function. The function will be passed the accumulated value as
#'   the first argument and the "next" value as the second argument.
#'
#'   For `reduce2()` and `accumulate2()`, a 3-argument function. The
#'   function will be passed the accumulated value as the first
#'   argument, the next value of `.x` as the second argument, and the
#'   next value of `.y` as the third argument.
#' @param .init If supplied, will be used as the first value to start
#'   the accumulation, rather than using `x[[1]]`. This is useful if
#'   you want to ensure that `reduce` returns a correct value when `.x`
#'   is empty. If missing, and `x` is empty, will throw an error.
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
#' @section Life cycle:
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
#' ```{r}
#' # Before:
#' reduce_right(1:3, f)
#'
#' # After:
#' reduce(rev(1:3), f)
#' ```
#'
#' `reduce2_right()` is soft-deprecated as of purrr 0.3.0 without
#' replacement. It is not clear what algorithmic properties should a
#' right reduction have in this case. Please reach out if you know
#' about a use case for a right reduction with a ternary function.
#'
#' @seealso [accumulate()] for a version that returns all intermediate
#'   values of the reduction.
#' @examples
#' # Reducing `+` computes the sum of a vector while reducing `*`
#' # computes the product:
#' 1:3 %>% reduce(`+`)
#' 1:10 %>% reduce(`*`)
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
#' letters[1:4] %>% reduce(paste2)
#' letters[1:4] %>% reduce2(c("-", ".", "-"), paste2)
#'
#' x <- list(c(0, 1), c(2, 3), c(4, 5))
#' y <- list(c(6, 7), c(8, 9))
#' reduce2(x, y, paste)
#' @export
reduce <- function(.x, .f, ..., .init, .dir = c("forward", "backward")) {
  reduce_impl(.x, .f, ..., .init = .init, .dir = .dir)
}
#' @rdname reduce
#' @export
reduce2 <- function(.x, .y, .f, ..., .init) {
  reduce2_impl(.x, .y, .f, ..., .init = .init, .left = TRUE)
}

reduce_impl <- function(.x, .f, ..., .init, .dir = "forward") {
  left <- arg_match(.dir, c("forward", "backward")) == "forward"

  out <- reduce_init(.x, .init, left = left)
  idx <- reduce_index(.x, .init, left = left)

  .f <- as_mapper(.f, ...)

  # Left-reduce produces left-leaning computation trees (reduced
  # values are passed to the left) while right-reduce produces
  # right-leaning trees
  if (left) {
    for (i in idx) {
      out <- .f(out, .x[[i]], ...)
    }
  } else {
    for (i in idx) {
      out <- .f(.x[[i]], out, ...)
    }
  }

  out
}

reduce_init <- function(x, init, left = TRUE) {
  if (!missing(init)) {
    init
  } else {
    if (is_empty(x)) {
      stop("`.x` is empty, and no `.init` supplied", call. = FALSE)
    } else if (left) {
      x[[1]]
    } else {
      x[[length(x)]]
    }
  }
}

reduce_index <- function(x, init, left = TRUE) {
  n <- length(x)

  if (!missing(init)) {
    if (left) {
      seq_len(n)
    } else {
      rev(seq_len(n))
    }
  } else {
    if (left) {
      seq_len2(2L, n)
    } else {
      rev(seq_len2(1L, n - 1L))
    }
  }
}

reduce2_impl <- function(.x, .y, .f,
                         ...,
                         .init,
                         .left = TRUE,
                         .acc = FALSE) {
  out <- reduce_init(.x, .init, left = .left)
  x_idx <- reduce_index(.x, .init, left = .left)
  y_idx <- reduce_index(.y, NULL, left = .left)

  if (length(x_idx) != length(y_idx)) {
    stop("`.y` does not have length ", length(x_idx))
  }

  .f <- as_mapper(.f, ...)

  if (.acc) {
    offset <- !missing(.init)
    res <- new_list(length(x_idx) + offset)
    res[[1]] <- out
  }

  for (i in seq_along(x_idx)) {
    x_i <- x_idx[[i]]
    y_i <- y_idx[[i]]

    out <- .f(out, .x[[x_i]], .y[[y_i]], ...)

    if (.acc) {
      res[[x_i + offset]] <- out
    }
  }

  if (.acc) {
    names(res) <- accumulate_names(names(.x), .init, left = .left)
    res
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
#' `accumulate()` [reduces][reduce] a vector with a binary function,
#' keeping all intermediate results, from the initial value to the
#' final reduced value, i.e. the result you'd have gotten if you used
#' [reduce()] instead of `accumulate()`.
#'
#' @inheritParams reduce
#'
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
#' # same, no matter the direction. You'll find it in the last element
#' # for a left accumulation, and in the first element for a right one:
#' 1:5 %>% accumulate(`+`)
#' 1:5 %>% accumulate(`+`, .dir = "backward")
#'
#' # The final value is always equal to the equivalent reduction:
#' 1:5 %>% reduce(`+`)
#'
#' # It is easier to understand the details of the reduction with
#' # `paste()`.
#' accumulate(letters[1:5], paste, sep = ".")
#'
#' # Note how the intermediary reduced values are passed to the left
#' # with a left reduction, and to the right otherwise:
#' accumulate(letters[1:5], paste, sep = ".", .dir = "backward")
#'
#' # `accumulate2()` is a version of `accumulate()` that works with
#' # ternary functions and one additional vector:
#' paste2 <- function(x, y, sep = ".") paste(x, y, sep = sep)
#' letters[1:4] %>% accumulate(paste2)
#' letters[1:4] %>% accumulate2(c("-", ".", "-"), paste2)
#'
#' # Simulating stochastic processes with drift
#' \dontrun{
#' library(dplyr)
#' library(ggplot2)
#'
#' rerun(5, rnorm(100)) %>%
#'   set_names(paste0("sim", 1:5)) %>%
#'   map(~ accumulate(., ~ .05 + .x + .y)) %>%
#'   map_dfr(~ data_frame(value = .x, step = 1:100), .id = "simulation") %>%
#'   ggplot(aes(x = step, y = value)) +
#'     geom_line(aes(color = simulation)) +
#'     ggtitle("Simulations of a random walk with drift")
#' }
#' @export
accumulate <- function(.x, .f, ..., .init, .dir = c("forward", "backward")) {
  left <- arg_match(.dir, c("forward", "backward")) == "forward"

  .f <- as_mapper(.f, ...)
  f <- function(x, y) {
    .f(x, y, ...)
  }

  res <- Reduce(f, .x, init = .init, accumulate = TRUE, right = !left)
  names(res) <- accumulate_names(names(.x), .init, left = left)

  res
}
#' @rdname accumulate
#' @export
accumulate2 <- function(.x, .y, .f, ..., .init) {
  reduce2_impl(.x, .y, .f, ..., .init = .init, .acc = TRUE)
}

accumulate_names <- function(nms, init, left = left) {
  if (is_null(nms)) {
    return(NULL)
  }

  if (!missing(init)) {
    nms <- c(".init", nms)
  }
  if (!left) {
    nms <- rev(nms)
  }

  nms
}

#' Reduce from the right (retired)
#'
#' @description
#'
#' \Sexpr[results=rd, stage=render]{purrr:::lifecycle("soft-deprecated")}
#'
#' These functions are retired as of purrr 0.3.0. Please use the
#' `.dir` argument of [reduce()] instead, or reverse your vectors
#' and use a left reduction.
#'
#' @inheritParams reduce
#'
#' @keywords internal
#' @export
reduce_right <- function(.x, .f, ..., .init) {
  signal_soft_deprecated(paste_line(
    "`reduce_right()` is soft-deprecated as of purrr 0.3.0.",
    "Please use the new `.dir` argument of `reduce()` instead.",
    "",
    "  # Before:",
    "  reduce_right(1:3, f)",
    "",
    "  # After:",
    "  reduce(1:3, f, .dir = \"backward\")  # New algorithm",
    "  reduce(rev(1:3), f)                # Same algorithm as reduce_right()",
    ""
  ))
  .x <- rev(.x) # Compatibility
  reduce_impl(.x, .f, ..., .init = .init)
}
#' @rdname reduce_right
#' @export
reduce2_right <- function(.x, .y, .f, ..., .init) {
  signal_soft_deprecated(paste_line(
    "`reduce2_right()` is soft-deprecated as of purrr 0.3.0.",
    "Please reverse your vectors and use `reduce2()` instead.",
    "",
    "  # Before:",
    "  reduce2_right(x, y, f)",
    "",
    "  # After:",
    "  reduce2(rev(x), rev(y), f)",
    ""
  ))
  reduce2_impl(.x, .y, .f, ..., .init = .init, .left = FALSE)
}

#' @rdname reduce_right
#' @export
accumulate_right <- function(.x, .f, ..., .init) {
  signal_soft_deprecated(paste_line(
    "`accumulate_right()` is soft-deprecated as of purrr 0.3.0.",
    "Please use the new `.dir` argument of `accumulate()` instead.",
    "",
    "  # Before:",
    "  accumulate_right(x, f)",
    "",
    "  # After:",
    "  accumulate(x, f, .dir = \"backward\")",
    ""
  ))

  # Note the order of arguments is switched
  f <- function(y, x) {
    .f(x, y, ...)
  }

  accumulate(.x, f, .init = .init, .dir = "backward")
}
