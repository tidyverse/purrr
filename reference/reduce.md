# Reduce a list to a single value by iteratively applying a binary function

`reduce()` is an operation that combines the elements of a vector into a
single value. The combination is driven by `.f`, a binary function that
takes two values and returns a single value: reducing `f` over `1:3`
computes the value `f(f(1, 2), 3)`.

## Usage

``` r
reduce(.x, .f, ..., .init, .dir = c("forward", "backward"))

reduce2(.x, .y, .f, ..., .init)
```

## Arguments

- .x:

  A list or atomic vector.

- .f:

  For `reduce()`, a 2-argument function. The function will be passed the
  accumulated value as the first argument and the "next" value as the
  second argument.

  For `reduce2()`, a 3-argument function. The function will be passed
  the accumulated value as the first argument, the next value of `.x` as
  the second argument, and the next value of `.y` as the third argument.

  The reduction terminates early if `.f` returns a value wrapped in a
  [`done()`](https://rlang.r-lib.org/reference/done.html).

- ...:

  Additional arguments passed on to the reduce function.

  We now generally recommend against using `...` to pass additional
  (constant) arguments to `.f`. Instead use a shorthand anonymous
  function:

      # Instead of
      x |> reduce(f, 1, 2, collapse = ",")
      # do:
      x |> reduce(\(x, y) f(x, y, 1, 2, collapse = ","))

  This makes it easier to understand which arguments belong to which
  function and will tend to yield better error messages.

- .init:

  If supplied, will be used as the first value to start the
  accumulation, rather than using `.x[[1]]`. This is useful if you want
  to ensure that `reduce` returns a correct value when `.x` is empty. If
  missing, and `.x` is empty, will throw an error.

- .dir:

  The direction of reduction as a string, one of `"forward"` (the
  default) or `"backward"`. See the section about direction below.

- .y:

  For `reduce2()` an additional argument that is passed to `.f`. If
  `init` is not set, `.y` should be 1 element shorter than `.x`.

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

[`accumulate()`](https://purrr.tidyverse.org/reference/accumulate.md)
for a version that returns all intermediate values of the reduction.

## Examples

``` r
# Reducing `+` computes the sum of a vector while reducing `*`
# computes the product:
1:3 |> reduce(`+`)
#> [1] 6
1:10 |> reduce(`*`)
#> [1] 3628800

# By ignoring the input vector (nxt), you can turn output of one step into
# the input for the next. This code takes 10 steps of a random walk:
reduce(1:10, \(acc, nxt) acc + rnorm(1), .init = 0)
#> [1] -0.1895743

# When the operation is associative, the direction of reduction
# does not matter:
reduce(1:4, `+`)
#> [1] 10
reduce(1:4, `+`, .dir = "backward")
#> [1] 10

# However with non-associative operations, the reduced value will
# be different as a function of the direction. For instance,
# `list()` will create left-leaning lists when reducing from the
# right, and right-leaning lists otherwise:
str(reduce(1:4, list))
#> List of 2
#>  $ :List of 2
#>   ..$ :List of 2
#>   .. ..$ : int 1
#>   .. ..$ : int 2
#>   ..$ : int 3
#>  $ : int 4
str(reduce(1:4, list, .dir = "backward"))
#> List of 2
#>  $ : int 1
#>  $ :List of 2
#>   ..$ : int 2
#>   ..$ :List of 2
#>   .. ..$ : int 3
#>   .. ..$ : int 4

# reduce2() takes a ternary function and a second vector that is
# one element smaller than the first vector:
paste2 <- function(x, y, sep = ".") paste(x, y, sep = sep)
letters[1:4] |> reduce(paste2)
#> [1] "a.b.c.d"
letters[1:4] |> reduce2(c("-", ".", "-"), paste2)
#> [1] "a-b.c-d"

x <- list(c(0, 1), c(2, 3), c(4, 5))
y <- list(c(6, 7), c(8, 9))
reduce2(x, y, paste)
#> [1] "0 2 6 4 8" "1 3 7 5 9"


# You can shortcircuit a reduction and terminate it early by
# returning a value wrapped in a done(). In the following example
# we return early if the result-so-far, which is passed on the LHS,
# meets a condition:
paste3 <- function(out, input, sep = ".") {
  if (nchar(out) > 4) {
    return(done(out))
  }
  paste(out, input, sep = sep)
}
letters |> reduce(paste3)
#> [1] "a.b.c"

# Here the early return branch checks the incoming inputs passed on
# the RHS:
paste4 <- function(out, input, sep = ".") {
  if (input == "j") {
    return(done(out))
  }
  paste(out, input, sep = sep)
}
letters |> reduce(paste4)
#> [1] "a.b.c.d.e.f.g.h.i"
```
