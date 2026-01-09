# Partially apply a function, filling in some arguments

Partial function application allows you to modify a function by
pre-filling some of the arguments. It is particularly useful in
conjunction with functionals and other function operators.

## Usage

``` r
partial(.f, ...)
```

## Arguments

- .f:

  a function. For the output source to read well, this should be a named
  function.

- ...:

  named arguments to `.f` that should be partially applied.

  Pass an empty `... = ` argument to specify the position of future
  arguments relative to partialised ones. See
  [`rlang::call_modify()`](https://rlang.r-lib.org/reference/call_modify.html)
  to learn more about this syntax.

  These dots support quasiquotation. If you unquote a value, it is
  evaluated only once at function creation time. Otherwise, it is
  evaluated each time the function is called.

## Value

A function that takes the same arguments as `.f`, but returns a
different value, as described above.

## Details

`partial()` creates a function that takes `...` arguments. Unlike
[`compose()`](https://purrr.tidyverse.org/reference/compose.md) and
other function operators like
[`negate()`](https://purrr.tidyverse.org/reference/negate.md), it
doesn't reuse the function signature of `.f`. This is because
`partial()` explicitly supports NSE functions that use
[`substitute()`](https://rdrr.io/r/base/substitute.html) on their
arguments. The only way to support those is to forward arguments through
dots.

Other unsupported patterns:

- It is not possible to call `partial()` repeatedly on the same argument
  to pre-fill it with a different expression.

- It is not possible to refer to other arguments in pre-filled argument.

## Adverbs

This function is called an adverb because it modifies the effect of a
function (a verb). If you'd like to include a function created an adverb
in a package, be sure to read
[faq-adverbs-export](https://purrr.tidyverse.org/reference/faq-adverbs-export.md).

## See also

Other adverbs:
[`auto_browse()`](https://purrr.tidyverse.org/reference/auto_browse.md),
[`compose()`](https://purrr.tidyverse.org/reference/compose.md),
[`insistently()`](https://purrr.tidyverse.org/reference/insistently.md),
[`negate()`](https://purrr.tidyverse.org/reference/negate.md),
[`possibly()`](https://purrr.tidyverse.org/reference/possibly.md),
[`quietly()`](https://purrr.tidyverse.org/reference/quietly.md),
[`safely()`](https://purrr.tidyverse.org/reference/safely.md),
[`slowly()`](https://purrr.tidyverse.org/reference/slowly.md)

## Examples

``` r
# Partial is designed to replace the use of anonymous functions for
# filling in function arguments. Instead of:
compact1 <- function(x) discard(x, is.null)

# we can write:
compact2 <- partial(discard, .p = is.null)

# partial() works fine with functions that do non-standard
# evaluation
my_long_variable <- 1:10
plot2 <- partial(plot, my_long_variable)
plot2()

plot2(runif(10), type = "l")


# Note that you currently can't partialise arguments multiple times:
my_mean <- partial(mean, na.rm = TRUE)
my_mean <- partial(my_mean, na.rm = FALSE)
try(my_mean(1:10))
#> Error in mean.default(na.rm = TRUE, ...) : 
#>   formal argument "na.rm" matched by multiple actual arguments


# The evaluation of arguments normally occurs "lazily". Concretely,
# this means that arguments are repeatedly evaluated across invocations:
f <- partial(runif, n = rpois(1, 5))
f
#> <partialised>
#> function (...) 
#> runif(n = rpois(1, 5), ...)
#> <environment: 0x563ece16a010>
f()
#> [1] 0.9465589 0.8754108 0.2600589 0.6572984
f()
#> [1] 0.318848 0.623061

# You can unquote an argument to fix it to a particular value.
# Unquoted arguments are evaluated only once when the function is created:
f <- partial(runif, n = !!rpois(1, 5))
f
#> <partialised>
#> function (...) 
#> runif(n = 5L, ...)
#> <environment: 0x563ece16a010>
f()
#> [1] 0.7082934 0.8900290 0.1043065 0.6304117 0.8415589
f()
#> [1] 0.3642624 0.6229228 0.4607475 0.1634123 0.5138669


# By default, partialised arguments are passed before new ones:
my_list <- partial(list, 1, 2)
my_list("foo")
#> [[1]]
#> [1] 1
#> 
#> [[2]]
#> [1] 2
#> 
#> [[3]]
#> [1] "foo"
#> 

# Control the position of these arguments by passing an empty
# `... = ` argument:
my_list <- partial(list, 1, ... = , 2)
my_list("foo")
#> [[1]]
#> [1] 1
#> 
#> [[2]]
#> [1] "foo"
#> 
#> [[3]]
#> [1] 2
#> 
```
