# Transpose a list

`list_transpose()` turns a list-of-lists "inside-out". For instance it
turns a pair of lists into a list of pairs, or a list of pairs into a
pair of lists. For example, if you had a list of length `n` where each
component had values `a` and `b`, `list_transpose()` would make a list
with elements `a` and `b` that contained lists of length `n`.

It's called transpose because `x[["a"]][["b"]]` is equivalent to
`list_transpose(x)[["b"]][["a"]]`, i.e. transposing a list flips the
order of indices in a similar way to transposing a matrix.

## Usage

``` r
list_transpose(
  x,
  ...,
  template = NULL,
  simplify = NA,
  ptype = NULL,
  default = NULL
)
```

## Arguments

- x:

  A list of vectors to transpose.

- ...:

  These dots are for future extensions and must be empty.

- template:

  A "template" that describes the output list. Can either be a character
  vector (where elements are extracted by name), or an integer vector
  (where elements are extracted by position). Defaults to the union of
  the names of the elements of `x`, or if they're not present, the union
  of the integer indices.

- simplify:

  Should the result be
  [simplified](https://purrr.tidyverse.org/dev/reference/list_simplify.md)?

  - `TRUE`: simplify or die trying.

  - `NA`: simplify if possible.

  - `FALSE`: never try to simplify, always leaving as a list.

  Alternatively, a named list specifying the simplification by output
  element.

- ptype:

  An optional vector prototype used to control the simplification.
  Alternatively, a named list specifying the prototype by output
  element.

- default:

  A default value to use if a value is absent or `NULL`. Alternatively,
  a named list specifying the default by output element.

## Examples

``` r
# list_transpose() is useful in conjunction with safely()
x <- list("a", 1, 2)
y <- x |> map(safely(log))
y |> str()
#> List of 3
#>  $ :List of 2
#>   ..$ result: NULL
#>   ..$ error :List of 2
#>   .. ..$ message: chr "non-numeric argument to mathematical function"
#>   .. ..$ call   : language .f(...)
#>   .. ..- attr(*, "class")= chr [1:3] "simpleError" "error" "condition"
#>  $ :List of 2
#>   ..$ result: num 0
#>   ..$ error : NULL
#>  $ :List of 2
#>   ..$ result: num 0.693
#>   ..$ error : NULL
# Put all the errors and results together
y |> list_transpose() |> str()
#> List of 2
#>  $ result:List of 3
#>   ..$ : NULL
#>   ..$ : num 0
#>   ..$ : num 0.693
#>  $ error :List of 3
#>   ..$ :List of 2
#>   .. ..$ message: chr "non-numeric argument to mathematical function"
#>   .. ..$ call   : language .f(...)
#>   .. ..- attr(*, "class")= chr [1:3] "simpleError" "error" "condition"
#>   ..$ : NULL
#>   ..$ : NULL
# Supply a default result to further simplify
y |> list_transpose(default = list(result = NA)) |> str()
#> List of 2
#>  $ result: num [1:3] NA 0 0.693
#>  $ error :List of 3
#>   ..$ :List of 2
#>   .. ..$ message: chr "non-numeric argument to mathematical function"
#>   .. ..$ call   : language .f(...)
#>   .. ..- attr(*, "class")= chr [1:3] "simpleError" "error" "condition"
#>   ..$ : NULL
#>   ..$ : NULL

# list_transpose() will try to simplify by default:
x <- list(list(a = 1, b = 2), list(a = 3, b = 4), list(a = 5, b = 6))
x |> list_transpose()
#> $a
#> [1] 1 3 5
#> 
#> $b
#> [1] 2 4 6
#> 
# this makes list_tranpose() not completely symmetric
x |> list_transpose() |> list_transpose()
#> [[1]]
#> a b 
#> 1 2 
#> 
#> [[2]]
#> a b 
#> 3 4 
#> 
#> [[3]]
#> a b 
#> 5 6 
#> 

# use simplify = FALSE to always return lists:
x |> list_transpose(simplify = FALSE) |> str()
#> List of 2
#>  $ a:List of 3
#>   ..$ : num 1
#>   ..$ : num 3
#>   ..$ : num 5
#>  $ b:List of 3
#>   ..$ : num 2
#>   ..$ : num 4
#>   ..$ : num 6
x |>
  list_transpose(simplify = FALSE) |>
  list_transpose(simplify = FALSE) |> str()
#> List of 3
#>  $ :List of 2
#>   ..$ a: num 1
#>   ..$ b: num 2
#>  $ :List of 2
#>   ..$ a: num 3
#>   ..$ b: num 4
#>  $ :List of 2
#>   ..$ a: num 5
#>   ..$ b: num 6

# Provide an explicit template if you know which elements you want to extract
ll <- list(
  list(x = 1, y = "one"),
  list(z = "deux", x = 2)
)
ll |> list_transpose()
#> $x
#> [1] 1 2
#> 
#> $y
#> $y[[1]]
#> [1] "one"
#> 
#> $y[[2]]
#> NULL
#> 
#> 
#> $z
#> $z[[1]]
#> NULL
#> 
#> $z[[2]]
#> [1] "deux"
#> 
#> 
ll |> list_transpose(template = c("x", "y", "z"))
#> $x
#> [1] 1 2
#> 
#> $y
#> $y[[1]]
#> [1] "one"
#> 
#> $y[[2]]
#> NULL
#> 
#> 
#> $z
#> $z[[1]]
#> NULL
#> 
#> $z[[2]]
#> [1] "deux"
#> 
#> 
ll |> list_transpose(template = 1)
#> [[1]]
#> [[1]][[1]]
#> [1] 1
#> 
#> [[1]][[2]]
#> [1] "deux"
#> 
#> 

# And specify a default if you want to simplify
ll |> list_transpose(template = c("x", "y", "z"), default = NA)
#> $x
#> [1] 1 2
#> 
#> $y
#> [1] "one" NA   
#> 
#> $z
#> [1] NA     "deux"
#> 
```
