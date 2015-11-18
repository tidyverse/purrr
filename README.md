# purrr

[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/purrr)](http://cran.r-project.org/package=purrr)
[![Build Status](https://travis-ci.org/hadley/purrr.png?branch=master)](https://travis-ci.org/hadley/purrr)
[![Coverage Status](https://img.shields.io/codecov/c/github/hadley/purrr/master.svg)](https://codecov.io/github/hadley/purrr?branch=master)

Purrr makes your pure functions purr by completing R's functional programming tools with important features from other languages, in the style of the JS packages [underscore.js](http://underscorejs.org), [lodash](https://lodash.com) and [lazy.js](http://danieltao.com/lazy.js/).

## Installation

Get the released version from CRAN:

```R
install.packages("purrr")
```

Or the development version from github with:

```R
# install.packages("devtools")
devtools::install_github("hadley/purrr")
```

## Examples

The following example uses purrr to solve a fairly realistic problem: split a data frame into pieces, fit a model to each piece, summarise and extract R^2.

```R
library(purrr)

mtcars %>%
  split(.$cyl) %>%
  map(~ lm(mpg ~ wt, data = .)) %>%
  map(summary) %>%
  map_dbl("r.squared")
```

Note the three types of input to `map()`: a function, a formula (converted to an anonymous function), or a string (used to extract named components).

The following more complicated example shows how you might generate 100 random test-training splits, fit a model to each training split then evaluate based on the test split:

```R
library(dplyr)
random_group <- function(n, probs) {
  probs <- probs / sum(probs)
  g <- findInterval(seq(0, 1, length = n), c(0, cumsum(probs)),
    rightmost.closed = TRUE)
  names(probs)[sample(g)]
}
partition <- function(df, n, probs) {
  replicate(n, split(df, random_group(nrow(df), probs)), FALSE) %>%
    transpose() %>%
    as_data_frame()
}

msd <- function(x, y) sqrt(mean((x - y) ^ 2))

# Genearte 100 rbootandom test-training splits
boot <- partition(mtcars, 100, c(training = 0.8, test = 0.2))
boot

boot <- boot %>% mutate(
  # Fit the models
  models = map(training, ~ lm(mpg ~ wt, data = .)),
  # Make predictions on test data
  preds = map2(models, test, predict),
  diffs = map2(preds, test %>% map("mpg"), msd)
)

# Evaluate mean-squared difference between predicted and actual
mean(unlist(boot$diffs))
```

## API

### Transformation

* Apply a function to each element: `map()` returns a list;
  `map_lgl()`/`map_int()`/`map_dbl()`/`map_chr()` return a vector; 
  `walk()` invisibly returns original list, calling the function for its side 
  effects; `map2()` and `pmap()` vectorise over multiple inputs; 
  `at_depth()` maps a function at a specified level of nested lists.

* Apply a function conditionally with `map_if()` (where a predicate
  returns `TRUE`) and `map_at()` (at specific locations).

* Apply a function to slices of a data frame with `by_slice()`, or to
  each row with `by_row()` or `map_rows()`.

* Apply a function to list-elements of a list with `lmap()`,
  `lmap_if()` and `lmap_at()`. Compared to traditional mapping, the
  function is applied to `x[i]` instead of `x[[i]]`, preserving the
  surrounding list and attributes.

* Reduce a list to a single value by iteratively applying a binary
  function: `reduce()` and `reduce_right()`.

* Figure out if a list contains an object: `contains()`.

* Order, sort and split a list based on its components with `split_by()`,
  `order_by()` and `sort_by()`.

### List manipulation and creation

* Transpose a list with `transpose()`.

* Create the cartesian product of the elements of several lists with
  `cross_n()` and `cross_d()`.

* Flatten a list with `flatten()`.

* Splice lists and other objects with `splice()`.

### Predicate functions

(A predicate function is a function that either returns `TRUE` or `FALSE`)

* `keep()` or `discard()` elements that satisfy the predicate..

* Does `every()` element or `some()` elements satisfy the predicate?

* Find the value (`detect()`) and index (`detect_index()`) of the first element
  that satisfies the predicate.

* Find the head/tail that satisfies a predicate: `head_while()`, `tail_while()`.

### Lists of functions

* `invoke()` every function in a list with given arguments and returns
  a list, `invoke_lgl()`/`invoke_int()`/`invoke_dbl()`/`invoke_chr()` returns 
  vectors.

### Function operators

* Fill in function arguments with `partial()`.

* Change the way your function takes input with `lift()` and the
  `lift_xy()` family of composition helpers.

* Compose multiple functions into a single function with `compose()`.

* Negate a predicate funtion with `negate()`.

### Objects coercion

* Convert an array or matrix to a list with `array_tree()` and
  `array_branch()`.

* Convert a list to a vector with `as_vector()`.

## Philosophy

The goal is not to try and simulate Haskell in R: purrr does not implement currying or destructuring binds or pattern matching. The goal is to give you similar expressiveness to an FP language, while allowing you to write code that looks and works like R.

* Instead of point free style, use the pipe, `%>%`, to write code that can be
  read from left to right.

* Instead of currying, we use `...` to pass in extra arguments.

* Anonymous functions are verbose in R, so we provide two convenient shorthands.
  For predicate functions, `~ .x + 1` is equivalent to `function(.x) .x + 1`.
  For chains of transformations functions, `. %>% f() %>% g()` is
  equivalent to `function(.) . %>% f() %>% g()`.

* R is weakly typed, we need variants `map_int()`, `map_dbl()`, etc since we 
  don't know what `.f` will return.

* R has named arguments, so instead of providing different functions for
  minor variations (e.g. `detect()` and `detectLast()`) I use a named
  argument, `.first`. Type-stable functions are easy to reason about so
  additional arguments will never change the type of the output.

## Related work

* [rlist](http://renkun.me/rlist/), another R package to support working
  with lists. Similar goals but somewhat different philosophy.

* List operations defined in the Haskell [prelude][haskell]

* Scala's [list methods][scala].

[scala]:http://www.scala-lang.org/api/current/index.html#scala.collection.immutable.List
[haskell]:http://hackage.haskell.org/package/base-4.7.0.1/docs/Prelude.html#g:11
