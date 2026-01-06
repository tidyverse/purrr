# Keep/discard elements based on their values

`keep()` selects all elements where `.p` evaluates to `TRUE`;
`discard()` selects all elements where `.p` evaluates to `FALSE`.
`compact()` discards elements where `.p` evaluates to an empty vector.

## Usage

``` r
keep(.x, .p, ...)

discard(.x, .p, ...)

compact(.x, .p = identity)
```

## Arguments

- .x:

  A list or vector.

- .p:

  A predicate function (i.e. a function that returns either `TRUE` or
  `FALSE`) specified in one of the following ways:

  - A named function, e.g. `is.character`.

  - An anonymous function, e.g. `\(x) all(x < 0)` or
    `function(x) all(x < 0)`.

  - A formula, e.g. `~ all(.x < 0)`. Use `.x` to refer to the first
    argument. No longer recommended.

- ...:

  Additional arguments passed on to `.p`.

## Details

In other languages, `keep()` and `discard()` are often called
[`select()`](https://dplyr.tidyverse.org/reference/select.html)/
[`filter()`](https://dplyr.tidyverse.org/reference/filter.html) and
`reject()`/ [`drop()`](https://rdrr.io/r/base/drop.html), but those
names are already taken in R. `keep()` is similar to
[`Filter()`](https://rdrr.io/r/base/funprog.html), but the argument
order is more convenient, and the evaluation of the predicate function
`.p` is stricter.

## See also

[`keep_at()`](https://purrr.tidyverse.org/dev/reference/keep_at.md)/[`discard_at()`](https://purrr.tidyverse.org/dev/reference/keep_at.md)
to keep/discard elements by name.

## Examples

``` r
rep(10, 10) |>
  map(sample, 5) |>
  keep(function(x) mean(x) > 6)
#> [[1]]
#> [1]  8  6 10  3  9
#> 
#> [[2]]
#> [1] 6 7 9 5 8
#> 
#> [[3]]
#> [1] 9 8 5 2 7
#> 

# Or use shorthand form
rep(10, 10) |>
  map(sample, 5) |>
  keep(\(x) mean(x) > 6)
#> [[1]]
#> [1] 10  9  6  4  7
#> 
#> [[2]]
#> [1]  8  2  7  5 10
#> 

# Using a string instead of a function will select all list elements
# where that subelement is TRUE
x <- rerun(5, a = rbernoulli(1), b = sample(10))
#> Warning: `rerun()` was deprecated in purrr 1.0.0.
#> ℹ Please use `map()` instead.
#>   # Previously
#>   rerun(5, a = rbernoulli(1), b = sample(10))
#> 
#>   # Now
#>   map(1:5, ~ list(a = rbernoulli(1), b = sample(10)))
#> Warning: `rbernoulli()` was deprecated in purrr 1.0.0.
x
#> [[1]]
#> [[1]]$a
#> [1] TRUE
#> 
#> [[1]]$b
#>  [1]  2  9  5  6  1  8  7  4  3 10
#> 
#> 
#> [[2]]
#> [[2]]$a
#> [1] FALSE
#> 
#> [[2]]$b
#>  [1]  2 10  3  5  4  8  7  6  9  1
#> 
#> 
#> [[3]]
#> [[3]]$a
#> [1] TRUE
#> 
#> [[3]]$b
#>  [1]  2  9  1  5  4  6  3  8  7 10
#> 
#> 
#> [[4]]
#> [[4]]$a
#> [1] FALSE
#> 
#> [[4]]$b
#>  [1]  9  3  6  2  1  7  5  8 10  4
#> 
#> 
#> [[5]]
#> [[5]]$a
#> [1] TRUE
#> 
#> [[5]]$b
#>  [1]  3  5  2  8  6  1  7 10  4  9
#> 
#> 
x |> keep("a")
#> [[1]]
#> [[1]]$a
#> [1] TRUE
#> 
#> [[1]]$b
#>  [1]  2  9  5  6  1  8  7  4  3 10
#> 
#> 
#> [[2]]
#> [[2]]$a
#> [1] TRUE
#> 
#> [[2]]$b
#>  [1]  2  9  1  5  4  6  3  8  7 10
#> 
#> 
#> [[3]]
#> [[3]]$a
#> [1] TRUE
#> 
#> [[3]]$b
#>  [1]  3  5  2  8  6  1  7 10  4  9
#> 
#> 
x |> discard("a")
#> [[1]]
#> [[1]]$a
#> [1] FALSE
#> 
#> [[1]]$b
#>  [1]  2 10  3  5  4  8  7  6  9  1
#> 
#> 
#> [[2]]
#> [[2]]$a
#> [1] FALSE
#> 
#> [[2]]$b
#>  [1]  9  3  6  2  1  7  5  8 10  4
#> 
#> 

# compact() discards elements that are NULL or that have length zero
list(a = "a", b = NULL, c = integer(0), d = NA, e = list()) |>
  compact()
#> $a
#> [1] "a"
#> 
#> $d
#> [1] NA
#> 
```
