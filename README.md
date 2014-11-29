# lowliner

This is a functional programming (FP) library in the style of [underscore.js](http://underscorejs.org), [low-dash](https://lodash.com) and [lazy.js](http://danieltao.com/lazy.js/).

## Functions

* Apply a function to each element: `map()` returns transformed list; 
  `each()` returns original list, calling function for its side effects;
  `map2()` and `map3()` vectorise over multiple inputs.

* Iteratively a list to a single value by iteratively applying a binary 
  function: `reduce()` and `reduce_right()`.

* Figure out if a list contains an object: `contains()`.

### Predicate functions

A predicate function is a function that either returns `TRUE` or `FALSE`:

* `keep()` or `discard()` elements where predicate is true.

* Does `every()` element or `some()` elements match a predicate?

* Find the value (`detect()`) and index (`detect_index()`) of the first element 
  that satisfies the predicate.

### Lists of functions

* `invoke()` every function in a list with given arguments.

### Function operators

* Fill in function arguments with `partial()`. 

* Convert a function to take a list of inputs with `splat()`.

* Compose multiple functions into a single function with `compose()`.
