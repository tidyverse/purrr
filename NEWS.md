# purrr 0.1.0.9000

* New `is_null()` type predicate.

* `map_lgl()` now has second argument `.f`, not `.p` (#134).

* `map_n()` is now `pmap()` (parallel map) (#132). `pmap()` has output
  suffixed `lgl`, `int`, `dbl`, `chr`, and `df`.

* `transpose()` loses the fields argument and gains a C implementation.

* `flatmap()` has been deprecated. Please use `map()` followed by the 
  appropriate `flatten()`.

* `flatten()` is now type-stable and always returns a list. To return a simpler
  vector, use `flatten_lgl()`, `flatten_int()`, `flatten_dbl()`,
  `flatten_chr()`, and `flatten_df()`.

* `map3()` and `walk3()` have been deprecated.

* `invoke()` has been overhauled to be more useful: it now works similarly
  to `map_call()` when `.x` is NULL, and hence `map_call()` has been
  deprecated. `invoke_map()` is a vectorised complement to `invoke()` (#125).

* Experimental functions `safely()`, `quielty()`, and `possibly()` for working
  with functions that have side-effecty outputs (e.g. printed output,
  messages, warnings, and errors) (#120).

* Implement `set_names()`: a camel case alternative to `setNames()` with
  stricter equality checking (#119).

* `map_df()` row-binds output together. It's the equivalent of `plyr::ldply()` 
  (#127)

* `as_function()`, which converts formuals etc to functions, is now
  exported (#123).

* `list_along()` and `rep_along()` generalise the idea of `seq_along()`. 
  (#122).

* `%||%` is now exported (#109).

* `update_list()` can now modify an element called `x` (#98).

* New infix attribute accessor `%@%` (#69).

* `rerun()` is correctly scoped (#95)

* The map function now use custom C code, rather than relying on `lapply()`, 
  `mapply()` etc. The performance characteristcs are very similar, but it
  allows us greater control over the output (#118).

* `zip2()`, `zip3()`, and `zip_n()` have been replaced by `transpose()`.
  It does the same thing but the name is better (#128).
  
* `accumulate()` has been added to handle recursive folding. It is shortand
  for `Reduce(f, .x, accumulate = TRUE)` and follows a similar syntax to 
  `reduce()` (#145). A right-hand version `accumulate_right()` was also added.
