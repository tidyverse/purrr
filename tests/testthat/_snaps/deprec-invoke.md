# invoke_* is defunct

    Code
      invoke(identity, 1)
    Condition
      Error:
      ! `invoke()` was deprecated in purrr 1.0.0 and is now defunct.
      i Please use `exec()` instead.
    Code
      invoke_map(identity, list())
    Condition
      Error:
      ! `invoke_map()` was deprecated in purrr 1.0.0 and is now defunct.
      i Please use map() + exec() instead.
    Code
      invoke_map_lgl(identity, list())
    Condition
      Error:
      ! `invoke_lgl()` was deprecated in purrr 1.0.0 and is now defunct.
      i Please use map_lgl() + exec() instead.
    Code
      invoke_map_int(identity, list())
    Condition
      Error:
      ! `invoke_int()` was deprecated in purrr 1.0.0 and is now defunct.
      i Please use map_int() + exec() instead.
    Code
      invoke_map_dbl(identity, list())
    Condition
      Error:
      ! `invoke_dbl()` was deprecated in purrr 1.0.0 and is now defunct.
      i Please use map_dbl() + exec() instead.
    Code
      invoke_map_chr(identity, list())
    Condition
      Error:
      ! `invoke_chr()` was deprecated in purrr 1.0.0 and is now defunct.
      i Please use map_chr() + exec() instead.
    Code
      invoke_map_raw(identity, list())
    Condition
      Error:
      ! `invoke_raw()` was deprecated in purrr 1.0.0 and is now defunct.
      i Please use map_raw() + exec() instead.
    Code
      invoke_map_dfr(identity, list())
    Condition
      Error:
      ! `invoke_df()` was deprecated in purrr 1.0.0 and is now defunct.
      i Please use map() + exec() + list_rbind() instead.

# invoke_map_df() and invoke_map_dfc() are deprecated

    Code
      . <- invoke_map_df(identity, list())
    Condition
      Warning:
      `invoke_df()` was deprecated in purrr 1.0.0.
      i Please use map() + exec() + list_rbind() instead.
    Code
      . <- invoke_map_dfc(identity, list())
    Condition
      Warning:
      `invoke_dfc()` was deprecated in purrr 1.0.0.
      i Please use map() + exec() + list_cbind() instead.

