# Functions that return raw vectors

**\[deprecated\]**

These functions were deprecated in purrr 1.0.0 because they are of
limited use and you can now use
[`map_vec()`](https://purrr.tidyverse.org/dev/reference/map.md) instead.
They are variants of
[`map()`](https://purrr.tidyverse.org/dev/reference/map.md),
[`map2()`](https://purrr.tidyverse.org/dev/reference/map2.md),
[`imap()`](https://purrr.tidyverse.org/dev/reference/imap.md),
[`pmap()`](https://purrr.tidyverse.org/dev/reference/pmap.md), and
[`flatten()`](https://purrr.tidyverse.org/dev/reference/flatten.md) that
return raw vectors.

## Usage

``` r
map_raw(.x, .f, ...)

map2_raw(.x, .y, .f, ...)

imap_raw(.x, .f, ...)

pmap_raw(.l, .f, ...)

flatten_raw(.x)
```
