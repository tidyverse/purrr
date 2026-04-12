# Re-run expressions multiple times

**\[deprecated\]**

This function was deprecated in purrr 1.0.0 because we believe that NSE
functions are not a good fit for purrr. Also, `rerun(n, x)` can just as
easily be expressed as `map(1:n, \(i) x)`

`rerun()` is a convenient way of generating sample data. It works
similarly to
[`replicate`](https://rdrr.io/r/base/lapply.html)`(..., simplify = FALSE)`.

## Usage

``` r
rerun(.n, ...)
```

## Arguments

- .n:

  Number of times to run expressions

- ...:

  Expressions to re-run.

## Value

A list of length `.n`. Each element of `...` will be re-run once for
each `.n`.

There is one special case: if there's a single unnamed input, the second
level list will be dropped. In this case, `rerun(n, x)` behaves like
`replicate(n, x, simplify = FALSE)`.

## Examples

``` r
# old
5 |> rerun(rnorm(5)) |> str()
#> Warning: `rerun()` was deprecated in purrr 1.0.0.
#> ℹ Please use `map()` instead.
#>   # Previously
#>   rerun(5, rnorm(5))
#> 
#>   # Now
#>   map(1:5, ~ rnorm(5))
#> List of 5
#>  $ : num [1:5] 1.881 -0.125 -0.759 -0.509 -0.156
#>  $ : num [1:5] 0.1326 -0.9741 -1.2509 -0.0463 1.1374
#>  $ : num [1:5] 1.264 -0.549 0.682 -0.93 -0.975
#>  $ : num [1:5] -0.0271 0.4467 -0.3291 0.113 1.0512
#>  $ : num [1:5] 0.327 0.787 0.442 -1.019 -0.159
# new
1:5 |> map(\(i) rnorm(5)) |> str()
#> List of 5
#>  $ : num [1:5] -1.638 2.839 0.962 0.508 0.26
#>  $ : num [1:5] -0.773 -1.806 0.178 -0.526 0.4
#>  $ : num [1:5] -0.1226 -0.0713 2.0957 1.3221 1.2006
#>  $ : num [1:5] -0.7819 -0.4415 -0.246 0.3658 -0.0341
#>  $ : num [1:5] 0.2962 -0.2211 0.1877 -0.4381 -0.0887

# old
5 |>
  rerun(x = rnorm(5), y = rnorm(5)) |>
  map_dbl(\(l) cor(l$x, l$y))
#> Warning: `rerun()` was deprecated in purrr 1.0.0.
#> ℹ Please use `map()` instead.
#>   # Previously
#>   rerun(5, x = rnorm(5), y = rnorm(5))
#> 
#>   # Now
#>   map(1:5, ~ list(x = rnorm(5), y = rnorm(5)))
#> [1]  0.9497046 -0.3541633  0.8256722 -0.9416334 -0.5836642
# new
1:5 |>
  map(\(i) list(x = rnorm(5), y = rnorm(5))) |>
  map_dbl(\(l) cor(l$x, l$y))
#> [1]  0.90817642  0.01256163  0.65647896 -0.52973208  0.53135577
```
