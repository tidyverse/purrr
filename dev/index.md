# purrr

## Overview

purrr enhances R’s functional programming (FP) toolkit by providing a
complete and consistent set of tools for working with functions and
vectors. If you’ve never heard of FP before, the best place to start is
the family of
[`map()`](https://purrr.tidyverse.org/dev/reference/map.md) functions
which allow you to replace many for loops with code that is both more
succinct and easier to read. The best place to learn about the
[`map()`](https://purrr.tidyverse.org/dev/reference/map.md) functions is
the [iteration chapter](https://r4ds.hadley.nz/iteration) in R for Data
Science.

## Installation

``` r
# The easiest way to get purrr is to install the whole tidyverse:
install.packages("tidyverse")

# Alternatively, install just purrr:
install.packages("purrr")

# Or the the development version from GitHub:
# install.packages("pak")
pak::pak("tidyverse/purrr")
```

## Cheatsheet

[![](https://raw.githubusercontent.com/rstudio/cheatsheets/master/pngs/thumbnails/purrr-cheatsheet-thumbs.png)](https://github.com/rstudio/cheatsheets/blob/master/purrr.pdf)

## Usage

The following example uses purrr to solve a fairly realistic problem:
split a data frame into pieces, fit a model to each piece, compute the
summary, then extract the R².

``` r
library(purrr)

mtcars |> 
  split(mtcars$cyl) |>  # from base R
  map(\(df) lm(mpg ~ wt, data = df)) |> 
  map(summary) |>
  map_dbl("r.squared")
#>         4         6         8 
#> 0.5086326 0.4645102 0.4229655
```

This example illustrates some of the advantages of purrr functions over
the equivalents in base R:

- The first argument is always the data, so purrr works naturally with
  the pipe.

- All purrr functions are type-stable. They always return the advertised
  output type
  ([`map()`](https://purrr.tidyverse.org/dev/reference/map.md) returns
  lists; [`map_dbl()`](https://purrr.tidyverse.org/dev/reference/map.md)
  returns double vectors), or they throw an error.

- All [`map()`](https://purrr.tidyverse.org/dev/reference/map.md)
  functions accept functions (named, anonymous, and lambda), character
  vector (used to extract components by name), or numeric vectors (used
  to extract by position).

There are two less obvious advantages:

- All [`map()`](https://purrr.tidyverse.org/dev/reference/map.md)
  functions have `.progress` argument so that you can easily track the
  progress of long running jobs.

- All [`map()`](https://purrr.tidyverse.org/dev/reference/map.md)
  functions work with
  [`in_parallel()`](https://purrr.tidyverse.org/dev/reference/in_parallel.md)
  to easily spread computation across multiple cores on your computer,
  or multiple machines over the network.
