# purrr \<-\> base R

## Introduction

This vignette compares purrr’s functionals to their base R equivalents,
focusing primarily on the map family and related functions. This helps
those familiar with base R understand better what purrr does, and shows
purrr users how you might express the same ideas in base R code. We’ll
start with a rough overview of the major differences, give a rough
translation guide, and then show a few examples.

``` r
library(purrr)
library(tibble)
```

### Key differences

There are two primary differences between the base apply family and the
purrr map family: purrr functions are named more consistently, and more
fully explore the space of input and output variants.

- purrr functions consistently use `.` as prefix to avoid [inadvertently
  matching
  arguments](https://adv-r.hadley.nz/functionals.html#argument-names) of
  the purrr function, instead of the function that you’re trying to
  call. Base functions use a variety of techniques including upper case
  (e.g. `lapply(X, FUN, ...)`) or require anonymous functions
  (e.g. [`Map()`](https://rdrr.io/r/base/funprog.html)).

- All map functions are type stable: you can predict the type of the
  output using little information about the inputs. In contrast, the
  base functions [`sapply()`](https://rdrr.io/r/base/lapply.html) and
  [`mapply()`](https://rdrr.io/r/base/mapply.html) automatically
  simplify making the return value hard to predict.

- The map functions all start with the data, followed by the function,
  then any additional constant argument. Most base apply functions also
  follow this pattern, but
  [`mapply()`](https://rdrr.io/r/base/mapply.html) starts with the
  function, and [`Map()`](https://rdrr.io/r/base/funprog.html) has no
  way to supply additional constant arguments.

- purrr functions provide all combinations of input and output variants,
  and include variants specifically for the common two argument case.

### Direct translations

The following sections give a high-level translation between base R
commands and their purrr equivalents. See function documentation for the
details.

#### `Map` functions

Here `x` denotes a vector and `f` denotes a function

| Output                        | Input                                 | Base R                                                                                                                                              | purrr                                                                                                                                                                                                                                                                                                                                                                                                  |
|-------------------------------|---------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| List                          | 1 vector                              | [`lapply()`](https://rdrr.io/r/base/lapply.html)                                                                                                    | [`map()`](https://purrr.tidyverse.org/dev/reference/map.md)                                                                                                                                                                                                                                                                                                                                            |
| List                          | 2 vectors                             | [`mapply()`](https://rdrr.io/r/base/mapply.html), [`Map()`](https://rdrr.io/r/base/funprog.html)                                                    | [`map2()`](https://purrr.tidyverse.org/dev/reference/map2.md)                                                                                                                                                                                                                                                                                                                                          |
| List                          | \>2 vectors                           | [`mapply()`](https://rdrr.io/r/base/mapply.html), [`Map()`](https://rdrr.io/r/base/funprog.html)                                                    | [`pmap()`](https://purrr.tidyverse.org/dev/reference/pmap.md)                                                                                                                                                                                                                                                                                                                                          |
| Atomic vector of desired type | 1 vector                              | [`vapply()`](https://rdrr.io/r/base/lapply.html)                                                                                                    | [`map_lgl()`](https://purrr.tidyverse.org/dev/reference/map.md) (logical), [`map_int()`](https://purrr.tidyverse.org/dev/reference/map.md) (integer), [`map_dbl()`](https://purrr.tidyverse.org/dev/reference/map.md) (double), [`map_chr()`](https://purrr.tidyverse.org/dev/reference/map.md) (character), [`map_vec()`](https://purrr.tidyverse.org/dev/reference/map.md) (other vectors)           |
| Atomic vector of desired type | 2 vectors                             | [`mapply()`](https://rdrr.io/r/base/mapply.html), [`Map()`](https://rdrr.io/r/base/funprog.html), then `is.*()` to check type                       | [`map2_lgl()`](https://purrr.tidyverse.org/dev/reference/map2.md) (logical), [`map2_int()`](https://purrr.tidyverse.org/dev/reference/map2.md) (integer), [`map2_dbl()`](https://purrr.tidyverse.org/dev/reference/map2.md) (double), [`map2_chr()`](https://purrr.tidyverse.org/dev/reference/map2.md) (character), [`map2_vec()`](https://purrr.tidyverse.org/dev/reference/map2.md) (other vectors) |
| Atomic vector of desired type | \>2 vectors                           | [`mapply()`](https://rdrr.io/r/base/mapply.html), [`Map()`](https://rdrr.io/r/base/funprog.html), then `is.*()` to check type                       | [`pmap_lgl()`](https://purrr.tidyverse.org/dev/reference/pmap.md) (logical), [`pmap_int()`](https://purrr.tidyverse.org/dev/reference/pmap.md) (integer), [`pmap_dbl()`](https://purrr.tidyverse.org/dev/reference/pmap.md) (double), [`pmap_chr()`](https://purrr.tidyverse.org/dev/reference/pmap.md) (character), [`pmap_vec()`](https://purrr.tidyverse.org/dev/reference/pmap.md) (other vectors) |
| Side effect only              | 2 vectors                             | loops                                                                                                                                               | [`walk2()`](https://purrr.tidyverse.org/dev/reference/map2.md)                                                                                                                                                                                                                                                                                                                                         |
| Side effect only              | 1 vector                              | loops                                                                                                                                               | [`walk()`](https://purrr.tidyverse.org/dev/reference/map.md)                                                                                                                                                                                                                                                                                                                                           |
| Side effect only              | \>2 vectors                           | loops                                                                                                                                               | [`pwalk()`](https://purrr.tidyverse.org/dev/reference/pmap.md)                                                                                                                                                                                                                                                                                                                                         |
| Data frame (`rbind` outputs)  | 1 vector                              | [`lapply()`](https://rdrr.io/r/base/lapply.html) then [`rbind()`](https://rdrr.io/r/base/cbind.html)                                                | [`map()`](https://purrr.tidyverse.org/dev/reference/map.md) then [`list_rbind()`](https://purrr.tidyverse.org/dev/reference/list_c.md)                                                                                                                                                                                                                                                                 |
| Data frame (`rbind` outputs)  | 2 vectors                             | [`mapply()`](https://rdrr.io/r/base/mapply.html)/[`Map()`](https://rdrr.io/r/base/funprog.html) then [`rbind()`](https://rdrr.io/r/base/cbind.html) | [`map2()`](https://purrr.tidyverse.org/dev/reference/map2.md) then [`list_rbind()`](https://purrr.tidyverse.org/dev/reference/list_c.md)                                                                                                                                                                                                                                                               |
| Data frame (`rbind` outputs)  | \>2 vectors                           | [`mapply()`](https://rdrr.io/r/base/mapply.html)/[`Map()`](https://rdrr.io/r/base/funprog.html) then [`rbind()`](https://rdrr.io/r/base/cbind.html) | [`pmap()`](https://purrr.tidyverse.org/dev/reference/pmap.md) then [`list_rbind()`](https://purrr.tidyverse.org/dev/reference/list_c.md)                                                                                                                                                                                                                                                               |
| Data frame (`cbind` outputs)  | 1 vector                              | [`lapply()`](https://rdrr.io/r/base/lapply.html) then [`cbind()`](https://rdrr.io/r/base/cbind.html)                                                | [`map()`](https://purrr.tidyverse.org/dev/reference/map.md) then [`list_cbind()`](https://purrr.tidyverse.org/dev/reference/list_c.md)                                                                                                                                                                                                                                                                 |
| Data frame (`cbind` outputs)  | 2 vectors                             | [`mapply()`](https://rdrr.io/r/base/mapply.html)/[`Map()`](https://rdrr.io/r/base/funprog.html) then [`cbind()`](https://rdrr.io/r/base/cbind.html) | [`map2()`](https://purrr.tidyverse.org/dev/reference/map2.md) then [`list_cbind()`](https://purrr.tidyverse.org/dev/reference/list_c.md)                                                                                                                                                                                                                                                               |
| Data frame (`cbind` outputs)  | \>2 vectors                           | [`mapply()`](https://rdrr.io/r/base/mapply.html)/[`Map()`](https://rdrr.io/r/base/funprog.html) then [`cbind()`](https://rdrr.io/r/base/cbind.html) | [`pmap()`](https://purrr.tidyverse.org/dev/reference/pmap.md) then [`list_cbind()`](https://purrr.tidyverse.org/dev/reference/list_c.md)                                                                                                                                                                                                                                                               |
| Any                           | Vector and its names                  | `l/s/vapply(X, function(x) f(x, names(x)))` or `mapply/Map(f, x, names(x))`                                                                         | [`imap()`](https://purrr.tidyverse.org/dev/reference/imap.md), `imap_*()` (`lgl`, `dbl`, `chr`, and etc. just like for [`map()`](https://purrr.tidyverse.org/dev/reference/map.md), [`map2()`](https://purrr.tidyverse.org/dev/reference/map2.md), and [`pmap()`](https://purrr.tidyverse.org/dev/reference/pmap.md))                                                                                  |
| Any                           | Selected elements of the vector       | `l/s/vapply(X[index], FUN, ...)`                                                                                                                    | [`map_if()`](https://purrr.tidyverse.org/dev/reference/map_if.md), [`map_at()`](https://purrr.tidyverse.org/dev/reference/map_if.md)                                                                                                                                                                                                                                                                   |
| List                          | Recursively apply to list within list | [`rapply()`](https://rdrr.io/r/base/rapply.html)                                                                                                    | [`map_depth()`](https://purrr.tidyverse.org/dev/reference/map_depth.md)                                                                                                                                                                                                                                                                                                                                |
| List                          | List only                             | [`lapply()`](https://rdrr.io/r/base/lapply.html)                                                                                                    | [`lmap()`](https://purrr.tidyverse.org/dev/reference/lmap.md), [`lmap_at()`](https://purrr.tidyverse.org/dev/reference/lmap.md), [`lmap_if()`](https://purrr.tidyverse.org/dev/reference/lmap.md)                                                                                                                                                                                                      |

#### Extractor shorthands

Since a common use case for map functions is list extracting components,
purrr provides a handful of shortcut functions for various uses of `[[`.

| Input                      | base R                                                            | purrr                      |
|----------------------------|-------------------------------------------------------------------|----------------------------|
| Extract by name            | `` lapply(x, `[[`, "a") ``                                        | `map(x, "a")`              |
| Extract by position        | `` lapply(x, `[[`, 3) ``                                          | `map(x, 3)`                |
| Extract deeply             | `lapply(x, \(y) y[[1]][["x"]][[3]])`                              | `map(x, list(1, "x", 3))`  |
| Extract with default value | `lapply(x, function(y) tryCatch(y[[3]], error = function(e) NA))` | `map(x, 3, .default = NA)` |

#### Predicates

Here `p`, a predicate, denotes a function that returns `TRUE` or `FALSE`
indicating whether an object fulfills a criterion,
e.g. [`is.character()`](https://rdrr.io/r/base/character.html).

| Description                                        | base R                           | purrr                 |
|----------------------------------------------------|----------------------------------|-----------------------|
| Find a matching element                            | `Find(p, x)`                     | `detect(x, p)`,       |
| Find position of matching element                  | `Position(p, x)`                 | `detect_index(x, p)`  |
| Do all elements of a vector satisfy a predicate?   | `all(sapply(x, p))`              | `every(x, p)`         |
| Does any elements of a vector satisfy a predicate? | `any(sapply(x, p))`              | `some(x, p)`          |
| Does a list contain an object?                     | `any(sapply(x, identical, obj))` | `has_element(x, obj)` |
| Keep elements that satisfy a predicate             | `x[sapply(x, p)]`                | `keep(x, p)`          |
| Discard elements that satisfy a predicate          | `x[!sapply(x, p)]`               | `discard(x, p)`       |
| Negate a predicate function                        | `function(x) !p(x)`              | `negate(p)`           |

#### Other vector transforms

| Description                                                               | base R                                               | purrr                                                                                                                                                   |
|---------------------------------------------------------------------------|------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|
| Accumulate intermediate results of a vector reduction                     | `Reduce(f, x, accumulate = TRUE)`                    | `accumulate(x, f)`                                                                                                                                      |
| Recursively combine two lists                                             | `c(X, Y)`, but more complicated to merge recursively | [`list_merge()`](https://purrr.tidyverse.org/dev/reference/list_assign.md), [`list_modify()`](https://purrr.tidyverse.org/dev/reference/list_assign.md) |
| Reduce a list to a single value by iteratively applying a binary function | `Reduce(f, x)`                                       | `reduce(x, f)`                                                                                                                                          |

### Examples

#### Varying inputs

##### One input

Suppose we would like to generate a list of samples of 5 from normal
distributions with different means:

``` r
means <- 1:4
```

There’s little difference when generating the samples:

- Base R uses [`lapply()`](https://rdrr.io/r/base/lapply.html):

  ``` r
  set.seed(2020)
  samples <- lapply(means, rnorm, n = 5, sd = 1)
  str(samples)
  #> List of 4
  #>  $ : num [1:5] 1.377 1.302 -0.098 -0.13 -1.797
  #>  $ : num [1:5] 2.72 2.94 1.77 3.76 2.12
  #>  $ : num [1:5] 2.15 3.91 4.2 2.63 2.88
  #>  $ : num [1:5] 5.8 5.704 0.961 1.711 4.058
  ```

- purrr uses
  [`map()`](https://purrr.tidyverse.org/dev/reference/map.md):

  ``` r
  set.seed(2020)
  samples <- map(means, rnorm, n = 5, sd = 1)
  str(samples)
  #> List of 4
  #>  $ : num [1:5] 1.377 1.302 -0.098 -0.13 -1.797
  #>  $ : num [1:5] 2.72 2.94 1.77 3.76 2.12
  #>  $ : num [1:5] 2.15 3.91 4.2 2.63 2.88
  #>  $ : num [1:5] 5.8 5.704 0.961 1.711 4.058
  ```

##### Two inputs

Lets make the example a little more complicated by also varying the
standard deviations:

``` r
means <- 1:4
sds <- 1:4
```

- This is relatively tricky in base R because we have to adjust a number
  of [`mapply()`](https://rdrr.io/r/base/mapply.html)’s defaults.

  ``` r
  set.seed(2020)
  samples <- mapply(
    rnorm, 
    mean = means, 
    sd = sds, 
    MoreArgs = list(n = 5), 
    SIMPLIFY = FALSE
  )
  str(samples)
  #> List of 4
  #>  $ : num [1:5] 1.377 1.302 -0.098 -0.13 -1.797
  #>  $ : num [1:5] 3.44 3.88 1.54 5.52 2.23
  #>  $ : num [1:5] 0.441 5.728 6.589 1.885 2.63
  #>  $ : num [1:5] 11.2 10.82 -8.16 -5.16 4.23
  ```

  Alternatively, we could use
  [`Map()`](https://rdrr.io/r/base/funprog.html) which doesn’t simplify,
  but also doesn’t take any constant arguments, so we need to use an
  anonymous function:

  ``` r
  samples <- Map(function(...) rnorm(..., n = 5), mean = means, sd = sds)
  ```

  In R 4.1 and up, you could use the shorter anonymous function form:

  ``` r
  samples <- Map(\(...) rnorm(..., n = 5), mean = means, sd = sds)
  ```

- Working with a pair of vectors is a common situation so purrr provides
  the [`map2()`](https://purrr.tidyverse.org/dev/reference/map2.md)
  family of functions:

  ``` r
  set.seed(2020)
  samples <- map2(means, sds, rnorm, n = 5)
  str(samples)
  #> List of 4
  #>  $ : num [1:5] 1.377 1.302 -0.098 -0.13 -1.797
  #>  $ : num [1:5] 3.44 3.88 1.54 5.52 2.23
  #>  $ : num [1:5] 0.441 5.728 6.589 1.885 2.63
  #>  $ : num [1:5] 11.2 10.82 -8.16 -5.16 4.23
  ```

##### Any number of inputs

We can make the challenge still more complex by also varying the number
of samples:

``` r
ns <- 4:1
```

- Using base R’s [`Map()`](https://rdrr.io/r/base/funprog.html) becomes
  more straightforward because there are no constant arguments.

  ``` r
  set.seed(2020)
  samples <- Map(rnorm, mean = means, sd = sds, n = ns)
  str(samples)
  #> List of 4
  #>  $ : num [1:4] 1.377 1.302 -0.098 -0.13
  #>  $ : num [1:3] -3.59 3.44 3.88
  #>  $ : num [1:2] 2.31 8.28
  #>  $ : num 4.47
  ```

- In purrr, we need to switch from
  [`map2()`](https://purrr.tidyverse.org/dev/reference/map2.md) to
  [`pmap()`](https://purrr.tidyverse.org/dev/reference/pmap.md) which
  takes a list of any number of arguments.

  ``` r
  set.seed(2020)
  samples <- pmap(list(mean = means, sd = sds, n = ns), rnorm)
  str(samples)
  #> List of 4
  #>  $ : num [1:4] 1.377 1.302 -0.098 -0.13
  #>  $ : num [1:3] -3.59 3.44 3.88
  #>  $ : num [1:2] 2.31 8.28
  #>  $ : num 4.47
  ```

#### Outputs

Given the samples, imagine we want to compute their means. A mean is a
single number, so we want the output to be a numeric vector rather than
a list.

- There are two options in base R:
  [`vapply()`](https://rdrr.io/r/base/lapply.html) or
  [`sapply()`](https://rdrr.io/r/base/lapply.html).
  [`vapply()`](https://rdrr.io/r/base/lapply.html) requires you to
  specific the output type (so is relatively verbose), but will always
  return a numeric vector.
  [`sapply()`](https://rdrr.io/r/base/lapply.html) is concise, but if
  you supply an empty list you’ll get a list instead of a numeric
  vector.

  ``` r
  # type stable
  medians <- vapply(samples, median, FUN.VALUE = numeric(1L))
  medians
  #> [1] 0.6017626 3.4411470 5.2946304 4.4694671

  # not type stable
  medians <- sapply(samples, median)
  ```

- purrr is little more compact because we can use
  [`map_dbl()`](https://purrr.tidyverse.org/dev/reference/map.md).

  ``` r
  medians <- map_dbl(samples, median)
  medians
  #> [1] 0.6017626 3.4411470 5.2946304 4.4694671
  ```

What if we want just the side effect, such as a plot or a file output,
but not the returned values?

- In base R we can either use a for loop or hide the results of
  `lapply`.

  ``` r
  # for loop
  for (s in samples) {
    hist(s, xlab = "value", main = "")
  }

  # lapply
  invisible(lapply(samples, function(s) {
    hist(s, xlab = "value", main = "")
  }))
  ```

- In purrr, we can use
  [`walk()`](https://purrr.tidyverse.org/dev/reference/map.md).

  ``` r
  walk(samples, ~ hist(.x, xlab = "value", main = ""))
  ```

#### Pipes

You can join multiple steps together with the pipe:

``` r
set.seed(2020)
means |>
  map(rnorm, n = 5, sd = 1) |>
  map_dbl(median)
#> [1] -0.09802317  2.72057350  2.87673977  4.05830349
```

The pipe is particularly compelling when working with longer
transformations. For example, the following code splits `mtcars` up by
`cyl`, fits a linear model, extracts the coefficients, and extracts the
first one (the intercept).

``` r
mtcars |>
  split(mtcars$cyl) |> 
  map(\(df) lm(mpg ~ wt, data = df))|> 
  map(coef) |> 
  map_dbl(1)
#>        4        6        8 
#> 39.57120 28.40884 23.86803
```
