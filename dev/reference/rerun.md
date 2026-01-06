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
#>  $ : num [1:5] 0.442 -1.019 -0.159 -1.638 2.839
#>  $ : num [1:5] 0.962 0.508 0.26 -0.773 -1.806
#>  $ : num [1:5] 0.1784 -0.5258 0.4002 -0.1226 -0.0713
#>  $ : num [1:5] 2.096 1.322 1.201 -0.782 -0.441
#>  $ : num [1:5] -0.246 0.3658 -0.0341 0.2962 -0.2211
# new
1:5 |> map(\(i) rnorm(5)) |> str()
#> List of 5
#>  $ : num [1:5] 0.1877 -0.4381 -0.0887 0.6343 0.8655
#>  $ : num [1:5] -0.4306 0.013 0.0512 0.5386 0.5197
#>  $ : num [1:5] -2.423 -0.806 -0.485 -0.653 -0.294
#>  $ : num [1:5] -0.27699 0.13647 1.06721 0.00183 0.14009
#>  $ : num [1:5] -0.521 2.366 -1.696 0.683 1.362

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
#> [1]  0.7025860 -0.7953249 -0.1909003  0.2530562 -0.1335784
# new
1:5 |>
  map(\(i) list(x = rnorm(5), y = rnorm(5))) |>
  map_dbl(\(l) cor(l$x, l$y))
#> [1]  0.1823376 -0.5566398  0.7327008 -0.3245149  0.5244111
```
