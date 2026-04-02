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
#> 115  81  87 110  97  91 105  94 108 112 
table(rdunif(1e3, 10, -5))
#> 
#> -5 -4 -3 -2 -1  0  1  2  3  4  5  6  7  8  9 10 
#> 60 55 61 51 57 73 71 53 57 70 65 65 60 61 64 77 
```
