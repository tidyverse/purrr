# Negate a predicate function so it selects what it previously rejected

Negating a function changes `TRUE` to `FALSE` and `FALSE` to `TRUE`.

## Usage

``` r
negate(.p)
```

## Arguments

- .p:

  A predicate function (i.e. a function that returns either `TRUE` or
  `FALSE`) specified in one of the following ways:

  - A named function, e.g. `is.character`.

  - An anonymous function, e.g. `\(x) all(x < 0)` or
    `function(x) all(x < 0)`.

  - A formula, e.g. `~ all(.x < 0)`. Use `.x` to refer to the first
    argument. No longer recommended.

## Value

A new predicate function.

## Adverbs

This function is called an adverb because it modifies the effect of a
function (a verb). If you'd like to include a function created an adverb
in a package, be sure to read
[faq-adverbs-export](https://purrr.tidyverse.org/dev/reference/faq-adverbs-export.md).

## See also

Other adverbs:
[`auto_browse()`](https://purrr.tidyverse.org/dev/reference/auto_browse.md),
[`compose()`](https://purrr.tidyverse.org/dev/reference/compose.md),
[`insistently()`](https://purrr.tidyverse.org/dev/reference/insistently.md),
[`partial()`](https://purrr.tidyverse.org/dev/reference/partial.md),
[`possibly()`](https://purrr.tidyverse.org/dev/reference/possibly.md),
[`quietly()`](https://purrr.tidyverse.org/dev/reference/quietly.md),
[`safely()`](https://purrr.tidyverse.org/dev/reference/safely.md),
[`slowly()`](https://purrr.tidyverse.org/dev/reference/slowly.md)

## Examples

``` r
x <- list(x = 1:10, y = rbernoulli(10), z = letters)
x |> keep(is.numeric) |> names()
#> [1] "x"
x |> keep(negate(is.numeric)) |> names()
#> [1] "y" "z"
# Same as
x |> discard(is.numeric)
#> $y
#>  [1]  TRUE FALSE FALSE  TRUE  TRUE FALSE FALSE  TRUE FALSE FALSE
#> 
#> $z
#>  [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p"
#> [17] "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"
#> 
```
