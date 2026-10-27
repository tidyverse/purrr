# Re-run expressions multiple times

**\[defunct\]**

This function was deprecated in purrr 1.0.0 and is now defunct because
we believe that NSE functions are not a good fit for purrr. Also,
`rerun(n, x)` can just as easily be expressed as `map(1:n, \(i) x)`

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
# Instead of rerun(5, rnorm(5)), use:
1:5 |> map(\(i) rnorm(5)) |> str()
#> List of 5
#>  $ : num [1:5] -1.014 -1.367 -1.768 -0.565 -0.259
#>  $ : num [1:5] 1.631 0.325 -1.058 -1.366 0.355
#>  $ : num [1:5] -0.6728 0.4031 0.3333 1.4779 -0.0111
#>  $ : num [1:5] -0.678 -0.359 0.602 -0.75 -0.397
#>  $ : num [1:5] -1.9265 -2.2059 1.4322 -0.2397 -0.0294

# Instead of rerun(5, x = rnorm(5), y = rnorm(5)), use:
1:5 |>
  map(\(i) list(x = rnorm(5), y = rnorm(5))) |>
  map_dbl(\(l) cor(l$x, l$y))
#> [1]  0.80655709  0.09687883  0.08911504  0.24502508 -0.84317770
```
