# fails on non-vectors

    Code
      map(environment(), identity)
    Condition
      Error in `map()`:
      ! `.x` must be a vector, not an environment.

---

    Code
      map(quote(a), identity)
    Condition
      Error in `map()`:
      ! `.x` must be a vector, not a symbol.

# all inform about location of problem

    Code
      map_int(1:3, ~ fail_at_3(.x, 2:1))
    Condition
      Error in `map_int()`:
      i In index: 3.
      Caused by error:
      ! Result must be length 1, not 2.
    Code
      map_int(1:3, ~ fail_at_3("x"))
    Condition
      Error in `map_int()`:
      i In index: 1.
      Caused by error:
      ! Can't coerce from a character vector to an integer vector.
    Code
      map(1:3, ~ fail_at_3(stop("Doesn't work")))
    Condition
      Error in `map()`:
      i In index: 1.
      Caused by error in `fail_at_3()`:
      ! Doesn't work

# requires output be length 1 and have common type

    Code
      map_vec(1:2, ~ rep(1, .x))
    Condition
      Error in `map_vec()`:
      ! All elements must be size 1.
      i `out[[2]]` is size 2.
    Code
      map_vec(1:2, ~ if (.x == 1) factor("x") else 1)
    Condition
      Error in `list_unchop()`:
      ! Can't combine `x[[1]]` <factor<bf275>> and `x[[2]]` <double>.

# can enforce .ptype

    Code
      map_vec(1:2, ~ factor("x"), .ptype = integer())
    Condition
      Error in `list_unchop()`:
      ! Can't convert `x[[1]]` <factor<bf275>> to <integer>.

