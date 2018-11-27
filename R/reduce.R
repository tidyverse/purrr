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
#' @param .y For `reduce2()`, an additional argument that is passed to
#'   `.f`. If `init` is not set, `.y` should be 1 element shorter than
#'   `.x`.
#' @param .f For `reduce()`, a 2-argument function. The function will be
#'   passed the accumulated value as the first argument and the "next" value
#'   as the second argument.
#'
#'   For `reduce2()`, a 3-argument function. The function will be passed the
#'   accumulated value as the first argument, the next value of `.x` as the
#'   second argument, and the next value of `.y` as the third argument.
#' @param .init If supplied, will be used as the first value to start
#'   the accumulation, rather than using `x[[1]]`. This is useful if
#'   you want to ensure that `reduce` returns a correct value when `.x`
#'   is empty. If missing, and `x` is empty, will throw an error.
#' @param .dir The direction of reduction as a string, one of `"left"`
#'   or `"right"`. See the section about direction below.
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
#' `reduce(.dir = \"right\")` computes `f(1, f(2, 3))`. This is the
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
#' @examples
#' # Reducing `+` computes the sum of a vector while reducing `*`
#' # computes the product:
#' 1:3 %>% reduce(`+`)
#' 1:10 %>% reduce(`*`)
#'
#' # When the operation is associative, the direction of reduction
#' # does not matter:
#' reduce(1:4, `+`)
#' reduce(1:4, `+`, .dir = "right")
#'
#' # However with non-associative operations, the reduced value will
#' # be different as a function of the direction. For instance,
#' # `list()` will create left-leaning lists when reducing from the
#' # right, and right-leaning lists otherwise:
#' str(reduce(1:4, list))
#' str(reduce(1:4, list, .dir = "right"))
#'
#' paste2 <- function(x, y, sep = ".") paste(x, y, sep = sep)
#' letters[1:4] %>% reduce(paste2)
#' letters[1:4] %>% reduce2(c("-", ".", "-"), paste2)
#' letters[1:4] %>% reduce2_right(c("-", ".", "-"), paste2)
#'
#' samples <- rerun(2, sample(10, 5))
#' samples
#' reduce(samples, union)
#' reduce(samples, intersect)
#'
#' x <- list(c(0, 1), c(2, 3), c(4, 5))
#' y <- list(c(6, 7), c(8, 9))
#' reduce2(x, y, paste)
#' reduce2_right(x, y, paste)
#' # Equivalent to:
#' x %>% rev() %>% reduce2(rev(y), paste)
#' @export
reduce <- function(.x, .f, ..., .init, .dir = c("left", "right")) {
  reduce_impl(.x, .f, ..., .init = .init, .dir = .dir)
}

#' @rdname reduce
#' @export
reduce2 <- function(.x, .y, .f, ..., .init) {
  reduce2_impl(.x, .y, .f, ..., .init = .init, .left = TRUE)
}
#' @rdname reduce
#' @export
reduce2_right <- function(.x, .y, .f, ..., .init) {
  reduce2_impl(.x, .y, .f, ..., .init = .init, .left = FALSE)
}

reduce_impl <- function(.x, .f, ..., .init, .dir = "left") {
  left <- arg_match(.dir, c("left", "right")) == "left"

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

reduce2_impl <- function(.x, .y, .f, ..., .init, .left = TRUE) {
  out <- reduce_init(.x, .init, left = .left)
  x_idx <- reduce_index(.x, .init, left = .left)
  y_idx <- reduce_index(.y, NULL, left = .left)

  if (length(x_idx) != length(y_idx)) {
    stop("`.y` does not have length ", length(x_idx))
  }

  .f <- as_mapper(.f, ...)
  for (i in seq_along(x_idx)) {
    x_i <- x_idx[[i]]
    y_i <- y_idx[[i]]

    out <- .f(out, .x[[x_i]], .y[[y_i]], ...)
  }

  out
}

seq_len2 <- function(start, end) {
  if (start > end) {
    return(integer(0))
  }

  start:end
}

#' Accumulate recursive folds across a list
#'
#' `accumulate` applies a function recursively over a list from the left, while
#' `accumulate_right` applies the function from the right. Unlike `reduce`
#' both functions keep the intermediate results.
#'
#' @inheritParams reduce
#'
#' @return A vector the same length of `.x` with the same names as `.x`.
#'
#'   If `.init` is supplied, the length is extended by 1. If `.x` has
#'   names, the initial value is given the name `".init"`, otherwise
#'   the returned vector is kept unnamed.
#' @export
#' @examples
#' 1:3 %>% accumulate(`+`)
#' 1:10 %>% accumulate_right(`*`)
#'
#' # From Haskell's scanl documentation
#' 1:10 %>% accumulate(max, .init = 5)
#'
#' # Understanding the arguments .x and .y when .f
#' # is a lambda function
#' # .x is the accumulating value
#' 1:10 %>% accumulate(~ .x)
#' # .y is element in the list
#' 1:10 %>% accumulate(~ .y)
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
accumulate <- function(.x, .f, ..., .init) {
  .f <- as_mapper(.f, ...)

  f <- function(x, y) {
    .f(x, y, ...)
  }

  res <- Reduce(f, .x, init = .init, accumulate = TRUE)
  names(res) <- accumulate_names(names(.x), .init)

  res
}

#' @export
#' @rdname accumulate
accumulate_right <- function(.x, .f, ..., .init) {
  .f <- as_mapper(.f, ...)

  # Note the order of arguments is switched
  f <- function(x, y) {
    .f(y, x, ...)
  }

  res <- Reduce(f, .x, init = .init, right = TRUE, accumulate = TRUE)
  names(res) <- accumulate_names(names(.x), .init, right = TRUE)

  res
}

accumulate_names <- function(nms, init, right = FALSE) {
  if (is_null(nms)) {
    return(NULL)
  }

  if (!missing(init)) {
    nms <- c(".init", nms)
  }
  if (right) {
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
#' This function is retired as of purrr 0.3.0. Please use the `.dir`
#' argument of [reduce()] instead.
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
    "  reduce(1:3, f, .dir = \"right\")  # New algorithm",
    "  reduce(rev(1:3), f)             # Same algorithm as reduce_right()",
    ""
  ))
  .x <- rev(.x) # Compatibility
  reduce_impl(.x, .f, ..., .init = .init)
}
