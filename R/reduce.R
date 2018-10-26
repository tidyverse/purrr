#' Reduce a list to a single value by iteratively applying a binary function.
#'
#' `reduce()` combines from the left, `reduce_right()` combines from
#' the right. `reduce(list(x1, x2, x3), f)` is equivalent to
#' `f(f(x1, x2), x3)`; `reduce_right(list(x1, x2, x3), f)` is equivalent to
#' `f(f(x3, x2), x1)`.
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
#'
#' @param .init If supplied, will be used as the first value to start
#'   the accumulation, rather than using \code{x[[1]]}. This is useful if
#'   you want to ensure that `reduce` returns a correct value when `.x`
#'   is empty. If missing, and `x` is empty, will throw an error.
#' @export
#' @examples
#' 1:3 %>% reduce(`+`)
#' 1:10 %>% reduce(`*`)
#'
#' paste2 <- function(x, y, sep = ".") paste(x, y, sep = sep)
#' letters[1:4] %>% reduce(paste2)
#' letters[1:4] %>% reduce2(c("-", ".", "-"), paste2)
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

#' @export
#' @rdname reduce
reduce2 <- function(.x, .y, .f, ..., .init) {
  reduce2_impl(.x, .y, .f, ..., .init = .init, .left = TRUE)
}

#' @export
#' @rdname reduce
reduce2_right <- function(.x, .y, .f, ..., .init) {
  reduce2_impl(.x, .f, .y, ..., .init = .init, .left = FALSE)
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

reduce_impl <- function(.x, .f, ..., .init, .left = TRUE) {
  out <- reduce_init(.x, .init, left = .left)
  idx <- reduce_index(.x, .init, left = .left)

  .f <- as_mapper(.f, ...)
  for (i in idx) {
    out <- .f(out, .x[[i]], ...)
  }

  out
}

#' Reduce a list to a single value by iterative applying a binary function
#'
#' `reduce_while` encapsulates the pattern of combining elements with
#' a two argument function until a condition is met or until all elements have
#' been consumed. `reduce_while` combines
#' elements from left to right, `reduce_while_right` combines from right to left.
#' `reduce2_while` and sided versions extend this to functions of three arguments.
#' By default results are the accumulated value up to, but not including the first
#' failing test. This can be configured with the `.hind` argument.
#' @inheritParams reduce
#' @param .p A predicate function to apply to the current result, evaluations is
#' stopped when `.p` evaluates to FALSE, or there are no elements to consume.
#' @param .hind Whether the results are hind facing. Default is the `TRUE` which
#' returns the last result that passes `.p`. Setting to `FALSE` returns
#' the result that first fails `.p`.
#' @export
#' @examples
#' 1:6 %>% reduce_while(`+`, ~ . < 5) ## adds 1 + 2, then fails on 3
#' 1:6 %>% reduce_while(`+`, ~ . < 5, .hind = FALSE) ## fails on +3, but returns that result
#' 1:6 %>% reduce_while_right(`+`, ~ . < 5)
#' 1:6 %>% reduce_while_right(`+`, ~ . < 5, .hind = FALSE)
#' 
#' paste2 <- function(x, y, sep = ".") paste(x, y, sep = sep)
#' letters[1:4] %>% reduce_while(paste2, ~ nchar(.) < 5)
#' letters[1:4] %>% reduce_while(paste2, ~ nchar(.) < 5, .hind = FALSE)
#' letters[1:4] %>% reduce2_while(c("-", ".", "-"), paste2, ~ !grepl("\\.", .))
#' letters[1:4] %>% reduce2_while(c("-", ".", "-"), paste2, ~ !grepl("\\.", .), .hind = FALSE)
reduce_while <- function(.x, .f, .p, ..., .init, .hind = TRUE){
  reduce_while_impl(.x, .f, .p, ..., .init = .init, .left = TRUE, .hind = .hind)
}

#' @export
#' @rdname reduce_while
reduce2_while <- function(.x, .y, .f, .p, ..., .init, .hind = TRUE){
  reduce2_while_impl(.x, .y, .f, .p, ..., .init = .init, .left = TRUE, .hind = .hind)
}

#' @export
#' @rdname reduce_while
reduce_while_right <- function(.x, .f, .p, ..., .init, .hind = TRUE){
  reduce_while_impl(.x, .f, .p, ..., .init = .init, .left = FALSE, .hind = .hind)
}

#' @export
#' @rdname reduce_while
reduce2_while <- function(.x, .y, .f, .p, ..., .init, .hind = TRUE){
  reduce2_while_impl(.x, .y, .f, .p, ..., .init = .init, .left = TRUE, .hind = .hind)
}

reduce_while_impl <- function(.x, .f, .p, ...,
                              .init, .left = TRUE, .hind = TRUE) {
  out <- reduce_init(.x, .init, left = .left)
  idx <- reduce_index(.x, .init, left = .left)

  .f <- as_mapper(.f, ...)
  .p <- as_mapper(.p)
  
  if(isFALSE(.p(out))){
    if(isTRUE(.hind)) return(NA)
    return(out)
  }
  
  for (i in idx) {
    new_out <- .f(out, .x[[i]], ...)
    if(isFALSE(.p(new_out))){
      if(isFALSE(.hind))
        out <- new_out

      break
    }

    out <- new_out
  }

  out
}

reduce2_while_impl <- function(.x, .y, .f, .p, ...,
                               .init, .left = TRUE, .hind = TRUE) {
  out <- reduce_init(.x, .init, left = .left)
  x_idx <- reduce_index(.x, .init, left = .left)
  y_idx <- reduce_index(.y, NULL, left = .left)

  if (length(x_idx) != length(y_idx)) {
    stop("`.y` does not have length ", length(x_idx))
  }

  .f <- as_mapper(.f, ...)
  .p <- as_mapper(.p)

  if(isFALSE(.p(out))){
    if(isTRUE(.hind)) return(NA)
    return(out)
  }
  
  for (i in seq_along(x_idx)) {
    x_i <- x_idx[[i]]
    y_i <- y_idx[[i]]

    new_out <- .f(out, .x[[x_i]], .y[[y_i]], ...)
    
    if(isFALSE(.p(new_out))){
      if(isFALSE(.hind))
        out <- new_out

      break
    }

    out <- new_out
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
#'
#' @return A vector the same length of `.x` with the same names as `.x`
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
  names(res) <- names(.x)
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
  names(res) <- names(.x)
  res
}
