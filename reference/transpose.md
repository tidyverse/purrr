# Transpose a list.

**\[superseded\]**

`transpose()` turns a list-of-lists "inside-out"; it turns a pair of
lists into a list of pairs, or a list of pairs into pair of lists. For
example, if you had a list of length n where each component had values
`a` and `b`, `transpose()` would make a list with elements `a` and `b`
that contained lists of length n. It's called transpose because
`x[[1]][[2]]` is equivalent to `transpose(x)[[2]][[1]]`.

This function was superseded in purrr 1.0.0 because
[`list_transpose()`](https://purrr.tidyverse.org/reference/list_transpose.md)
has a better name and can automatically simplify the output, as is
commonly needed. Superseded functions will not go away, but will only
receive critical bug fixes.

## Usage

``` r
transpose(.l, .names = NULL)
```

## Arguments

- .l:

  A list of vectors to transpose. The first element is used as the
  template; you'll get a warning if a subsequent element has a different
  length.

- .names:

  For efficiency, `transpose()` bases the return structure on the first
  component of `.l` by default. Specify `.names` to override this.

## Value

A list with indexing transposed compared to `.l`.

`transpose()` is its own inverse, much like the transpose operation on a
matrix. You can get back the original input by transposing it twice.

## Examples

``` r
x <- map(1:5, \(i) list(x = runif(1), y = runif(5)))
# was
x |> transpose() |> str()
#> List of 2
#>  $ x:List of 5
#>   ..$ : num 0.633
#>   ..$ : num 0.104
#>   ..$ : num 0.557
#>   ..$ : num 0.0568
#>   ..$ : num 0.915
#>  $ y:List of 5
#>   ..$ : num [1:5] 0.8332 0.3745 0.8264 0.1672 0.0548
#>   ..$ : num [1:5] 0.583 0.944 0.869 0.426 0.257
#>   ..$ : num [1:5] 0.1378 0.4203 0.2382 0.7582 0.0865
#>   ..$ : num [1:5] 0.308 0.677 0.925 0.265 0.304
#>   ..$ : num [1:5] 0.49922 0.26627 0.96272 0.00298 0.84882
# now
x |> list_transpose(simplify = FALSE) |> str()
#> List of 2
#>  $ x:List of 5
#>   ..$ : num 0.633
#>   ..$ : num 0.104
#>   ..$ : num 0.557
#>   ..$ : num 0.0568
#>   ..$ : num 0.915
#>  $ y:List of 5
#>   ..$ : num [1:5] 0.8332 0.3745 0.8264 0.1672 0.0548
#>   ..$ : num [1:5] 0.583 0.944 0.869 0.426 0.257
#>   ..$ : num [1:5] 0.1378 0.4203 0.2382 0.7582 0.0865
#>   ..$ : num [1:5] 0.308 0.677 0.925 0.265 0.304
#>   ..$ : num [1:5] 0.49922 0.26627 0.96272 0.00298 0.84882

# transpose() is useful in conjunction with safely() & quietly()
x <- list("a", 1, 2)
y <- x |> map(safely(log))
# was
y |> transpose() |> str()
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
# now:
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

# Previously, output simplification required a call to another function
x <- list(list(a = 1, b = 2), list(a = 3, b = 4), list(a = 5, b = 6))
x |> transpose() |> simplify_all()
#> $a
#> [1] 1 3 5
#> 
#> $b
#> [1] 2 4 6
#> 
# Now can take advantage of automatic simplification
x |> list_transpose()
#> $a
#> [1] 1 3 5
#> 
#> $b
#> [1] 2 4 6
#> 

# Provide explicit component names to prevent loss of those that don't
# appear in first component
ll <- list(
  list(x = 1, y = "one"),
  list(z = "deux", x = 2)
)
ll |> transpose()
#> $x
#> $x[[1]]
#> [1] 1
#> 
#> $x[[2]]
#> [1] 2
#> 
#> 
#> $y
#> $y[[1]]
#> [1] "one"
#> 
#> $y[[2]]
#> NULL
#> 
#> 
nms <- ll |> map(names) |> reduce(union)
# was
ll |> transpose(.names = nms)
#> $x
#> $x[[1]]
#> [1] 1
#> 
#> $x[[2]]
#> [1] 2
#> 
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
# now
ll |> list_transpose(template = nms)
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
# and can supply default value
ll |> list_transpose(template = nms, default = NA)
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
