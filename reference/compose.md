# Compose multiple functions together to create a new function

Create a new function that is the composition of multiple functions,
i.e. `compose(f, g)` is equivalent to `function(...) f(g(...))`.

## Usage

``` r
compose(..., .dir = c("backward", "forward"))
```

## Arguments

- ...:

  Functions to apply in order (from right to left by default). Formulas
  are converted to functions in the usual way.

  [Dynamic dots](https://rlang.r-lib.org/reference/dyn-dots.html) are
  supported. In particular, if your functions are stored in a list, you
  can splice that in with `!!!`.

- .dir:

  If `"backward"` (the default), the functions are called in the reverse
  order, from right to left, as is conventional in mathematics. If
  `"forward"`, they are called from left to right.

## Value

A function

## Adverbs

This function is called an adverb because it modifies the effect of a
function (a verb). If you'd like to include a function created an adverb
in a package, be sure to read
[faq-adverbs-export](https://purrr.tidyverse.org/reference/faq-adverbs-export.md).

## See also

Other adverbs:
[`auto_browse()`](https://purrr.tidyverse.org/reference/auto_browse.md),
[`insistently()`](https://purrr.tidyverse.org/reference/insistently.md),
[`negate()`](https://purrr.tidyverse.org/reference/negate.md),
[`partial()`](https://purrr.tidyverse.org/reference/partial.md),
[`possibly()`](https://purrr.tidyverse.org/reference/possibly.md),
[`quietly()`](https://purrr.tidyverse.org/reference/quietly.md),
[`safely()`](https://purrr.tidyverse.org/reference/safely.md),
[`slowly()`](https://purrr.tidyverse.org/reference/slowly.md)

## Examples

``` r
not_null <- compose(`!`, is.null)
not_null(4)
#> [1] TRUE
not_null(NULL)
#> [1] FALSE

add1 <- function(x) x + 1
compose(add1, add1)(8)
#> [1] 10

fn <- compose(\(x) paste(x, "foo"), \(x) paste(x, "bar"))
fn("input")
#> [1] "input bar foo"

# Lists of functions can be spliced with !!!
fns <- list(
  function(x) paste(x, "foo"),
  \(x) paste(x, "bar")
)
fn <- compose(!!!fns)
fn("input")
#> [1] "input bar foo"
```
