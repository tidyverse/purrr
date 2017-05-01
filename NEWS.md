# purrr 0.2.2.1

This is a compatibility release with dplyr 0.6.0.

* All data-frame based mappers have been removed in favour of new
  functions and idioms in the tidyverse. `dmap()`, `dmap_at()`,
  `dmap_if()`, `invoke_rows()`, `slice_rows()`, `map_rows()`,
  `by_slice()`, `by_row()`, and `unslice()` have been moved to
  purrrlyr. This is a bit of an aggresive change but it allows us to
  make the dependencies much lighter.


# purrr 0.2.2

* Fix for dev tibble support.

* `as_function()` now supports list arguments which allow recursive indexing
   using either names or positions. They now always stop when encountering
   the first NULL (#173).

* `accumulate` and `reduce` correctly pass extra arguments to the
   worker function.

# purrr 0.2.1

* `as_function()` gains a `.null` argument that for character and numeric
  values allows you to specify what to return for null/absent elements (#110).
  This can be used with any map function, e.g. `map_int(x, 1, .null = NA)`

* `as_function()` is now generic.

* New `is_function()` that returns `TRUE` only for regular functions.

* Fix crash on GCC triggered by `invoke_rows()`.

# purrr 0.2.0

## New functions

* There are two handy infix functions:

    * `x %||% y` is shorthand for `if (is.null(x)) y else x` (#109).
    * `x %@% "a"` is shorthand for `attr(x, "a", exact = TRUE)` (#69).

* `accumulate()` has been added to handle recursive folding. It is shortand
  for `Reduce(f, .x, accumulate = TRUE)` and follows a similar syntax to 
  `reduce()` (#145). A right-hand version `accumulate_right()` was also added.

* `map_df()` row-binds output together. It's the equivalent of `plyr::ldply()` 
  (#127)

* `flatten()` is now type-stable and always returns a list. To return a simpler
  vector, use `flatten_lgl()`, `flatten_int()`, `flatten_dbl()`,
  `flatten_chr()`, or `flatten_df()`.

* `invoke()` has been overhauled to be more useful: it now works similarly
  to `map_call()` when `.x` is NULL, and hence `map_call()` has been
  deprecated. `invoke_map()` is a vectorised complement to `invoke()` (#125),
  and comes with typed variants `invoke_map_lgl()`, `invoke_map_int()`,
  `invoke_map_dbl()`, `invoke_map_chr()`, and `invoke_map_df()`.

* `transpose()` replaces `zip2()`, `zip3()`, and `zip_n()` (#128).
  The name more clearly reflects the intent (transposing the first and second
  levels of list). It no longer has fields argument or the `.simplify` argument; 
  instead use the new `simplify_all()` function.

* `safely()`, `quietly()`, and `possibly()` are experimental functions
  for working with functions with side-effects (e.g. printed output,
  messages, warnings, and errors) (#120). `safely()` is a version of `try()`
  that modifies a function (rather than an expression), and always returns a 
  list with two components, `result` and `error`.

* `list_along()` and `rep_along()` generalise the idea of `seq_along()`. 
  (#122).
  
* `is_null()` is the snake-case version of `is.null()`.

* `pmap()` (parallel map) replaces `map_n()` (#132), and has typed-variants
  suffixed `pmap_lgl()`, `pmap_int()`, `pmap_dbl()`, `pmap_chr()`, and 
  `pmap_df()`. 

* `set_names()` is a snake-case alternative to `setNames()` with stricter 
  equality checking, and more convenient defaults for pipes: 
  `x %>% set_names()` is equivalent to `setNames(x, x)` (#119).

## Row based functionals

We are still figuring out what belongs in dplyr and what belongs in purrr. Expect much experimentation and many changes with these functions.

* `map()` now always returns a list. Data frame support has been moved
  to `map_df()` and `dmap()`. The latter supports sliced data frames
  as a shortcut for the combination of `by_slice()` and `dmap()`:
  `x %>% by_slice(dmap, fun, .collate = "rows")`. The conditional
  variants `dmap_at()` and `dmap_if()` also support sliced data frames
  and will recycle scalar results to the slice size.

* `map_rows()` has been renamed to `invoke_rows()`. As other
  rows-based functionals, it collates results inside lists by default,
  but with column collation this function is equivalent to
  `plyr::mdply()`.

* The rows-based functionals gain a `.to` option to name the output
  column as well as a `.collate` argument. The latter allows to
  collate the output in lists (by default), on columns or on
  rows. This makes these functions more flexible and more predictable.

## Bug fixes and minor changes

* `as_function()`, which converts formulas etc to functions, is now
  exported (#123).

* `rerun()` is correctly scoped (#95)

* `update_list()` can now modify an element called `x` (#98).

* `map*()` now use custom C code, rather than relying on `lapply()`, `mapply()` 
  etc. The performance characteristcs are very similar, but it allows us greater 
  control over the output (#118).

* `map_lgl()` now has second argument `.f`, not `.p` (#134).

## Deprecated functions

* `flatmap()` -> use `map()` followed by the appropriate `flatten()`.

* `map_call()` -> `invoke()`.

* `map_n()` -> `pmap()`; `walk_n()` -> `pwalk()`.

* `map3(x, y, z)` -> `map_n(list(x, y, z))`; `walk3(x, y, z) -> `pwalk(list(x, y, z))`
