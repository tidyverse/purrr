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
