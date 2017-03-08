#' Reduce a list to a single value by iteratively applying a binary function.
#'
#' `reduce()` combines from the left, `reduce_right()` combines from
#' the right.
#'
#' @inheritParams map
#' @param .f A two-argument function. The function will be passed the
#'   accumulated value as the first argument and the "next" value as the
#'   second argument.
#' @param .init If supplied, will be used as the first value to start
#'   the accumulation, rather than using \code{x[[1]]}. This is useful if
#'   you want to ensure that `reduce` returns a correct value when `.x`
#'   is empty. If missing, and `x` is empty, will throw an error.
#' @export
#' @examples
#' 1:3 %>% reduce(`+`)
#' 1:10 %>% reduce(`*`)
#'
#' samples <- rerun(2, sample(10, 5))
#' samples
#' reduce(samples, union)
#' reduce(samples, intersect)
#'
#' x <- list(c(0, 1), c(2, 3), c(4, 5))
#' x %>% reduce(c)
#' x %>% reduce_right(c)
#' # Equivalent to:
#' x %>% rev() %>% reduce(c)
reduce <- function(.x, .f, ..., .init) {
  reduce_impl(.x, .f, ..., .init = .init, .left = TRUE)
}

#' @export
#' @rdname reduce
reduce_right <- function(.x, .f, ..., .init) {
  reduce_impl(.x, .f, ..., .init = .init, .left = FALSE)
}

reduce_impl <- function(.x, .f, ..., .init, .left = TRUE) {
  out <- reduce_init(.x, .init, left = .left)
  idx <- reduce_index(.x, .init, left = .left)

  .f <- as_function(.f, ...)
  for (i in idx) {
    out <- .f(out, .x[[i]], ...)
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
#'   map_df(~ data_frame(value = .x, step = 1:100), .id = "simulation") %>%
#'   ggplot(aes(x = step, y = value)) +
#'     geom_line(aes(color = simulation)) +
#'     ggtitle("Simulations of a random walk with drift")
#' }
accumulate <- function(.x, .f, ..., .init) {
  .f <- as_function(.f, ...)

  f <- function(x, y) {
    .f(x, y, ...)
  }

  Reduce(f, .x, init = .init, accumulate = TRUE)
}

#' @export
#' @rdname accumulate
accumulate_right <- function(.x, .f, ..., .init) {
  .f <- as_function(.f, ...)

  # Note the order of arguments is switched
  f <- function(x, y) {
    .f(y, x, ...)
  }

  Reduce(f, .x, init = .init, right = TRUE, accumulate = TRUE)
}
