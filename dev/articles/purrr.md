# Get started with purrr

## Introduction

purrr helps you write cleaner, more maintainable R code through
functional programming concepts. But what is functional programming? At
its core, it’s an approach to programming that emphasizes using
functions to transform data, similar to how you might use a series of
tools to process raw materials into a final product. Instead of writing
loops and modifying data step by step, functional programming encourages
you to think about your data transformations as a series of function
applications. This notion is rather abstract, but we believe mastering
functional programming makes your code clearer and less prone to errors.
You’ll hopefully get some sense of that by the end of this vignette!

This vignette discusses two of the most important parts of purrr: map
functions and predicate functions.

``` r
library(purrr)
```

## Map: A better way to loop

[`map()`](https://purrr.tidyverse.org/dev/reference/map.md)[¹](#fn1)
provides a more compact way to apply functions to each element of a
vector, returning a list:

``` r
x <- 1:3

triple <- function(x) x * 3
out <- map(x, triple)
str(out)
#> List of 3
#>  $ : num 3
#>  $ : num 6
#>  $ : num 9
```

Or written with the pipe:

``` r
x |>
  map(triple) |>
  str()
#> List of 3
#>  $ : num 3
#>  $ : num 6
#>  $ : num 9
```

This is equivalent to a for loop:

``` r
out <- vector("list", 3)
for (i in seq_along(x)) {
  out[[i]] <- triple(x[[i]])
}
str(out)
#> List of 3
#>  $ : num 3
#>  $ : num 6
#>  $ : num 9
```

Even on its own, there are some benefits to
[`map()`](https://purrr.tidyverse.org/dev/reference/map.md): once you
get used to the syntax, it’s a very compact way to express the idea of
transforming a vector, returning one output element for each input
element. But there are several other reasons to use
[`map()`](https://purrr.tidyverse.org/dev/reference/map.md), which we’ll
explore in the following sections:

- Progress bars
- Parallel computing
- Output variants
- Input variants

### Progress bars

For long-running jobs, like web scraping, model fitting, or data
processing, it’s really useful to get a progress bar that helps you
estimate how long you’ll need to wait. Progress bars are easy to enable
in purrr: just set `.progress = TRUE`. It’s hard to illustrate progress
bars in a vignette, but you can try this example interactively:

``` r
out <- map(1:100, \(i) Sys.sleep(0.5), .progress = TRUE)
```

Learn more about progress bars in
[`?progress_bars`](https://purrr.tidyverse.org/dev/reference/progress_bars.md).

### Parallel computing

By default, [`map()`](https://purrr.tidyverse.org/dev/reference/map.md)
runs only in your current R session. But you can easily opt in to
spreading your task across multiple R sessions, and hence multiple cores
with
[`in_parallel()`](https://purrr.tidyverse.org/dev/reference/in_parallel.md).
This can give big performance improvements if your task is primarily
bound by compute performance.

purrr’s parallelism is powered by mirai, so to begin, you need to start
up a number of background R sessions, called **daemons**:

``` r
mirai::daemons(6)
```

(You only need to do this once per session.)

Now you can easily convert your
[`map()`](https://purrr.tidyverse.org/dev/reference/map.md) call to run
in parallel:

``` r
out <- map(1:5, in_parallel(\(i) Sys.sleep(0.5)))
```

It’s important to realize that this parallelism works by spreading
computation across clean R sessions. That means that code like this will
not work, because the worker daemons won’t have a copy of `my_lm()`:

``` r
my_lm <- function(formula, data) {
  Sys.sleep(0.5)
  lm(formula, data)
}
by_cyl <- split(mtcars, mtcars$cyl)
out <- map(by_cyl, in_parallel(\(df) my_lm(mpg ~ disp, data = df)))
#> Error in `map()`:
#> ℹ In index: 1.
#> ℹ With name: 4.
#> Caused by error in `my_lm()`:
#> ! could not find function "my_lm"
```

You can resolve this by passing additional data along to
[`in_parallel()`](https://purrr.tidyverse.org/dev/reference/in_parallel.md):

``` r
out <- map(by_cyl, in_parallel(\(df) my_lm(mpg ~ disp, data = df), my_lm = my_lm))
```

Learn more about parallel computing in
[`?in_parallel`](https://purrr.tidyverse.org/dev/reference/in_parallel.md).

### Output variants

purrr functions are type-stable, which means it’s easy to predict what
type of output they return, e.g.,
[`map()`](https://purrr.tidyverse.org/dev/reference/map.md) always
returns a list. But what if you want a different type of output? That’s
where the output variants come into play:

- There are four variants for the four most important types of atomic
  vector:

  - [`map_lgl()`](https://purrr.tidyverse.org/dev/reference/map.md)
    returns a logical vector.
  - [`map_int()`](https://purrr.tidyverse.org/dev/reference/map.md)
    returns an integer vector.
  - [`map_dbl()`](https://purrr.tidyverse.org/dev/reference/map.md)
    returns a numeric (double) vector.
  - [`map_chr()`](https://purrr.tidyverse.org/dev/reference/map.md)
    returns a character vector.

- For all other types of vector (like dates, date-times, factors, etc.),
  there’s
  [`map_vec()`](https://purrr.tidyverse.org/dev/reference/map.md). It’s
  a little harder to precisely describe the output type, but if your
  function returns a length-1 vector of type “foo”, then the output of
  [`map_vec()`](https://purrr.tidyverse.org/dev/reference/map.md) will
  be a length-n vector of type “foo”.

- [`modify()`](https://purrr.tidyverse.org/dev/reference/modify.md)
  returns output with the same type as the input. For example, if the
  input is a data frame, the output will also be a data frame.

- [`walk()`](https://purrr.tidyverse.org/dev/reference/map.md) returns
  the input (invisibly); it’s useful when you’re calling a function
  purely for its side effects, for example, generating plots or saving
  files.

purrr, like many tidyverse functions, is designed to help you solve
complex problems by stringing together simple pieces. This is
particularly natural to do with the pipe. For example, the following
code splits `mtcars` into one data frame for each value of `cyl`, fits a
linear model to each subset, computes the model summary, and then
extracts the R-squared:

``` r
mtcars |>
  split(mtcars$cyl) |> # from base R
  map(\(df) lm(mpg ~ wt, data = df)) |>
  map(summary) |>
  map_dbl(\(x) x$r.squared)
#>         4         6         8 
#> 0.5086326 0.4645102 0.4229655
```

### Input variants

[`map()`](https://purrr.tidyverse.org/dev/reference/map.md) and friends
all iterate over a single list, making it poorly suited for some
problems. For example, how would you find a weighted mean when you have
a list of observations and a list of weights? Imagine we have the
following data:

``` r
xs <- map(1:8, ~ runif(10))
xs[[1]][[1]] <- NA
ws <- map(1:8, ~ rpois(10, 5) + 1)
```

We could use
[`map_dbl()`](https://purrr.tidyverse.org/dev/reference/map.md) to
compute unweighted means:

``` r
map_dbl(xs, mean)
#> [1]        NA 0.3248907 0.5328987 0.4806467 0.6243711 0.4456635
#> [7] 0.4727510 0.3982350
```

But there’s no way to use
[`map()`](https://purrr.tidyverse.org/dev/reference/map.md) to compute a
weighted mean because we need to call `weighted.mean(xs[[1]], ws[[1]])`,
`weighted.mean(xs[[2]], ws[[2]])`, etc. That’s the job of
[`map2()`](https://purrr.tidyverse.org/dev/reference/map2.md):

``` r
map2_dbl(xs, ws, weighted.mean)
#> [1]        NA 0.3211461 0.5381426 0.4978449 0.5985014 0.4220626
#> [7] 0.4733208 0.4016337
```

Note that the arguments that vary for each call come before the function
and arguments that are constant come after the function:

``` r
map2_dbl(xs, ws, weighted.mean, na.rm = TRUE)
#> [1] 0.5338666 0.3211461 0.5381426 0.4978449 0.5985014 0.4220626
#> [7] 0.4733208 0.4016337
```

But we generally recommend using an anonymous function instead, as this
makes it very clear where each argument is going:

``` r
map2_dbl(xs, ws, \(x, w) weighted.mean(x, w, na.rm = TRUE))
```

There are two important variants of
[`map2()`](https://purrr.tidyverse.org/dev/reference/map2.md):
[`pmap()`](https://purrr.tidyverse.org/dev/reference/pmap.md) which can
take any number of varying arguments (passed as a list), and
[`imap()`](https://purrr.tidyverse.org/dev/reference/imap.md) which
iterates over the values and indices of a single vector. Learn more in
their documentation.

### Combinatorial explosion

What makes purrr particularly special is that all of the above features
(progress bars, parallel computing, output variants, and input variants)
can be combined any way that you choose. The combination of inputs
(prefixes) and outputs (suffixes) forms a matrix, and you can use
`.progress` or
[`in_parallel()`](https://purrr.tidyverse.org/dev/reference/in_parallel.md)
with any of them:

| Output type   | Single input (`.x`) | Two inputs (`.x`, `.y`) | Multiple inputs (`.l`) |
|---------------|---------------------|-------------------------|------------------------|
| **List**      | `map(.x, .f)`       | `map2(.x, .y, .f)`      | `pmap(.l, .f)`         |
| **Logical**   | `map_lgl(.x, .f)`   | `map2_lgl(.x, .y, .f)`  | `pmap_lgl(.l, .f)`     |
| **Integer**   | `map_int(.x, .f)`   | `map2_int(.x, .y, .f)`  | `pmap_int(.l, .f)`     |
| **Double**    | `map_dbl(.x, .f)`   | `map2_dbl(.x, .y, .f)`  | `pmap_dbl(.l, .f)`     |
| **Character** | `map_chr(.x, .f)`   | `map2_chr(.x, .y, .f)`  | `pmap_chr(.l, .f)`     |
| **Vector**    | `map_vec(.x, .f)`   | `map_vec(.x, .y, .f)`   | `map_vec(.l, .f)`      |
| **Input**     | `walk(.x, .f)`      | `walk2(.x, .y, .f)`     | `pwalk(.l, .f)`        |

## Filtering and finding with predicates

purrr provides a number of functions that work with predicate functions.
Predicate functions take a vector and return either `TRUE` or `FALSE`,
with examples including
[`is.character()`](https://rdrr.io/r/base/character.html) and
`\(x) any(is.na(x))`. You typically use them to filter or find; for
example, you could use them to locate the first element of a list that’s
a character vector, or only keep the columns in a data frame that have
missing values.

purrr comes with a bunch of helpers to make predicate functions easier
to use:

- `detect(.x, .p)` returns the value of the first element in `.x` where
  `.p` is `TRUE`.
- `detect_index(.x, .p)` returns the position of the first element in
  `.x` where `.p` is `TRUE`.
- `keep(.x, .p)` returns all elements from `.x` where `.p` evaluates to
  `TRUE`.
- `discard(.x, .p)` returns all elements from `.x` where `.p` evaluates
  to `FALSE`.
- `every(.x, .p)` returns `TRUE` if `.p` returns `TRUE` for every
  element in `.x`.
- `some(.x, .p)` returns `TRUE` if `.p` returns `TRUE` for at least one
  element in `.x`.
- `none(.x, .p)` returns `TRUE` if `.p` returns `FALSE` for all elements
  in `.x`.
- `head_while(.x, .p)` returns elements from the beginning of `.x` while
  `.p` is `TRUE`, stopping at the first `FALSE`.
- `tail_while(.x, .p)` returns elements from the end of `.x` while `.p`
  is `TRUE`, stopping at the first `FALSE`.

You’ll typically use these functions with lists, since you can usually
rely on vectorization for simpler vectors.

``` r
x <- list(
  a = letters[1:10],
  b = 1:10,
  c = runif(15)
)

x |> detect(is.character)
#>  [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j"
x |> detect_index(is.numeric)
#> [1] 2

x |> keep(is.numeric) |> str()
#> List of 2
#>  $ b: int [1:10] 1 2 3 4 5 6 7 8 9 10
#>  $ c: num [1:15] 0.819 0.903 0.581 0.773 0.995 ...
x |> discard(is.numeric) |> str()
#> List of 1
#>  $ a: chr [1:10] "a" "b" "c" "d" ...

x |> every(\(x) length(x) > 10)
#> [1] FALSE
x |> some(\(x) length(x) > 10)
#> [1] TRUE
x |> none(\(x) length(x) == 0)
#> [1] TRUE
```

------------------------------------------------------------------------

1.  You might wonder why this function is called
    [`map()`](https://purrr.tidyverse.org/dev/reference/map.md). What
    does it have to do with depicting physical features of land or sea
    🗺? In fact, the meaning comes from mathematics where map refers to
    “an operation that associates each element of a given set with one
    or more elements of a second set”. This makes sense here because
    [`map()`](https://purrr.tidyverse.org/dev/reference/map.md) defines
    a mapping from one vector to another. And “map” also has the nice
    property of being short, which is useful for such a fundamental
    building block.
