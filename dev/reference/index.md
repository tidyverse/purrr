# Package index

## Map family

The `map(.x, .f)` functions transforms each element of the vector `.x`
with the function `.f`, returning a vector defined by the suffix
(`_lgl`, `_chr()` etc).
[`walk()`](https://purrr.tidyverse.org/dev/reference/map.md) is a
variant for functions called primarily for their side-effects; it
returns `.x` invisibly.

As well as functions, `.f`, can take numbers and characters (used as a
shorthand for `[[`), and formulas (used as a succint function
definition). See details in
[`as_mapper()`](https://purrr.tidyverse.org/dev/reference/as_mapper.md)

- [`map()`](https://purrr.tidyverse.org/dev/reference/map.md)
  [`map_lgl()`](https://purrr.tidyverse.org/dev/reference/map.md)
  [`map_int()`](https://purrr.tidyverse.org/dev/reference/map.md)
  [`map_dbl()`](https://purrr.tidyverse.org/dev/reference/map.md)
  [`map_chr()`](https://purrr.tidyverse.org/dev/reference/map.md)
  [`map_vec()`](https://purrr.tidyverse.org/dev/reference/map.md)
  [`walk()`](https://purrr.tidyverse.org/dev/reference/map.md) : Apply a
  function to each element of a vector
- [`as_mapper()`](https://purrr.tidyverse.org/dev/reference/as_mapper.md)
  : Convert an object into a mapper function

## Map variants

A rich set of variants builds on the basic idea of
[`map()`](https://purrr.tidyverse.org/dev/reference/map.md):
[`modify()`](https://purrr.tidyverse.org/dev/reference/modify.md)
modifies “in place”, returning a vector the same type as `.x`;
[`map2()`](https://purrr.tidyverse.org/dev/reference/map2.md) iterates
over two vectors in parallel;
[`pmap()`](https://purrr.tidyverse.org/dev/reference/pmap.md) (parallel
map) iterates over a list of vectors;
[`imap()`](https://purrr.tidyverse.org/dev/reference/imap.md) (index
map) is a shortcut for the common pattern `map2(x, names(x))`.

- [`map_if()`](https://purrr.tidyverse.org/dev/reference/map_if.md)
  [`map_at()`](https://purrr.tidyverse.org/dev/reference/map_if.md) :
  Apply a function to each element of a vector conditionally
- [`map_depth()`](https://purrr.tidyverse.org/dev/reference/map_depth.md)
  [`modify_depth()`](https://purrr.tidyverse.org/dev/reference/map_depth.md)
  : Map/modify elements at given depth
- [`map2()`](https://purrr.tidyverse.org/dev/reference/map2.md)
  [`map2_lgl()`](https://purrr.tidyverse.org/dev/reference/map2.md)
  [`map2_int()`](https://purrr.tidyverse.org/dev/reference/map2.md)
  [`map2_dbl()`](https://purrr.tidyverse.org/dev/reference/map2.md)
  [`map2_chr()`](https://purrr.tidyverse.org/dev/reference/map2.md)
  [`map2_vec()`](https://purrr.tidyverse.org/dev/reference/map2.md)
  [`walk2()`](https://purrr.tidyverse.org/dev/reference/map2.md) : Map
  over two inputs
- [`pmap()`](https://purrr.tidyverse.org/dev/reference/pmap.md)
  [`pmap_lgl()`](https://purrr.tidyverse.org/dev/reference/pmap.md)
  [`pmap_int()`](https://purrr.tidyverse.org/dev/reference/pmap.md)
  [`pmap_dbl()`](https://purrr.tidyverse.org/dev/reference/pmap.md)
  [`pmap_chr()`](https://purrr.tidyverse.org/dev/reference/pmap.md)
  [`pmap_vec()`](https://purrr.tidyverse.org/dev/reference/pmap.md)
  [`pwalk()`](https://purrr.tidyverse.org/dev/reference/pmap.md) : Map
  over multiple input simultaneously (in "parallel")
- [`modify()`](https://purrr.tidyverse.org/dev/reference/modify.md)
  [`modify_if()`](https://purrr.tidyverse.org/dev/reference/modify.md)
  [`modify_at()`](https://purrr.tidyverse.org/dev/reference/modify.md)
  [`modify2()`](https://purrr.tidyverse.org/dev/reference/modify.md)
  [`imodify()`](https://purrr.tidyverse.org/dev/reference/modify.md) :
  Modify elements selectively
- [`modify_tree()`](https://purrr.tidyverse.org/dev/reference/modify_tree.md)
  : Recursively modify a list
- [`imap()`](https://purrr.tidyverse.org/dev/reference/imap.md)
  [`imap_lgl()`](https://purrr.tidyverse.org/dev/reference/imap.md)
  [`imap_chr()`](https://purrr.tidyverse.org/dev/reference/imap.md)
  [`imap_int()`](https://purrr.tidyverse.org/dev/reference/imap.md)
  [`imap_dbl()`](https://purrr.tidyverse.org/dev/reference/imap.md)
  [`imap_vec()`](https://purrr.tidyverse.org/dev/reference/imap.md)
  [`iwalk()`](https://purrr.tidyverse.org/dev/reference/imap.md) : Apply
  a function to each element of a vector, and its index
- [`lmap()`](https://purrr.tidyverse.org/dev/reference/lmap.md)
  [`lmap_if()`](https://purrr.tidyverse.org/dev/reference/lmap.md)
  [`lmap_at()`](https://purrr.tidyverse.org/dev/reference/lmap.md) :
  Apply a function to list-elements of a list

## Predicate functionals

A predicate function is a function that either returns `TRUE` or
`FALSE`. The predicate functionals take a vector and a predicate
function and do something useful.

- [`detect()`](https://purrr.tidyverse.org/dev/reference/detect.md)
  [`detect_index()`](https://purrr.tidyverse.org/dev/reference/detect.md)
  : Find the value or position of the first match
- [`every()`](https://purrr.tidyverse.org/dev/reference/every.md)
  [`some()`](https://purrr.tidyverse.org/dev/reference/every.md)
  [`none()`](https://purrr.tidyverse.org/dev/reference/every.md) : Do
  every, some, or none of the elements of a list satisfy a predicate?
- [`has_element()`](https://purrr.tidyverse.org/dev/reference/has_element.md)
  : Does a list contain an object?
- [`head_while()`](https://purrr.tidyverse.org/dev/reference/head_while.md)
  [`tail_while()`](https://purrr.tidyverse.org/dev/reference/head_while.md)
  : Find head/tail that all satisfies a predicate.
- [`keep()`](https://purrr.tidyverse.org/dev/reference/keep.md)
  [`discard()`](https://purrr.tidyverse.org/dev/reference/keep.md)
  [`compact()`](https://purrr.tidyverse.org/dev/reference/keep.md) :
  Keep/discard elements based on their values
- [`keep_at()`](https://purrr.tidyverse.org/dev/reference/keep_at.md)
  [`discard_at()`](https://purrr.tidyverse.org/dev/reference/keep_at.md)
  : Keep/discard elements based on their name/position

## Plucking

Getting or setting a single element.

- [`pluck()`](https://purrr.tidyverse.org/dev/reference/pluck.md)
  [`` `pluck<-`() ``](https://purrr.tidyverse.org/dev/reference/pluck.md)
  [`pluck_exists()`](https://purrr.tidyverse.org/dev/reference/pluck.md)
  : Safely get or set an element deep within a nested data structure
- [`chuck()`](https://purrr.tidyverse.org/dev/reference/chuck.md) : Get
  an element deep within a nested data structure, failing if it doesn't
  exist
- [`pluck_depth()`](https://purrr.tidyverse.org/dev/reference/pluck_depth.md)
  : Compute the depth of a vector
- [`modify_in()`](https://purrr.tidyverse.org/dev/reference/modify_in.md)
  [`assign_in()`](https://purrr.tidyverse.org/dev/reference/modify_in.md)
  : Modify a pluck location
- [`attr_getter()`](https://purrr.tidyverse.org/dev/reference/attr_getter.md)
  : Create an attribute getter function

## Other vector transforms

A grab bag of useful tools for manipulating vectors.

- [`accumulate()`](https://purrr.tidyverse.org/dev/reference/accumulate.md)
  [`accumulate2()`](https://purrr.tidyverse.org/dev/reference/accumulate.md)
  : Accumulate intermediate results of a vector reduction
- [`list_c()`](https://purrr.tidyverse.org/dev/reference/list_c.md)
  [`list_cbind()`](https://purrr.tidyverse.org/dev/reference/list_c.md)
  [`list_rbind()`](https://purrr.tidyverse.org/dev/reference/list_c.md)
  : Combine list elements into a single data structure
- [`list_flatten()`](https://purrr.tidyverse.org/dev/reference/list_flatten.md)
  : Flatten a list
- [`list_assign()`](https://purrr.tidyverse.org/dev/reference/list_assign.md)
  [`list_modify()`](https://purrr.tidyverse.org/dev/reference/list_assign.md)
  [`list_merge()`](https://purrr.tidyverse.org/dev/reference/list_assign.md)
  : Modify a list
- [`list_simplify()`](https://purrr.tidyverse.org/dev/reference/list_simplify.md)
  : Simplify a list to an atomic or S3 vector
- [`list_transpose()`](https://purrr.tidyverse.org/dev/reference/list_transpose.md)
  : Transpose a list
- [`reduce()`](https://purrr.tidyverse.org/dev/reference/reduce.md)
  [`reduce2()`](https://purrr.tidyverse.org/dev/reference/reduce.md) :
  Reduce a list to a single value by iteratively applying a binary
  function

## Superseded

Superseded functions have been replaced by superior solutions, but due
to their widespread use will not go away. However, they will not get any
new features and will only receive critical bug fixes.

- [`flatten()`](https://purrr.tidyverse.org/dev/reference/flatten.md)
  [`flatten_lgl()`](https://purrr.tidyverse.org/dev/reference/flatten.md)
  [`flatten_int()`](https://purrr.tidyverse.org/dev/reference/flatten.md)
  [`flatten_dbl()`](https://purrr.tidyverse.org/dev/reference/flatten.md)
  [`flatten_chr()`](https://purrr.tidyverse.org/dev/reference/flatten.md)
  [`flatten_dfr()`](https://purrr.tidyverse.org/dev/reference/flatten.md)
  [`flatten_dfc()`](https://purrr.tidyverse.org/dev/reference/flatten.md)
  **\[superseded\]** : Flatten a list of lists into a simple vector
- [`map_dfr()`](https://purrr.tidyverse.org/dev/reference/map_dfr.md)
  [`map_dfc()`](https://purrr.tidyverse.org/dev/reference/map_dfr.md)
  [`imap_dfr()`](https://purrr.tidyverse.org/dev/reference/map_dfr.md)
  [`imap_dfc()`](https://purrr.tidyverse.org/dev/reference/map_dfr.md)
  [`map2_dfr()`](https://purrr.tidyverse.org/dev/reference/map_dfr.md)
  [`map2_dfc()`](https://purrr.tidyverse.org/dev/reference/map_dfr.md)
  [`pmap_dfr()`](https://purrr.tidyverse.org/dev/reference/map_dfr.md)
  [`pmap_dfc()`](https://purrr.tidyverse.org/dev/reference/map_dfr.md)
  **\[superseded\]** : Functions that return data frames
- [`as_vector()`](https://purrr.tidyverse.org/dev/reference/as_vector.md)
  [`simplify()`](https://purrr.tidyverse.org/dev/reference/as_vector.md)
  [`simplify_all()`](https://purrr.tidyverse.org/dev/reference/as_vector.md)
  **\[superseded\]** : Coerce a list to a vector
- [`transpose()`](https://purrr.tidyverse.org/dev/reference/transpose.md)
  **\[superseded\]** : Transpose a list.

## Adverbs

Adverbs modify the action of a function; they take a function as input
and return a function with modified action as output.

- [`auto_browse()`](https://purrr.tidyverse.org/dev/reference/auto_browse.md)
  :

  Wrap a function so it will automatically `browse()` on error

- [`compose()`](https://purrr.tidyverse.org/dev/reference/compose.md) :
  Compose multiple functions together to create a new function

- [`insistently()`](https://purrr.tidyverse.org/dev/reference/insistently.md)
  : Transform a function to wait then retry after an error

- [`negate()`](https://purrr.tidyverse.org/dev/reference/negate.md) :
  Negate a predicate function so it selects what it previously rejected

- [`partial()`](https://purrr.tidyverse.org/dev/reference/partial.md) :
  Partially apply a function, filling in some arguments

- [`possibly()`](https://purrr.tidyverse.org/dev/reference/possibly.md)
  : Wrap a function to return a value instead of an error

- [`quietly()`](https://purrr.tidyverse.org/dev/reference/quietly.md) :
  Wrap a function to capture side-effects

- [`safely()`](https://purrr.tidyverse.org/dev/reference/safely.md) :
  Wrap a function to capture errors

- [`slowly()`](https://purrr.tidyverse.org/dev/reference/slowly.md) :
  Wrap a function to wait between executions

## Misc

- [`array_branch()`](https://purrr.tidyverse.org/dev/reference/array-coercion.md)
  [`array_tree()`](https://purrr.tidyverse.org/dev/reference/array-coercion.md)
  : Coerce array to list
- [`rate_delay()`](https://purrr.tidyverse.org/dev/reference/rate-helpers.md)
  [`rate_backoff()`](https://purrr.tidyverse.org/dev/reference/rate-helpers.md)
  [`is_rate()`](https://purrr.tidyverse.org/dev/reference/rate-helpers.md)
  : Create delaying rate settings
- [`progress_bars`](https://purrr.tidyverse.org/dev/reference/progress_bars.md)
  : Progress bars in purrr
- [`in_parallel()`](https://purrr.tidyverse.org/dev/reference/in_parallel.md)
  **\[experimental\]** : Parallelization in purrr
