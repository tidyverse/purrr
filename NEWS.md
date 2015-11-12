# purrr 0.1.0.9000

* `invoke()` has been overhauled to be more useful: it now works similarly
  to `map_call()` when `.x` is NULL, and hence `map_call()` has been
  deprecated. `invoke_map()` is a vectorised complement to `invoke()` (#125).

* Experimental functions `maybe()`, `outputs()`, and `safe()` for working
  with functions that have side-effecty outputs (e.g. printed output,
  messages, warnings, and errors) (#120).

* Implement `set_names()`: a camel case alternative to `setNames()` with
  stricter equality checking (#119).

* `map_df()` row-binds output together. It's the equivalent of `plyr::ldply()` 
  (#127)

* `as_function()`, which converts formuals etc to functions, is now
  exported (#123).

* `list_along()` and `rep_along()` generalise the idea of `seq_along(). 
  (#122).

* `%||%` is now exported (#109).

* `update_list()` can now modify an element called `x` (#98).

* New infix attribute accessor `%@%` (#69).

* `rerun()` is correctly scoped (#95)

* The map function now use custom C code, rather than relying on `lapply()`, 
  `mapply()` etc. The performance characteristcs are very similar, but it
  allows us greater control over the output (#118).
