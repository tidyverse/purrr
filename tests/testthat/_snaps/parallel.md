# Can't use `...` in a parallel map

    Code
      map(list(x = 1, y = 2), in_parallel(function(x) list(x)), a = "wrong")
    Condition
      Error in `map()`:
      ! Can't use `...` with parallelized functions.

# all inform about location of problem

    Code
      map_int(1:3, in_parallel(function(x, bad = 2:1) if (x == 3) bad else x))
    Condition
      Error in `map_int()`:
      ! `x[[3]]` must have size 1, not size 2.
    Code
      map_int(1:3, in_parallel(function(x, bad = "x") if (x == 3) bad else x))
    Condition
      Error in `map_int()`:
      ! Can't convert `<list>[[3]]` <character> to <integer>.
    Code
      map(1:3, in_parallel(function(x, bad = stop("Doesn't work")) if (x ==
      3) bad else x))
    Condition
      Error in `map()`:
      i In index: 3.
      Caused by error:
      ! Doesn't work

# error location uses name if present

    Code
      map_int(c(a = 1, b = 2, c = 3), in_parallel(function(x, bad = stop(
        "Doesn't work")) if (x == 3) bad else x))
    Condition
      Error in `map_int()`:
      i In index: 3.
      i With name: c.
      Caused by error:
      ! Doesn't work
    Code
      map_int(c(a = 1, b = 2, 3), in_parallel(function(x, bad = stop("Doesn't work"))
        if (x == 3) bad else x))
    Condition
      Error in `map_int()`:
      i In index: 3.
      Caused by error:
      ! Doesn't work

# requires output be length 1 and have common type

    Code
      map_vec(1:2, in_parallel(~ rep(1, .x)))
    Condition
      Error in `map_vec()`:
      ! `out[[2]]` must have size 1, not size 2.
    Code
      map_vec(1:2, in_parallel(~ if (.x == 1) factor("x") else 1))
    Condition
      Error in `map_vec()`:
      ! Can't combine `<list>[[1]]` <factor<bf275>> and `<list>[[2]]` <double>.

# can enforce .ptype

    Code
      map_vec(1:2, in_parallel(~ factor("x")), .ptype = integer())
    Condition
      Error in `map_vec()`:
      ! Can't convert `<list>[[1]]` <factor<bf275>> to <integer>.

# verifies result types and length

    Code
      map2_int(1, 1, in_parallel(~"x"))
    Condition
      Error in `map2_int()`:
      ! Can't convert `<list>[[1]]` <character> to <integer>.
    Code
      map2_int(1, 1, in_parallel(~ 1:2))
    Condition
      Error in `map2_int()`:
      ! `x[[1]]` must have size 1, not size 2.
    Code
      map2_vec(1, 1, in_parallel(~1), .ptype = character())
    Condition
      Error in `map2_vec()`:
      ! Can't convert `<list>[[1]]` <double> to <character>.

---

    Code
      pmap_int(list(1), in_parallel(~"x"))
    Condition
      Error in `pmap_int()`:
      ! Can't convert `<list>[[1]]` <character> to <integer>.
    Code
      pmap_int(list(1), in_parallel(~ 1:2))
    Condition
      Error in `pmap_int()`:
      ! `x[[1]]` must have size 1, not size 2.
    Code
      pmap_vec(list(1), in_parallel(~1), .ptype = character())
    Condition
      Error in `pmap_vec()`:
      ! Can't convert `<list>[[1]]` <double> to <character>.

# requires vector inputs

    Code
      map2(environment(), "a", in_parallel(function(x) identity(x)))
    Condition
      Error in `map2()`:
      ! `.x` must be a vector, not an environment.
    Code
      map2("a", environment(), "a", in_parallel(function(x) identity(x)))
    Condition
      Error in `map2()`:
      ! `.y` must be a vector, not an environment.

# recycles inputs

    Code
      map2(1:2, 1:3, in_parallel(function(x, y) x + y))
    Condition
      Error in `map2()`:
      ! Can't recycle `.x` (size 2) to match `.y` (size 3).
    Code
      map2(1:2, integer(), in_parallel(function(x, y) x + y))
    Condition
      Error in `map2()`:
      ! Can't recycle `.x` (size 2) to match `.y` (size 0).

---

    Code
      pmap(list(1:2, 1:3), in_parallel(function(x, y) x + y))
    Condition
      Error in `pmap()`:
      ! Can't recycle `.l[[1]]` (size 2) to match `.l[[2]]` (size 3).
    Code
      pmap(list(1:2, integer()), in_parallel(function(x, y) x + y))
    Condition
      Error in `pmap()`:
      ! Can't recycle `.l[[1]]` (size 2) to match `.l[[2]]` (size 0).

# requires list of vectors

    Code
      pmap(environment(), in_parallel(function(x) identity(x)))
    Condition
      Error in `pmap()`:
      ! `.l` must be a list, not an environment.
    Code
      pmap(list(environment()), in_parallel(function(x) identity(x)))
    Condition
      Error in `pmap()`:
      ! `.l[[1]]` must be a vector, not an environment.

