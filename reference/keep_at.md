# Keep/discard elements based on their name/position

`keep_at()` and `discard_at()` are similar to `[` or
[`dplyr::select()`](https://dplyr.tidyverse.org/reference/select.html):
they return the same type of data structure as the input, but only
containing the requested elements. (If you're looking for a function
similar to `[[` see
[`pluck()`](https://purrr.tidyverse.org/reference/pluck.md)/[`chuck()`](https://purrr.tidyverse.org/reference/chuck.md)).

## Usage

``` r
keep_at(x, at)

discard_at(x, at)
```

## Arguments

- x:

  A list or atomic vector.

- at:

  A logical, integer, or character vector giving the elements to select.
  Alternatively, a function that takes a vector of names, and returns a
  logical, integer, or character vector of elements to select.

  **\[deprecated\]**: if the tidyselect package is installed, you can
  use [`vars()`](https://dplyr.tidyverse.org/reference/vars.html) and
  tidyselect helpers to select elements.

## See also

[`keep()`](https://purrr.tidyverse.org/reference/keep.md)/[`discard()`](https://purrr.tidyverse.org/reference/keep.md)
to keep/discard elements by value.

## Examples

``` r
x <- c(a = 1, b = 2, cat = 10, dog = 15, elephant = 5, e = 10)
x |> keep_at(letters)
#>  a  b  e 
#>  1  2 10 
x |> discard_at(letters)
#>      cat      dog elephant 
#>       10       15        5 

# Can also use a function
x |> keep_at(\(x) nchar(x) == 3)
#> cat dog 
#>  10  15 
x |> discard_at(\(x) nchar(x) == 3)
#>        a        b elephant        e 
#>        1        2        5       10 
```
