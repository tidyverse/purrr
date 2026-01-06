# Apply a function to each element of a vector, and its index

`imap(x, ...)`, an indexed map, is short hand for
`map2(x, names(x), ...)` if `x` has names, or
`map2(x, seq_along(x), ...)` if it does not. This is useful if you need
to compute on both the value and the position of an element.

## Usage

``` r
imap(.x, .f, ...)

imap_lgl(.x, .f, ...)

imap_chr(.x, .f, ...)

imap_int(.x, .f, ...)

imap_dbl(.x, .f, ...)

imap_vec(.x, .f, ...)

iwalk(.x, .f, ...)
```

## Arguments

- .x:

  A list or atomic vector.

- .f:

  A function, specified in one of the following ways:

  - A named function, e.g. `paste`.

  - An anonymous function, e.g. `\(x, idx) x + idx` or
    `function(x, idx) x + idx`.

  - A formula, e.g. `~ .x + .y`. Use `.x` to refer to the current
    element and `.y` to refer to the current index. No longer
    recommended.

  **\[experimental\]**

  Wrap a function with
  [`in_parallel()`](https://purrr.tidyverse.org/dev/reference/in_parallel.md)
  to declare that it should be performed in parallel. See
  [`in_parallel()`](https://purrr.tidyverse.org/dev/reference/in_parallel.md)
  for more details. Use of `...` is not permitted in this context.

- ...:

  Additional arguments passed on to the mapped function.

  We now generally recommend against using `...` to pass additional
  (constant) arguments to `.f`. Instead use a shorthand anonymous
  function:

      # Instead of
      x |> map(f, 1, 2, collapse = ",")
      # do:
      x |> map(\(x) f(x, 1, 2, collapse = ","))

  This makes it easier to understand which arguments belong to which
  function and will tend to yield better error messages.

## Value

A vector the same length as `.x`.

## See also

Other map variants:
[`lmap()`](https://purrr.tidyverse.org/dev/reference/lmap.md),
[`map()`](https://purrr.tidyverse.org/dev/reference/map.md),
[`map2()`](https://purrr.tidyverse.org/dev/reference/map2.md),
[`map_depth()`](https://purrr.tidyverse.org/dev/reference/map_depth.md),
[`map_if()`](https://purrr.tidyverse.org/dev/reference/map_if.md),
[`modify()`](https://purrr.tidyverse.org/dev/reference/modify.md),
[`pmap()`](https://purrr.tidyverse.org/dev/reference/pmap.md)

## Examples

``` r
imap_chr(sample(10), paste)
#>  [1] "1 1"  "3 2"  "4 3"  "8 4"  "9 5"  "2 6"  "6 7"  "5 8"  "10 9"
#> [10] "7 10"

imap_chr(sample(10), \(x, idx) paste0(idx, ": ", x))
#>  [1] "1: 3"  "2: 6"  "3: 4"  "4: 2"  "5: 1"  "6: 10" "7: 9"  "8: 7" 
#>  [9] "9: 5"  "10: 8"

iwalk(mtcars, \(x, idx) cat(idx, ": ", median(x), "\n", sep = ""))
#> mpg: 19.2
#> cyl: 6
#> disp: 196.3
#> hp: 123
#> drat: 3.695
#> wt: 3.325
#> qsec: 17.71
#> vs: 0
#> am: 0
#> gear: 4
#> carb: 2
```
