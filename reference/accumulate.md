# Accumulate intermediate results of a vector reduction

`accumulate()` sequentially applies a 2-argument function to elements of
a vector. Each application of the function uses the initial value or
result of the previous application as the first argument. The second
argument is the next value of the vector. The results of each
application are returned in a list. The accumulation can optionally
terminate before processing the whole vector in response to a
[`done()`](https://rlang.r-lib.org/reference/done.html) signal returned
by the accumulation function.

By contrast to `accumulate()`,
[`reduce()`](https://purrr.tidyverse.org/reference/reduce.md) applies a
2-argument function in the same way, but discards all results except
that of the final function application.

`accumulate2()` sequentially applies a function to elements of two
lists, `.x` and `.y`.

## Usage

``` r
accumulate(
  .x,
  .f,
  ...,
  .init,
  .dir = c("forward", "backward"),
  .simplify = NA,
  .ptype = NULL
)

accumulate2(.x, .y, .f, ..., .init, .simplify = NA, .ptype = NULL)
```

## Arguments

- .x:

  A list or atomic vector.

- .f:

  For `accumulate()` `.f` is 2-argument function. The function will be
  passed the accumulated result or initial value as the first argument.
  The next value in sequence is passed as the second argument.

  For `accumulate2()`, a 3-argument function. The function will be
  passed the accumulated result as the first argument. The next value in
  sequence from `.x` is passed as the second argument. The next value in
  sequence from `.y` is passed as the third argument.

  The accumulation terminates early if `.f` returns a value wrapped in a
  [`done()`](https://rlang.r-lib.org/reference/done.html).

- ...:

  Additional arguments passed on to the mapped function.

  We now generally recommend against using `...` to pass additional
  (constant) arguments to `.f`. Instead use a shorthand anonymous
  function:

      # Instead of
      x |> map(f, 1, 2, collapse = ",")
      # do:
      x |> map(\(x) f(x, 1, 2, collapse = ","))

  This makes it easier to understand which arguments belong to which
  function and will tend to yield better error messages.

- .init:

  If supplied, will be used as the first value to start the
  accumulation, rather than using `.x[[1]]`. This is useful if you want
  to ensure that `reduce` returns a correct value when `.x` is empty. If
  missing, and `.x` is empty, will throw an error.

- .dir:

  The direction of accumulation as a string, one of `"forward"` (the
  default) or `"backward"`. See the section about direction below.

- .simplify:

  If `NA`, the default, the accumulated list of results is simplified to
  an atomic vector if possible. If `TRUE`, the result is simplified,
  erroring if not possible. If `FALSE`, the result is not simplified,
  always returning a list.

- .ptype:

  If `simplify` is `NA` or `TRUE`, optionally supply a vector prototype
  to enforce the output type.

- .y:

  For `accumulate2()` `.y` is the second argument of the pair. It needs
  to be 1 element shorter than the vector to be accumulated (`.x`). If
  `.init` is set, `.y` needs to be one element shorted than the
  concatenation of the initial value and `.x`.

## Value

A vector the same length of `.x` with the same names as `.x`.

If `.init` is supplied, the length is extended by 1. If `.x` has names,
the initial value is given the name `".init"`, otherwise the returned
vector is kept unnamed.

If `.dir` is `"forward"` (the default), the first element is the initial
value (`.init` if supplied, or the first element of `.x`) and the last
element is the final reduced value. In case of a right accumulation,
this order is reversed.

The accumulation terminates early if `.f` returns a value wrapped in a
[`done()`](https://rlang.r-lib.org/reference/done.html). If the done box
is empty, the last value is used instead and the result is one element
shorter (but always includes the initial value, even when terminating at
the first iteration).

## Direction

When `.f` is an associative operation like `+` or
[`c()`](https://rdrr.io/r/base/c.html), the direction of reduction does
not matter. For instance, reducing the vector `1:3` with the binary
function `+` computes the sum `((1 + 2) + 3)` from the left, and the
same sum `(1 + (2 + 3))` from the right.

In other cases, the direction has important consequences on the reduced
value. For instance, reducing a vector with
[`list()`](https://rdrr.io/r/base/list.html) from the left produces a
left-leaning nested list (or tree), while reducing
[`list()`](https://rdrr.io/r/base/list.html) from the right produces a
right-leaning list.

## See also

[`reduce()`](https://purrr.tidyverse.org/reference/reduce.md) when you
only need the final reduced value.

## Examples

``` r
# With an associative operation, the final value is always the
# same, no matter the direction. You'll find it in the first element for a
# backward (left) accumulation, and in the last element for forward
# (right) one:
1:5 |> accumulate(`+`)
#> [1]  1  3  6 10 15
1:5 |> accumulate(`+`, .dir = "backward")
#> [1] 15 14 12  9  5

# The final value is always equal to the equivalent reduction:
1:5 |> reduce(`+`)
#> [1] 15

# It is easier to understand the details of the reduction with
# `paste()`.
accumulate(letters[1:5], paste, sep = ".")
#> [1] "a"         "a.b"       "a.b.c"     "a.b.c.d"   "a.b.c.d.e"

# Note how the intermediary reduced values are passed to the left
# with a left reduction, and to the right otherwise:
accumulate(letters[1:5], paste, sep = ".", .dir = "backward")
#> [1] "a.b.c.d.e" "b.c.d.e"   "c.d.e"     "d.e"       "e"        

# By ignoring the input vector (nxt), you can turn output of one step into
# the input for the next. This code takes 10 steps of a random walk:
accumulate(1:10, \(acc, nxt) acc + rnorm(1), .init = 0)
#>  [1]  0.0000000  0.2553171 -2.1819466 -2.1875178 -1.5659651 -0.4175535
#>  [7] -2.2393712 -2.4866965 -2.7308961 -3.0136015 -3.5673009

# `accumulate2()` is a version of `accumulate()` that works with
# 3-argument functions and one additional vector:
paste2 <- function(acc, nxt, sep = ".") paste(acc, nxt, sep = sep)
letters[1:4] |> accumulate(paste2)
#> [1] "a"       "a.b"     "a.b.c"   "a.b.c.d"
letters[1:4] |> accumulate2(c("-", ".", "-"), paste2)
#> [1] "a"       "a-b"     "a-b.c"   "a-b.c-d"

# You can shortcircuit an accumulation and terminate it early by
# returning a value wrapped in a done(). In the following example
# we return early if the result-so-far, which is passed on the LHS,
# meets a condition:
paste3 <- function(out, input, sep = ".") {
  if (nchar(out) > 4) {
    return(done(out))
  }
  paste(out, input, sep = sep)
}
letters |> accumulate(paste3)
#> [1] "a"     "a.b"   "a.b.c" "a.b.c"

# Note how we get twice the same value in the accumulation. That's
# because we have returned it twice. To prevent this, return an empty
# done box to signal to accumulate() that it should terminate with the
# value of the last iteration:
paste3 <- function(out, input, sep = ".") {
  if (nchar(out) > 4) {
    return(done())
  }
  paste(out, input, sep = sep)
}
letters |> accumulate(paste3)
#> [1] "a"     "a.b"   "a.b.c"

# Here the early return branch checks the incoming inputs passed on
# the RHS:
paste4 <- function(out, input, sep = ".") {
  if (input == "f") {
    return(done())
  }
  paste(out, input, sep = sep)
}
letters |> accumulate(paste4)
#> [1] "a"         "a.b"       "a.b.c"     "a.b.c.d"   "a.b.c.d.e"


# Simulating stochastic processes with drift
if (FALSE) { # \dontrun{
library(dplyr)
library(ggplot2)

map(1:5, \(i) rnorm(100)) |>
  set_names(paste0("sim", 1:5)) |>
  map(\(l) accumulate(l, \(acc, nxt) .05 + acc + nxt)) |>
  map(\(x) tibble(value = x, step = 1:100)) |>
  list_rbind(names_to = "simulation") |>
  ggplot(aes(x = step, y = value)) +
    geom_line(aes(color = simulation)) +
    ggtitle("Simulations of a random walk with drift")
} # }
```
