# lowliner

[![Build Status](https://travis-ci.org/hadley/lowliner.png?branch=master)](https://travis-ci.org/hadley/lowliner)

This is a functional programming (FP) library in the style of [underscore.js](http://underscorejs.org), [low-dash](https://lodash.com) and [lazy.js](http://danieltao.com/lazy.js/). An alternative name for lowliner might be lplyr. By analogy with dplyr, it's a re-thinking of plyr specialised for lists.

## Installation

lowliner is currently not on CRAN, but you can get it from github with:

```R
# install.packages("devtools")
devtools::install_github("hadley/lowliner")
```

## Examples

The following example uses lowliner to solve a fairly realistic problem: split a data frame into pieces, fit a model to each piece, summarise and extract R^2.

```R
library(lowliner)

mtcars %>%
  split(.$cyl) %>%
  map(~ lm(mpg ~ wt, data = .)) %>%
  map(summary) %>%
  map("r.squared", .type = numeric(1))
```

Note the three types of input to `map()`: a function, a formula (converted to an anonymous function), or a string (used to extract named components).

The following more complicated example shows how you might generate 100 random test-training splits, fit a model to each training split then evaluate based on the test split:

```R
partition <- function(df, probs) {
  id <- sample(names(probs), NROW(df), prob = probs, replace = TRUE)
  split(df, id)
}

splits <- rerun(100, partition(mtcars, c(test = 0.8, training = 0.2))) %>%
  unzip()

# Fit the models
models <- splits$training %>% map(~ lm(mpg ~ wt, data = mtcars))
# Make predictions on test data
preds <- map2(models, splits$test, predict)

# Evaluate mean-squared difference between predicted and actual
msd <- function(x, y) sqrt(mean((x - y) ^ 2))
diffs <- map2(preds, splits$test %>% map("mpg"), msd) %>% flatten()
mean(diffs)
```

## API

### Transformation

* Apply a function to each element: `map()` returns transformed list; 
  `each()` returns original list, calling function for its side effects;
  `map2()` and `map3()` vectorise over multiple inputs.

* Reduce a list to a single value by iteratively applying a binary 
  function: `reduce()` and `reduce_right()`.

* Figure out if a list contains an object: `contains()`.

### Predicate functions

(A predicate function is a function that either returns `TRUE` or `FALSE`)

* `keep()` or `discard()` elements that satisfy the predicate..

* Does `every()` element or `some()` elements satisfy the predicate?

* Find the value (`detect()`) and index (`detect_index()`) of the first element 
  that satisfies the predicate.

* Find the head/tail that satisfies a predict: `head_while()`, `tail_while()`.

### Lists of functions

* `invoke()` every function in a list with given arguments.

### Function operators

* Fill in function arguments with `partial()`. 

* Convert a function to take a list of inputs with `splat()`.

* Compose multiple functions into a single function with `compose()`.

* Negate a predicate funtion with `negate()`.

## Related work

* [rlist](http://renkun.me/rlist/), another R package to support working
  with lists. Similar goals but somewhat different philosophy.

* List operations defined in the Haskell 
  [prelude](http://hackage.haskell.org/package/base-4.7.0.1/docs/Prelude.html#g:11)
