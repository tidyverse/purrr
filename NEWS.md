# purrr 0.2.2.9000

* `as_function()` is now `as_mapper()` (#298)

* `.null` argument to `as_function()` has been renamed to `.default` to 
  better reflect its intent (#298).

* `as_function()` now generates a better argument list so you can refer to
  arguments by position like `..1` and `..2`. This makes it possible to use
  the formula shorthand for functions that need more arguments (#289).

* New `reduce2()` and `reduce2_right()` make it possible to reduce with a
  3 argument function where the first argument is the accumulated value, the
  second argument is `.x`, and the third argument is `.y` (#163).

* `reduce()` now throws an error if `.x` is empty and `.init` is not 
  supplied.

* `update_list()` has been renamed to `list_update()`.

* New `list_modify()` extends `stats::modifyList()` to replace by position
  if the list is not named. `list_update()` uses `list_modify()` (#201).

* `order_by()`, `sort_by()` and `split_by()` have been removed. `order_by()`
  conflicted with `dplyr::order_by()` and the complete family doesn't feel that
  useful. Use tibbles instead (#217).
  
* `contains()` has been renamed to `has_element()` to avoid conflicts with
  dplyr (#217).

* All `map()` functions now force arguments in the same way that base R
  does for apply functions (#191).

* The data frame suffix `_df` has been (soft) deprecated in favour of 
  `_dfr` to more clearly indicate that it's a row bind. All variants now 
  also have a `_dfc` for column binding (#167). (These will not be terribly
  useful until `dplyr::bind_rows()`/`dplyr::bind_cols()` have better
  semantics)

* All predicate functions are re-exported from rlang (#124).

* `is_numeric()` and `is_scalar_numeric()` are deprecated because they
  don't test for what you might naively expect.

* `safely()` now uses the `quiet` option (#296).

* `modify_depth()` gains new `.ragged` argument, and negative depths are 
  now computed relative to the deepest component of the list (#236).

* New `modify()` is shorthand for `x[] <- map(x, f)`.

* `map_at()` and `map_if()` have been deprecated. Please use `modify_at()` 
  and `modify_if()` instead (#292). `at_depth()` has been deprecated;
  please use `modify_depth()` instead.

* `invoke()` no longer uses lazyeval to figure out which enviroment a 
  character `f` comes from.

* `transpose()` now matches by name if available (#164). You can 
  override the default choice with the new `.names` argument.

* `get_attr()` makes it possible to extract values from attributes within
  `as_funtion()`.

* `pmap()` coerces data frames to lists to avoid the expensive `[.data.frame`
  which provides security that's unneeded here (#220).

* `invoke()` uses a more robust approach to generate the argument list (#249)

* `map_if()` and `map_at()` now modify their input in-place (#169).

* New `depth()` computes the depth (i.e. the number of levels of indexing)
  or a vector (#243).

* A new family of "indexed" map functions, `imap()`, `imap_lgl()` etc, 
  provide a short-hand for `map2(x, names(x))` or `map2(x, seq_along(x))`
  (#240).

* Deprecated functions `flatmap()`, `map3()`, `map_n()`, `walk3()`, and 
  `walk_n()` have been removed.

* `every()` and `some()` now return `NA` if present in the output (#174).

* `set_names()` can now take a function to tranform the names programmatically
  (#276).

* `rdunif()` checks its inputs for validity (#211).

* `map2()` and `pmap()` (and all output type variants) now return a output
  of length 0 if any input is of length 0.

* `map()`, `map2()`, and `pmap()` (as well as all output type variants)
  treat NULL the same way as an empty vector (#199).

* All data-frame based mappers have been deprecated in favour of new
  functions and idioms in the tidyverse. `dmap()`, `dmap_at()`, `dmap_if()`,
  `invoke_rows()`, `slice_rows()`, `map_rows()`, `by_slice()`, `by_row()`, and
  `unslice()` have been moved to purrrlyr. This is a bit of an aggressive
  change but it allows us to make the dependencies much lighter.

* `cross_n()` has been renamed to `cross()`. The `_n` suffix was
  removed for consistency with `pmap()` (originally called `map_n()`
  at the start of the project) and `transpose()` (originally called
  `zip_n()`). Similarly, `cross_d()` has been renamed to `cross_df()`
  for consistency with `map_df()`.

* Removed `LinkingTo:` dependency on `dplyr` (#247, @krlmlr).

* Recursive index via `as_function()` now returns `missing` when first element
  is `NULL`, or when the element has length 0 (#254). Recursive indexing
  can now recurse through environments (#213) and S4 objects (#200).

* When indexing elements (e.g. `map(x, "field")`), `NULL` values are
  replaced with `.null` (#231).

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
