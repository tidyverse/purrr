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
library(dplyr)
partition <- function(df, n, probs) {
  id <- sample(names(probs), NROW(df), prob = probs, replace = TRUE)
  replicate(n, split(df, id), simplify = FALSE) %>% unzip() %>% as_data_frame()
}
msd <- function(x, y) sqrt(mean((x - y) ^ 2))

# Genearte 100 random test-training splits
boot <- partition(mtcars, 100, c(test = 0.8, training = 0.2))
boot

boot <- boot %>% mutate(
  # Fit the models
  models = training %>% map(~ lm(mpg ~ wt, data = mtcars)),
  # Make predictions on test data
  preds = map2(models, test, predict),
  diffs = map2(preds, test %>% map("mpg"), msd) 
)

# Evaluate mean-squared difference between predicted and actual
mean(unlist(boot$diffs))
```

## API

### Transformation

* Apply a function to each element: `map()` returns transformed list; 
  `each()` returns original list, calling function for its side effects;
  `map2()` and `map3()` vectorise over multiple inputs.

* Reduce a list to a single value by iteratively applying a binary 
  function: `reduce()` and `reduce_right()`.

* Figure out if a list contains an object: `contains()`.

* Order, sort and split a list based on its components with `split_by()`,
  `order_by()` and `sort_by()`.

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

## Philosophy

The goal is not to try and simulate Haskell in R: lowliner does not implement currying or destructuring binds or pattern matching. The goal is to give you similar expressiveness to an FP language, while allowing you to write code that looks and works like R.

* Instead of point free style, use the pipe, `%>%` to write code that can be 
  read from left to right.

* Instead of currying, we use `...` to pass in extra arguments. 

* Anonymous functions are verbose in R, so we provide two convenient shorthands.
  For predicate functions, `~ . + 1` is equivalent to `function(.) . + 1`.
  For chains of transformations functions, `. %>% f() %>% g()` is 
  equivalent to `function(.) . %>% f() %>% g()`.
  
* R is weakly typed, so we can implement general `zip()` and `unzip()`, 
  rather than having to specialise on the number of arguments. (That said
  I still provide `map2()` and `map3()` since it's useful to clearly separate
  which arguments are vectorised over).
  
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
