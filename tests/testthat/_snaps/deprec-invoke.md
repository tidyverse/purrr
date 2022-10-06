# invoke_* is deprecated

    Code
      . <- invoke(identity, 1)
    Condition
      Warning:
      `invoke()` was deprecated in purrr 1.0.0.
      i Please use `exec()` instead.
    Code
      . <- invoke_map(identity, list())
    Condition
      Warning:
      `invoke_map()` was deprecated in purrr 1.0.0.
      i Please use map() + exec() instead.
    Code
      . <- invoke_map_lgl(identity, list())
    Condition
      Warning:
      `invoke_lgl()` was deprecated in purrr 1.0.0.
      i Please use map_lgl() + exec() instead.
    Code
      . <- invoke_map_int(identity, list())
    Condition
      Warning:
      `invoke_int()` was deprecated in purrr 1.0.0.
      i Please use map_int() + exec() instead.
    Code
      . <- invoke_map_dbl(identity, list())
    Condition
      Warning:
      `invoke_dbl()` was deprecated in purrr 1.0.0.
      i Please use map_dbl() + exec() instead.
    Code
      . <- invoke_map_chr(identity, list())
    Condition
      Warning:
      `invoke_chr()` was deprecated in purrr 1.0.0.
      i Please use map_chr() + exec() instead.
    Code
      . <- invoke_map_raw(identity, list())
    Condition
      Warning:
      `invoke_raw()` was deprecated in purrr 1.0.0.
      i Please use map_raw() + exec() instead.

