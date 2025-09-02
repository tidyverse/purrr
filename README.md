
<!-- README.md is generated from README.Rmd. Please edit that file -->

# purrr <img src="man/figures/logo.png" align="right" />

<!-- badges: start -->

[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/purrr)](https://cran.r-project.org/package=purrr)
[![Codecov test
coverage](https://codecov.io/gh/tidyverse/purrr/branch/master/graph/badge.svg)](https://app.codecov.io/gh/tidyverse/purrr?branch=master)
[![R-CMD-check](https://github.com/tidyverse/purrr/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/tidyverse/purrr/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

## Overview

purrr enhances R’s functional programming (FP) toolkit by providing a
complete and consistent set of tools for working with functions and
vectors. If you’ve never heard of FP before, the best place to start is
the family of `map()` functions which allow you to replace many for
loops with code that is both more succinct and easier to read. The best
place to learn about the `map()` functions is the [iteration
chapter](https://r4ds.hadley.nz/iteration) in R for Data Science.

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

<a href="https://github.com/rstudio/cheatsheets/blob/master/purrr.pdf"><img src="https://raw.githubusercontent.com/rstudio/cheatsheets/master/pngs/thumbnails/purrr-cheatsheet-thumbs.png" width="630" height="252"/></a>

## Usage

The following example uses purrr to solve a fairly realistic problem:
split a data frame into pieces, fit a model to each piece, compute the
summary, then extract the R<sup>2</sup>.

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
  output type (`map()` returns lists; `map_dbl()` returns double
  vectors), or they throw an error.

- All `map()` functions accept functions (named, anonymous, and lambda),
  character vector (used to extract components by name), or numeric
  vectors (used to extract by position).

There are two less obvious advantages:

- All `map()` functions have `.progress` argument so that you can easily
  track the progress of long running jobs.

- All `map()` functions work with `in_parallel()` to easily spread
  computation across multiple cores on your computer, or multiple
  machines over the network.
