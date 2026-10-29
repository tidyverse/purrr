# Keep/discard elements based on their values

`keep()` selects all elements where `.p` evaluates to `TRUE`;
`discard()` selects all elements where `.p` evaluates to `FALSE`.
`compact()` discards elements where `.p` evaluates to an empty vector.

## Usage

``` r
keep(.x, .p, ..., .progress = FALSE)

discard(.x, .p, ..., .progress = FALSE)

compact(.x, .p = identity, .progress = FALSE)
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

  Wrap a function with
  [`in_parallel()`](https://purrr.tidyverse.org/dev/reference/in_parallel.md)
  to declare that it should be performed in parallel. See
  [`in_parallel()`](https://purrr.tidyverse.org/dev/reference/in_parallel.md)
  for more details. Use of `...` is not permitted in this context.

- ...:

  Additional arguments passed on to `.p`.

- .progress:

  Whether to show a progress bar. Use `TRUE` to turn on a basic progress
  bar, use a string to give it a name, or see
  [progress_bars](https://purrr.tidyverse.org/dev/reference/progress_bars.md)
  for more details.

## Details

In other languages, `keep()` and `discard()` are often called
[`select()`](https://dplyr.tidyverse.org/reference/select.html)/
[`filter()`](https://dplyr.tidyverse.org/reference/filter.html) and
`reject()`/ [`drop()`](https://rdrr.io/r/base/drop.html), but those
names are already taken in R. `keep()` is similar to
[`Filter()`](https://rdrr.io/r/base/funprog.html), but the argument
order is more convenient, and the evaluation of the predicate function
`.p` is stricter.

`.p` is called once for each element of `.x`, as
`.p(.x[[1]], ...), .p(.x[[2]], ...), ...`, and must return a single
`TRUE` or `FALSE`.

## See also

[`keep_at()`](https://purrr.tidyverse.org/dev/reference/keep_at.md)/[`discard_at()`](https://purrr.tidyverse.org/dev/reference/keep_at.md)
to keep/discard elements by name.

## Examples

``` r
rep(10, 10) |>
  map(sample, 5) |>
  keep(function(x) mean(x) > 6)
#> [[1]]
#> [1]  5  2  8  6 10
#> 
#> [[2]]
#> [1] 4 9 8 5 6
#> 
#> [[3]]
#> [1]  7 10  8  3  4
#> 

# Or use shorthand form
rep(10, 10) |>
  map(sample, 5) |>
  keep(\(x) mean(x) > 6)
#> [[1]]
#> [1] 10  8  9  5  1
#> 
#> [[2]]
#> [1]  2 10  7  5  8
#> 

# Using a string instead of a function will select all list elements
# where that subelement is TRUE
x <- map(1:5, \(.x) list(a = runif(1) > 0.5, b = sample(10)))
x
#> [[1]]
#> [[1]]$a
#> [1] FALSE
#> 
#> [[1]]$b
#>  [1]  1  7  4  5  3  9  2 10  8  6
#> 
#> 
#> [[2]]
#> [[2]]$a
#> [1] FALSE
#> 
#> [[2]]$b
#>  [1]  4  8  9 10  7  3  2  5  1  6
#> 
#> 
#> [[3]]
#> [[3]]$a
#> [1] FALSE
#> 
#> [[3]]$b
#>  [1]  3  9  6 10  2  5  8  4  7  1
#> 
#> 
#> [[4]]
#> [[4]]$a
#> [1] FALSE
#> 
#> [[4]]$b
#>  [1]  2 10  1  5  6  9  4  7  3  8
#> 
#> 
#> [[5]]
#> [[5]]$a
#> [1] FALSE
#> 
#> [[5]]$b
#>  [1]  7  9  6  4  8  2  1  5 10  3
#> 
#> 
x |> keep("a")
#> list()
x |> discard("a")
#> [[1]]
#> [[1]]$a
#> [1] FALSE
#> 
#> [[1]]$b
#>  [1]  1  7  4  5  3  9  2 10  8  6
#> 
#> 
#> [[2]]
#> [[2]]$a
#> [1] FALSE
#> 
#> [[2]]$b
#>  [1]  4  8  9 10  7  3  2  5  1  6
#> 
#> 
#> [[3]]
#> [[3]]$a
#> [1] FALSE
#> 
#> [[3]]$b
#>  [1]  3  9  6 10  2  5  8  4  7  1
#> 
#> 
#> [[4]]
#> [[4]]$a
#> [1] FALSE
#> 
#> [[4]]$b
#>  [1]  2 10  1  5  6  9  4  7  3  8
#> 
#> 
#> [[5]]
#> [[5]]$a
#> [1] FALSE
#> 
#> [[5]]$b
#>  [1]  7  9  6  4  8  2  1  5 10  3
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
