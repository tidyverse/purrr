# Generate random sample from a discrete uniform distribution

**\[deprecated\]**

This function was deprecated in purrr 1.0.0 because it's not related to
the core purpose of purrr.

## Usage

``` r
rdunif(n, b, a = 1)
```

## Arguments

- n:

  Number of samples to draw.

- a, b:

  Range of the distribution (inclusive).

## Examples

``` r
table(rdunif(1e3, 10))
#> Warning: `rdunif()` was deprecated in purrr 1.0.0.
#> 
#>   1   2   3   4   5   6   7   8   9  10 
#> 116  79  90 110  93  94 106  93 110 109 
table(rdunif(1e3, 10, -5))
#> 
#> -5 -4 -3 -2 -1  0  1  2  3  4  5  6  7  8  9 10 
#> 64 54 58 48 63 73 74 55 52 72 65 63 60 60 64 75 
```
