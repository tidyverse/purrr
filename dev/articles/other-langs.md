# Functional programming in other languages

purrr draws inspiration from many related tools:

- List operations defined in the Haskell
  [prelude](http://hackage.haskell.org/package/base-4.7.0.1/docs/Prelude.html#g:11)

- Scala’s [list
  methods](https://www.scala-lang.org/api/current/index.html).

- Functional programming libraries for javascript:
  [underscore.js](http://underscorejs.org), [lodash](https://lodash.com)
  and [lazy.js](http://danieltao.com/lazy.js/).

- [rlist](https://renkun-ken.github.io/rlist/), another R package to
  support working with lists. Similar goals but somewhat different
  philosophy.

However, the goal of purrr is not to try and simulate a purer functional
programming language in R; we don’t want to implement a second-class
version of Haskell in R. The goal is to give you similar expressiveness
to an FP language, while allowing you to write code that looks and works
like R:

- Instead of point free (tacit) style, we use the pipe, `|>`, to write
  code that can be read from left to right.

- Instead of currying, we use `...` to pass in extra arguments.

- Before R 4.1, anonymous functions were verbose, so we provided a
  convenient shorthand. For unary functions, `~ .x + 1` is equivalent to
  `function(.x) .x + 1`. Now we recommend using the function shorthand
  notation introduced in R 4.1, where `\(x) x + 1` is equivalent to
  `function(x) x + 1`.

- R is weakly typed, so we need `map` variants that describe the output
  type (like
  [`map_int()`](https://purrr.tidyverse.org/dev/reference/map.md),
  [`map_dbl()`](https://purrr.tidyverse.org/dev/reference/map.md), etc)
  because we don’t know the return type of `.f`.

- R has named arguments, so instead of providing different functions for
  minor variations
  (e.g. [`detect()`](https://purrr.tidyverse.org/dev/reference/detect.md)
  and `detectLast()`) we use a named argument, `.right`. Type-stable
  functions are easy to reason about so additional arguments will never
  change the type of the output.
