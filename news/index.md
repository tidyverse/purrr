# Changelog

## purrr 1.2.1

CRAN release: 2026-01-09

- Tweaks for compatibility with upcoming vctrs 0.7.0.

## purrr 1.2.0

CRAN release: 2025-11-04

### Breaking changes

- All functions and arguments deprecated in purrr 0.3.0 have now been
  removed. This includes `%@%`, `accumulate_right()`, `at_depth()`,
  `cross_d()`, `cross_n()`, `reduce2_right()`, and `reduce_right()`.

- All functions that were soft-deprecated in purrr 1.0.0 are now fully
  deprecated. They will be removed in a future release. This includes:
  `invoke_*()`, `lift_*()`, `cross*()`,
  [`prepend()`](https://purrr.tidyverse.org/reference/prepend.md),
  [`splice()`](https://purrr.tidyverse.org/reference/splice.md),
  [`rbernoulli()`](https://purrr.tidyverse.org/reference/rbernoulli.md),
  [`rdunif()`](https://purrr.tidyverse.org/reference/rdunif.md),
  [`when()`](https://purrr.tidyverse.org/reference/when.md),
  [`update_list()`](https://purrr.tidyverse.org/reference/update_list.md),
  `*_raw()`,
  [`vec_depth()`](https://purrr.tidyverse.org/reference/pluck_depth.md).

- [`map_chr()`](https://purrr.tidyverse.org/reference/map.md) no longer
  coereces from logical, integer, or double to strings.

- [`every()`](https://purrr.tidyverse.org/reference/every.md),
  [`some()`](https://purrr.tidyverse.org/reference/every.md), and
  [`none()`](https://purrr.tidyverse.org/reference/every.md) now require
  that `.p` return logical scalar `TRUE`, `FALSE`, or `NA`. Previously,
  `NA` was allowed to be a non-logical `NA`, and would be coerced to a
  logical `NA`.

### Minor improvements and bug fixes

- New “getting started” vignette,
  [`vignette("purrr")`](https://purrr.tidyverse.org/articles/purrr.md)
  ([\#915](https://github.com/tidyverse/purrr/issues/915),
  [@ogolovkina](https://github.com/ogolovkina)).

- [`every()`](https://purrr.tidyverse.org/reference/every.md),
  [`some()`](https://purrr.tidyverse.org/reference/every.md), and
  [`none()`](https://purrr.tidyverse.org/reference/every.md) are now
  more performant. They are now as fast as or faster than their
  equivalent `any(map_lgl())` or `all(map_lgl())` calls
  ([\#1036](https://github.com/tidyverse/purrr/issues/1036),
  [@ErdaradunGaztea](https://github.com/ErdaradunGaztea)).

- `as_mapper.default()` optimized by removing special named argument
  handling for primitive functions
  ([@mtcarsalot](https://github.com/mtcarsalot),
  [\#1088](https://github.com/tidyverse/purrr/issues/1088)).

- [`list_flatten()`](https://purrr.tidyverse.org/reference/list_flatten.md)
  gains an `is_node` parameter taking a predicate function that
  determines whether an input element is a node or a leaf
  ([@salim-b](https://github.com/salim-b),
  [\#1179](https://github.com/tidyverse/purrr/issues/1179)).

- [`in_parallel()`](https://purrr.tidyverse.org/reference/in_parallel.md)
  now accepts objects, including helper functions, supplied to `...` for
  all locally-defined functions
  ([\#1208](https://github.com/tidyverse/purrr/issues/1208)).

- [`in_parallel()`](https://purrr.tidyverse.org/reference/in_parallel.md)
  now works in conjunction with string and list values supplied to the
  `.progress` argument of map functions
  ([\#1203](https://github.com/tidyverse/purrr/issues/1203)).

- [`map()`](https://purrr.tidyverse.org/reference/map.md),
  [`map2()`](https://purrr.tidyverse.org/reference/map2.md), and
  [`pmap()`](https://purrr.tidyverse.org/reference/pmap.md) now
  automatically set the correct environment so that `format` strings to
  access to local variables ([@jcolt45](https://github.com/jcolt45),
  [\#1078](https://github.com/tidyverse/purrr/issues/1078)).

- [`map_vec()`](https://purrr.tidyverse.org/reference/map.md) no longer
  fails on empty named lists
  ([\#1206](https://github.com/tidyverse/purrr/issues/1206)).

## purrr 1.1.0

CRAN release: 2025-07-10

- purrr now requires R \>= 4.1, so we can rely on the base pipe and
  lambda syntax
  ([\#1177](https://github.com/tidyverse/purrr/issues/1177)).

- purrr gains
  [`in_parallel()`](https://purrr.tidyverse.org/reference/in_parallel.md)
  to support parallel and distributed maps, powered by {mirai}. See
  [`?in_parallel`](https://purrr.tidyverse.org/reference/in_parallel.md)
  for more details ([@shikokuchuo](https://github.com/shikokuchuo),
  [\#1163](https://github.com/tidyverse/purrr/issues/1163),
  [\#1185](https://github.com/tidyverse/purrr/issues/1185)).

## purrr 1.0.4

CRAN release: 2025-02-05

## purrr 1.0.3

- Varies fixed to bring purrr back into compliance with R CMD check
  ([@shikokuchuo](https://github.com/shikokuchuo),
  [@jayhesselberth](https://github.com/jayhesselberth)).

- Added missing
  [`imap_vec()`](https://purrr.tidyverse.org/reference/imap.md)
  ([\#1084](https://github.com/tidyverse/purrr/issues/1084))

- [`list_transpose()`](https://purrr.tidyverse.org/reference/list_transpose.md)
  now asserts that it does not work on data frames
  ([@KimLopezGuell](https://github.com/KimLopezGuell),
  [\#1141](https://github.com/tidyverse/purrr/issues/1141),
  [\#1149](https://github.com/tidyverse/purrr/issues/1149)), and
  inspects all elements to determine the correct template if not
  provided by the user
  ([\#1128](https://github.com/tidyverse/purrr/issues/1128),
  [@krlmlr](https://github.com/krlmlr)).

## purrr 1.0.2

CRAN release: 2023-08-10

- Fixed valgrind issue.

- Deprecation infrastructure in
  [`map_chr()`](https://purrr.tidyverse.org/reference/map.md) now has
  much less overhead leading to improved performance
  ([\#1089](https://github.com/tidyverse/purrr/issues/1089)).

- purrr now requires R 3.5.0.

## purrr 1.0.1

CRAN release: 2023-01-10

- As of purrr 1.0.0, the
  [`map()`](https://purrr.tidyverse.org/reference/map.md) family of
  functions wraps all errors generated by `.f` inside an wrapper error
  that tracks the iteration index. As of purrr 1.0.1, this error now has
  a custom class (`purrr_error_indexed`), `location` and `name` fields,
  and is documented in
  [`?purrr_error_indexed`](https://purrr.tidyverse.org/reference/purrr_error_indexed.md)
  ([\#1027](https://github.com/tidyverse/purrr/issues/1027)).

- [`map()`](https://purrr.tidyverse.org/reference/map.md) errors with
  named inputs also report the name of the element that errored.

- Fixed an issue where progress bars weren’t being closed when user
  interrupts or errors were encountered during a
  [`map()`](https://purrr.tidyverse.org/reference/map.md) call
  ([\#1024](https://github.com/tidyverse/purrr/issues/1024)).

- Fixed an invalid C signature for
  [`pluck()`](https://purrr.tidyverse.org/reference/pluck.md)
  ([\#1018](https://github.com/tidyverse/purrr/issues/1018)).

- Set `Biarch: true` to build purrr on 32-bit Windows on R \< 4.2.0
  ([\#1017](https://github.com/tidyverse/purrr/issues/1017)).

## purrr 1.0.0

CRAN release: 2022-12-20

### Breaking changes

#### Core purpose refinements

- [`cross()`](https://purrr.tidyverse.org/reference/cross.md) and all
  its variants have been deprecated in favour of
  [`tidyr::expand_grid()`](https://tidyr.tidyverse.org/reference/expand_grid.html).
  These functions were slow and buggy and we no longer think they are
  the right approach to solving this problem. See
  [\#768](https://github.com/tidyverse/purrr/issues/768) for more
  information.

- [`update_list()`](https://purrr.tidyverse.org/reference/update_list.md)
  ([\#858](https://github.com/tidyverse/purrr/issues/858)) and
  [`rerun()`](https://purrr.tidyverse.org/reference/rerun.md)
  ([\#877](https://github.com/tidyverse/purrr/issues/877)), and the use
  of tidyselect with
  [`map_at()`](https://purrr.tidyverse.org/reference/map_if.md) and
  friends ([\#874](https://github.com/tidyverse/purrr/issues/874)) have
  been deprecated. These functions use some form of non-standard
  evaluation which we now believe is a poor fit for purrr.

- The `lift_*` family of functions has been deprecated. We no longer
  believe these to be a good fit for purrr because they rely on a style
  of function manipulation that is very uncommon in R code
  ([\#871](https://github.com/tidyverse/purrr/issues/871)).

- [`prepend()`](https://purrr.tidyverse.org/reference/prepend.md),
  [`rdunif()`](https://purrr.tidyverse.org/reference/rdunif.md),
  [`rbernoulli()`](https://purrr.tidyverse.org/reference/rbernoulli.md),
  [`when()`](https://purrr.tidyverse.org/reference/when.md), and
  [`list_along()`](https://purrr.tidyverse.org/reference/along.md) have
  all been deprecated
  ([\#925](https://github.com/tidyverse/purrr/issues/925)). It’s now
  clear that they don’t align with the core purpose of purrr.

- [`splice()`](https://purrr.tidyverse.org/reference/splice.md) is
  deprecated because we no longer believe that automatic splicing makes
  for good UI. Instead use `list2()` + `!!!` or
  [`list_flatten()`](https://purrr.tidyverse.org/reference/list_flatten.md)
  ([\#869](https://github.com/tidyverse/purrr/issues/869)).

#### Mapping

- Use of map functions with expressions, calls, and pairlists has been
  deprecated ([\#961](https://github.com/tidyverse/purrr/issues/961)).

- All map `_raw()` variants have been deprecated because they are of
  limited use and you can now use
  [`map_vec()`](https://purrr.tidyverse.org/reference/map.md) instead
  ([\#903](https://github.com/tidyverse/purrr/issues/903)).

- In [`map_chr()`](https://purrr.tidyverse.org/reference/map.md),
  automatic conversion from logical, integer, and double to character is
  now deprecated. Use an explicit
  [`as.character()`](https://rdrr.io/r/base/character.html) if needed
  ([\#904](https://github.com/tidyverse/purrr/issues/904)).

- Errors from `.f` are now wrapped in an additional class that gives
  information about where the error occurred
  ([\#945](https://github.com/tidyverse/purrr/issues/945)).

#### Deprecation next steps

- `as_function()` and the `...f` argument to
  [`partial()`](https://purrr.tidyverse.org/reference/partial.md) are no
  longer supported. They have been defunct for quite some time.

- Soft deprecated functions: `%@%`, `reduce_right()`, `reduce2_right()`,
  `accumulate_right()` are now fully deprecated. Similarly, the `.lazy`,
  `.env`, and `.first` arguments to
  [`partial()`](https://purrr.tidyverse.org/reference/partial.md), and
  the `.right` argument to
  [`detect()`](https://purrr.tidyverse.org/reference/detect.md) and
  [`detect_index()`](https://purrr.tidyverse.org/reference/detect.md)
  are fully deprecated. Removing elements with `NULL` in
  [`list_modify()`](https://purrr.tidyverse.org/reference/list_assign.md)
  and
  [`list_merge()`](https://purrr.tidyverse.org/reference/list_assign.md)
  is now fully deprecated.

- `is_numeric()` and `is_scalar_numeric()` have been removed. They have
  been deprecated since purrr 0.2.3 (Sep 2017).

- `invoke_*()` is now deprecated. It was superseded in 0.3.0 (Jan 2019)
  and 3.5 years later, we have decided to deprecate it as part of the
  API refinement in the 1.0.0 release.

- `map_call()` has been removed. It was made defunct in 0.3.0 (Jan
  2019).

### New features

- `*_at()` can now take a function (or formula) that’s passed the vector
  of element names and returns the elements to select.

- New [`map_vec()`](https://purrr.tidyverse.org/reference/map.md),
  [`map2_vec()`](https://purrr.tidyverse.org/reference/map2.md), and
  [`pmap_vec()`](https://purrr.tidyverse.org/reference/pmap.md) work on
  all types of vectors, extending
  [`map_lgl()`](https://purrr.tidyverse.org/reference/map.md),
  [`map_int()`](https://purrr.tidyverse.org/reference/map.md), and
  friends so that you can easily work with dates, factors, date-times
  and more ([\#435](https://github.com/tidyverse/purrr/issues/435)).

- New [`keep_at()`](https://purrr.tidyverse.org/reference/keep_at.md)
  and [`discard_at()`](https://purrr.tidyverse.org/reference/keep_at.md)
  that work like
  [`keep()`](https://purrr.tidyverse.org/reference/keep.md) and
  [`discard()`](https://purrr.tidyverse.org/reference/keep.md) but
  operation on element names rather than element contents
  ([\#817](https://github.com/tidyverse/purrr/issues/817)).

- Some mapping functions have now a `.progress` argument to create a
  progress bar. See
  [`?progress_bars`](https://purrr.tidyverse.org/reference/progress_bars.md)
  ([\#149](https://github.com/tidyverse/purrr/issues/149)).

- purrr is now licensed as MIT
  ([\#805](https://github.com/tidyverse/purrr/issues/805)).

- [`modify()`](https://purrr.tidyverse.org/reference/modify.md),
  [`modify_if()`](https://purrr.tidyverse.org/reference/modify.md),
  [`modify_at()`](https://purrr.tidyverse.org/reference/modify.md), and
  [`modify2()`](https://purrr.tidyverse.org/reference/modify.md) are no
  longer generics. We have discovered a simple implementation that no
  longer requires genericity and methods were only provided by a very
  small number of packages
  ([\#894](https://github.com/tidyverse/purrr/issues/894)).

- purrr now uses the base pipe (`|>`) and anonymous function short hand
  (`\(x)`), in all examples. This means that examples will no longer
  work in R 4.0 and earlier so in those versions of R, the examples are
  automatically converted to a regular section with a note that they
  might not work
  ([\#936](https://github.com/tidyverse/purrr/issues/936)).

- When map functions fail, they now report the element they failed at
  ([\#945](https://github.com/tidyverse/purrr/issues/945)).

- New
  [`modify_tree()`](https://purrr.tidyverse.org/reference/modify_tree.md)
  for recursively modifying nested data structures
  ([\#720](https://github.com/tidyverse/purrr/issues/720)).

#### Flattening and simplification

- New [`list_c()`](https://purrr.tidyverse.org/reference/list_c.md),
  [`list_rbind()`](https://purrr.tidyverse.org/reference/list_c.md), and
  [`list_cbind()`](https://purrr.tidyverse.org/reference/list_c.md) make
  it easy to [`c()`](https://rdrr.io/r/base/c.html),
  [`rbind()`](https://rdrr.io/r/base/cbind.html), or
  [`cbind()`](https://rdrr.io/r/base/cbind.html) all of the elements in
  a list.

- New
  [`list_simplify()`](https://purrr.tidyverse.org/reference/list_simplify.md)
  reduces a list of length-1 vectors to a simpler atomic or S3 vector
  ([\#900](https://github.com/tidyverse/purrr/issues/900)).

- New
  [`list_transpose()`](https://purrr.tidyverse.org/reference/list_transpose.md)
  which automatically simplifies if possible
  ([\#875](https://github.com/tidyverse/purrr/issues/875)).

- [`accumulate()`](https://purrr.tidyverse.org/reference/accumulate.md)
  and
  [`accumulate2()`](https://purrr.tidyverse.org/reference/accumulate.md)
  now both simplify the output if possible using vctrs. New arguments
  `simplify` and `ptype` allow you to control the details of
  simplification
  ([\#774](https://github.com/tidyverse/purrr/issues/774),
  [\#809](https://github.com/tidyverse/purrr/issues/809)).

- [`flatten()`](https://purrr.tidyverse.org/reference/flatten.md) and
  friends are superseded in favour of
  [`list_flatten()`](https://purrr.tidyverse.org/reference/list_flatten.md),
  [`list_c()`](https://purrr.tidyverse.org/reference/list_c.md),
  [`list_cbind()`](https://purrr.tidyverse.org/reference/list_c.md), and
  [`list_rbind()`](https://purrr.tidyverse.org/reference/list_c.md).

- `*_dfc()` and `*_dfr()` have been superseded in favour of using the
  appropriate map function along with
  [`list_rbind()`](https://purrr.tidyverse.org/reference/list_c.md) or
  [`list_cbind()`](https://purrr.tidyverse.org/reference/list_c.md)
  ([\#912](https://github.com/tidyverse/purrr/issues/912)).

- [`simplify()`](https://purrr.tidyverse.org/reference/as_vector.md),
  [`simplify_all()`](https://purrr.tidyverse.org/reference/as_vector.md),
  and
  [`as_vector()`](https://purrr.tidyverse.org/reference/as_vector.md)
  have been superseded in favour of
  [`list_simplify()`](https://purrr.tidyverse.org/reference/list_simplify.md).
  It provides a more consistent definition of simplification
  ([\#900](https://github.com/tidyverse/purrr/issues/900)).

- [`transpose()`](https://purrr.tidyverse.org/reference/transpose.md)
  has been superseded in favour of
  [`list_transpose()`](https://purrr.tidyverse.org/reference/list_transpose.md)
  ([\#875](https://github.com/tidyverse/purrr/issues/875)). It has
  built-in simplification.

#### Tidyverse consistency

- `_lgl()`, `_int()`, `_int()`, and `_dbl()` now use the same (strict)
  coercion methods as vctrs
  ([\#904](https://github.com/tidyverse/purrr/issues/904)). This means
  that:

  - `map_chr(TRUE, identity)`, `map_chr(0L, identity)`, and
    `map_chr(1L, identity)` are deprecated because we now believe that
    converting a logical/integer/double to a character vector should
    require an explicit coercion.

  - `map_int(1.5, identity)` now fails because we believe that silently
    truncating doubles to integers is dangerous. But note that
    `map_int(1, identity)` still works since no numeric precision is
    lost.

  - `map_int(c(TRUE, FALSE), identity)`,
    `map_dbl(c(TRUE, FALSE), identity)`, `map_lgl(c(1L, 0L), identity)`
    and `map_lgl(c(1, 0), identity)` now succeed because 1/TRUE and
    0/FALSE should be interchangeable.

- [`map2()`](https://purrr.tidyverse.org/reference/map2.md),
  [`modify2()`](https://purrr.tidyverse.org/reference/modify.md), and
  [`pmap()`](https://purrr.tidyverse.org/reference/pmap.md) now use
  tidyverse recycling rules where vectors of length 1 are recycled to
  any size but all others must have the same length
  ([\#878](https://github.com/tidyverse/purrr/issues/878)).

- [`map2()`](https://purrr.tidyverse.org/reference/map2.md) and
  [`pmap()`](https://purrr.tidyverse.org/reference/pmap.md) now recycle
  names of their first input if needed
  ([\#783](https://github.com/tidyverse/purrr/issues/783)).

- [`modify()`](https://purrr.tidyverse.org/reference/modify.md),
  [`modify_if()`](https://purrr.tidyverse.org/reference/modify.md), and
  [`modify_at()`](https://purrr.tidyverse.org/reference/modify.md) have
  been reimplemented using vctrs principles. This shouldn’t have an user
  facing impact, but it does make the implementation much simpler.

#### Plucking

- [`vec_depth()`](https://purrr.tidyverse.org/reference/pluck_depth.md)
  is now
  [`pluck_depth()`](https://purrr.tidyverse.org/reference/pluck_depth.md)
  and works with more types of input
  ([\#818](https://github.com/tidyverse/purrr/issues/818)).

- [`pluck()`](https://purrr.tidyverse.org/reference/pluck.md) now
  requires indices to be length 1
  ([\#813](https://github.com/tidyverse/purrr/issues/813)). It also now
  reports the correct type if you supply an unexpected index.

- [`pluck()`](https://purrr.tidyverse.org/reference/pluck.md) now
  accepts negative integers, indexing from the right
  ([\#603](https://github.com/tidyverse/purrr/issues/603)).

- [`pluck()`](https://purrr.tidyverse.org/reference/pluck.md) and
  [`chuck()`](https://purrr.tidyverse.org/reference/chuck.md) now fail
  if you provide named inputs to …
  ([\#788](https://github.com/tidyverse/purrr/issues/788)).

- [`pluck()`](https://purrr.tidyverse.org/reference/pluck.md) no longer
  replaces 0-length vectors with `default`; it now only applies absent
  and `NULL` components
  ([\#480](https://github.com/tidyverse/purrr/issues/480)).

- `pluck<-`/[`assign_in()`](https://purrr.tidyverse.org/reference/modify_in.md)
  can now modify non-existing locations
  ([\#704](https://github.com/tidyverse/purrr/issues/704)).

#### Setting with NULL

- `pluck<-`/[`assign_in()`](https://purrr.tidyverse.org/reference/modify_in.md)
  now sets elements to `NULL` rather than removing them
  ([\#636](https://github.com/tidyverse/purrr/issues/636)). Now use the
  explicit [`zap()`](https://rlang.r-lib.org/reference/zap.html) if you
  want to remove elements.

- [`modify()`](https://purrr.tidyverse.org/reference/modify.md),
  [`modify2()`](https://purrr.tidyverse.org/reference/modify.md), and
  [`modify_if()`](https://purrr.tidyverse.org/reference/modify.md) now
  correctly handle `NULL`s in replacement values
  ([\#655](https://github.com/tidyverse/purrr/issues/655),
  [\#746](https://github.com/tidyverse/purrr/issues/746),
  [\#753](https://github.com/tidyverse/purrr/issues/753)).

- [`list_modify()`](https://purrr.tidyverse.org/reference/list_assign.md)’s
  interface has been standardised. Modifying with `NULL` now always
  creates a `NULL` in the output
  ([\#810](https://github.com/tidyverse/purrr/issues/810))

#### `list_` functions

- New
  [`list_assign()`](https://purrr.tidyverse.org/reference/list_assign.md)
  which is similar to
  [`list_modify()`](https://purrr.tidyverse.org/reference/list_assign.md)
  but doesn’t work recursively
  ([\#822](https://github.com/tidyverse/purrr/issues/822)).

- [`list_modify()`](https://purrr.tidyverse.org/reference/list_assign.md)
  no longer recurses into data frames (and other objects built on top of
  lists that are fundamentally non-list like)
  ([\#810](https://github.com/tidyverse/purrr/issues/810)). You can
  revert to the previous behaviour by setting `.is_node = is.list`.

### Minor improvements and bug fixes

- `capture_output()` correctly uses
  [`conditionMessage()`](https://rdrr.io/r/base/conditions.html) instead
  of directly interrogating the `message` field
  ([\#1010](https://github.com/tidyverse/purrr/issues/1010)).

- [`modify()`](https://purrr.tidyverse.org/reference/modify.md) no
  longer works with calls or pairlists.

- [`modify_depth()`](https://purrr.tidyverse.org/reference/map_depth.md)
  is no longer a generic. This makes it more consistent with
  [`map_depth()`](https://purrr.tidyverse.org/reference/map_depth.md).

- [`map_depth()`](https://purrr.tidyverse.org/reference/map_depth.md)
  and
  [`modify_depth()`](https://purrr.tidyverse.org/reference/map_depth.md)
  have a new `is_node` argument that allows you to control what counts
  as a level. The default uses
  [`vec_is_list()`](https://vctrs.r-lib.org/reference/vec_is_list.html)
  to avoid recursing into rich S3 objects like linear models or
  data.frames ([\#958](https://github.com/tidyverse/purrr/issues/958),
  [\#920](https://github.com/tidyverse/purrr/issues/920)).

- [`map_depth()`](https://purrr.tidyverse.org/reference/map_depth.md)
  and
  [`modify_depth()`](https://purrr.tidyverse.org/reference/map_depth.md)
  now correctly recurse at depth 1.

- [`as_mapper()`](https://purrr.tidyverse.org/reference/as_mapper.md) is
  now around twice as fast when used with character, integer, or list
  ([\#820](https://github.com/tidyverse/purrr/issues/820)).

- [`possibly()`](https://purrr.tidyverse.org/reference/possibly.md) now
  defaults `otherwise` to NULL.

- `modify_if(.else)` is now actually evaluated for atomic vectors
  ([@mgirlich](https://github.com/mgirlich),
  [\#701](https://github.com/tidyverse/purrr/issues/701)).

- [`lmap_if()`](https://purrr.tidyverse.org/reference/lmap.md) correctly
  handles `.else` functions
  ([\#847](https://github.com/tidyverse/purrr/issues/847)).

- [`every()`](https://purrr.tidyverse.org/reference/every.md) now
  correctly propagates missing values using the same rules as `&&`
  ([\#751](https://github.com/tidyverse/purrr/issues/751)). Internally,
  it has become a wrapper around `&&`. This makes it consistent with
  `&&` and also with
  [`some()`](https://purrr.tidyverse.org/reference/every.md) which has
  always been a wrapper around `||` with the same propagation rules.

- [`every()`](https://purrr.tidyverse.org/reference/every.md) and
  [`some()`](https://purrr.tidyverse.org/reference/every.md) now
  properly check the return value of their predicate function. It must
  now return a `TRUE`, `FALSE`, or `NA`.

- Greatly improved performance of functions created with
  [`partial()`](https://purrr.tidyverse.org/reference/partial.md)
  ([\#715](https://github.com/tidyverse/purrr/issues/715)). Their
  invocation is now as fast as for functions creating manually.

- [`partial()`](https://purrr.tidyverse.org/reference/partial.md) no
  longer inlines the function in the call stack. This fixes issues when
  [`partial()`](https://purrr.tidyverse.org/reference/partial.md) is
  used with [`lm()`](https://rdrr.io/r/stats/lm.html) for instance
  ([\#707](https://github.com/tidyverse/purrr/issues/707)).

## purrr 0.3.5

CRAN release: 2022-10-06

- Fixes for CRAN checks.

## purrr 0.3.4

CRAN release: 2020-04-17

- Fixed issue in
  [`list_modify()`](https://purrr.tidyverse.org/reference/list_assign.md)
  that prevented lists from being removed with
  [`zap()`](https://rlang.r-lib.org/reference/zap.html)
  ([@adamroyjones](https://github.com/adamroyjones),
  [\#777](https://github.com/tidyverse/purrr/issues/777)).

- Added documentation for exporting functions created with purrr adverb
  ([@njtierney](https://github.com/njtierney),
  [\#668](https://github.com/tidyverse/purrr/issues/668)). See
  `?faq-adverbs-export`.

- Added [`none()`](https://purrr.tidyverse.org/reference/every.md),
  which tests that a predicate is false for all elements (the opposite
  of [`every()`](https://purrr.tidyverse.org/reference/every.md))
  ([@AliciaSchep](https://github.com/AliciaSchep),
  [\#735](https://github.com/tidyverse/purrr/issues/735)).

## purrr 0.3.3

CRAN release: 2019-10-18

- Maintenance release.

- The documentation of
  [`map()`](https://purrr.tidyverse.org/reference/map.md) and its
  variants has been improved by [@surdina](https://github.com/surdina)
  as part of the Tidyverse Developer Day
  ([@surdina](https://github.com/surdina),
  [\#671](https://github.com/tidyverse/purrr/issues/671)).

- purrr now depends on R 3.2 or greater.

## purrr 0.3.2

CRAN release: 2019-03-15

- Fix protection issues reported by rchk.

## purrr 0.3.1

CRAN release: 2019-03-03

- [`reduce()`](https://purrr.tidyverse.org/reference/reduce.md) now
  forces arguments
  ([\#643](https://github.com/tidyverse/purrr/issues/643)).

- Fixed an issue in
  [`partial()`](https://purrr.tidyverse.org/reference/partial.md) with
  generic functions
  ([\#647](https://github.com/tidyverse/purrr/issues/647)).

- [`negate()`](https://purrr.tidyverse.org/reference/negate.md) now
  works with generic functions and functions with early returns.

- [`compose()`](https://purrr.tidyverse.org/reference/compose.md) now
  works with generic functions again
  ([\#629](https://github.com/tidyverse/purrr/issues/629),
  [\#639](https://github.com/tidyverse/purrr/issues/639)). Its set of
  unit tests was expanded to cover many edge cases.

- [`prepend()`](https://purrr.tidyverse.org/reference/prepend.md) now
  works with empty lists ([@czeildi](https://github.com/czeildi),
  [\#637](https://github.com/tidyverse/purrr/issues/637))

## purrr 0.3.0

CRAN release: 2019-01-27

### Breaking changes

- [`modify()`](https://purrr.tidyverse.org/reference/modify.md) and
  variants are now wrapping `[[<-` instead of `[<-`. This change
  increases the genericity of these functions but might cause different
  behaviour in some cases.

  For instance, the `[[<-` for data frames is stricter than the `[<-`
  method and might throw errors instead of warnings. This is the case
  when assigning a longer vector than the number of rows. `[<-`
  truncates the vector with a warning, `[[<-` fails with an error (as is
  appropriate).

- [`modify()`](https://purrr.tidyverse.org/reference/modify.md) and
  variants now return the same type as the input when the input is an
  atomic vector.

- All functionals taking predicate functions (like
  [`keep()`](https://purrr.tidyverse.org/reference/keep.md),
  [`detect()`](https://purrr.tidyverse.org/reference/detect.md),
  [`some()`](https://purrr.tidyverse.org/reference/every.md)) got
  stricter. Predicate functions must now return a single `TRUE` or
  `FALSE`.

  This change is meant to detect problems early with a more meaningful
  error message.

### Plucking

- New [`chuck()`](https://purrr.tidyverse.org/reference/chuck.md)
  function. This is a strict variant of
  [`pluck()`](https://purrr.tidyverse.org/reference/pluck.md) that
  throws errors when an element does not exist instead of returning
  `NULL` ([@daniel-barnett](https://github.com/daniel-barnett),
  [\#482](https://github.com/tidyverse/purrr/issues/482)).

- New
  [`assign_in()`](https://purrr.tidyverse.org/reference/modify_in.md)
  and `pluck<-` functions. They modify a data structure at an existing
  pluck location.

- New
  [`modify_in()`](https://purrr.tidyverse.org/reference/modify_in.md)
  function to map a function at a pluck location.

- [`pluck()`](https://purrr.tidyverse.org/reference/pluck.md) now
  dispatches properly with S3 vectors. The vector class must implement a
  [`length()`](https://rdrr.io/r/base/length.html) method for numeric
  indexing and a [`names()`](https://rdrr.io/r/base/names.html) method
  for string indexing.

- [`pluck()`](https://purrr.tidyverse.org/reference/pluck.md) now
  supports primitive functions
  ([\#404](https://github.com/tidyverse/purrr/issues/404)).

### Mapping

- New `.else` argument for
  [`map_if()`](https://purrr.tidyverse.org/reference/map_if.md) and
  [`modify_if()`](https://purrr.tidyverse.org/reference/modify.md). They
  take an alternative function that is mapped over elements of the input
  for which the predicate function returns `FALSE`
  ([\#324](https://github.com/tidyverse/purrr/issues/324)).

- [`reduce()`](https://purrr.tidyverse.org/reference/reduce.md),
  [`reduce2()`](https://purrr.tidyverse.org/reference/reduce.md),
  [`accumulate()`](https://purrr.tidyverse.org/reference/accumulate.md),
  and
  [`accumulate2()`](https://purrr.tidyverse.org/reference/accumulate.md)
  now terminate early when the function returns a value wrapped with
  [`done()`](https://rlang.r-lib.org/reference/done.html)
  ([\#253](https://github.com/tidyverse/purrr/issues/253)). When an
  empty [`done()`](https://rlang.r-lib.org/reference/done.html) is
  returned, the value at the last iteration is returned instead.

- Functions taking predicates
  ([`map_if()`](https://purrr.tidyverse.org/reference/map_if.md),
  [`keep()`](https://purrr.tidyverse.org/reference/keep.md),
  [`some()`](https://purrr.tidyverse.org/reference/every.md),
  [`every()`](https://purrr.tidyverse.org/reference/every.md),
  [`keep()`](https://purrr.tidyverse.org/reference/keep.md), etc) now
  fail with an informative message when the return value is not `TRUE`
  or `FALSE` ([\#470](https://github.com/tidyverse/purrr/issues/470)).

  This is a breaking change for
  [`every()`](https://purrr.tidyverse.org/reference/every.md) and
  [`some()`](https://purrr.tidyverse.org/reference/every.md) which were
  documented to be more liberal in the values they accepted as logical
  (any vector was considered `TRUE` if not a single `FALSE` value, no
  matter its length). These functions signal soft-deprecation warnings
  instead of a hard failure.

  Edit (purr 0.4.0):
  [`every()`](https://purrr.tidyverse.org/reference/every.md) and
  [`some()`](https://purrr.tidyverse.org/reference/every.md) never
  issued deprecation warnings because of a technical issue. We didn’t
  fix the warnings in the end, and using predicates returning `NA` is no
  longer considered deprecated. If you need to use
  [`every()`](https://purrr.tidyverse.org/reference/every.md) and
  [`some()`](https://purrr.tidyverse.org/reference/every.md) in contexts
  where `NA` propagation is unsafe, e.g. in `if ()` conditions, make
  sure to use safe predicate functions like `is_true()`.

- [`modify()`](https://purrr.tidyverse.org/reference/modify.md) and
  variants are now implemented using
  [`length()`](https://rdrr.io/r/base/length.html), `[[`, and `[[<-`
  methods. This implementation should be compatible with most vector
  classes.

- New [`modify2()`](https://purrr.tidyverse.org/reference/modify.md) and
  [`imodify()`](https://purrr.tidyverse.org/reference/modify.md)
  functions. These work like
  [`map()`](https://purrr.tidyverse.org/reference/map.md) and
  [`imap()`](https://purrr.tidyverse.org/reference/imap.md) but preserve
  the type of `.x` in the return value.

- [`pmap()`](https://purrr.tidyverse.org/reference/pmap.md) and
  [`pwalk()`](https://purrr.tidyverse.org/reference/pmap.md) now
  preserve class for inputs of `factor`, `Date`, `POSIXct` and other
  atomic S3 classes with an appropriate `[[` method
  ([\#358](https://github.com/tidyverse/purrr/issues/358),
  [@mikmart](https://github.com/mikmart)).

- [`modify()`](https://purrr.tidyverse.org/reference/modify.md),
  [`modify_if()`](https://purrr.tidyverse.org/reference/modify.md) and
  [`modify_at()`](https://purrr.tidyverse.org/reference/modify.md) now
  preserve the class of atomic vectors instead of promoting them to
  lists. New S3 methods are provided for character, logical, double, and
  integer classes ([@t-kalinowski](https://github.com/t-kalinowski),
  [\#417](https://github.com/tidyverse/purrr/issues/417)).

- By popular request, `at_depth()` has been brought back as
  [`map_depth()`](https://purrr.tidyverse.org/reference/map_depth.md).
  Like
  [`modify_depth()`](https://purrr.tidyverse.org/reference/map_depth.md),
  it applies a function at a specified level of a data structure.
  However, it transforms all traversed vectors up to `.depth` to bare
  lists ([\#381](https://github.com/tidyverse/purrr/issues/381)).

- [`map_at()`](https://purrr.tidyverse.org/reference/map_if.md),
  [`modify_at()`](https://purrr.tidyverse.org/reference/modify.md) and
  [`lmap_at()`](https://purrr.tidyverse.org/reference/lmap.md) accept
  negative values for `.at`, ignoring elements at those positions.

- [`map()`](https://purrr.tidyverse.org/reference/map.md) and
  [`modify()`](https://purrr.tidyverse.org/reference/modify.md) now work
  with calls and pairlists
  ([\#412](https://github.com/tidyverse/purrr/issues/412)).

- [`modify_depth()`](https://purrr.tidyverse.org/reference/map_depth.md)
  now modifies atomic leaves as well. This makes
  `modify_depth(x, 1, fn)` equivalent to `modify(x, fn)`
  ([\#359](https://github.com/tidyverse/purrr/issues/359)).

- New
  [`accumulate2()`](https://purrr.tidyverse.org/reference/accumulate.md)
  function which is to
  [`accumulate()`](https://purrr.tidyverse.org/reference/accumulate.md)
  what [`reduce2()`](https://purrr.tidyverse.org/reference/reduce.md) is
  to [`reduce()`](https://purrr.tidyverse.org/reference/reduce.md).

### Rates

- New
  [`rate_backoff()`](https://purrr.tidyverse.org/reference/rate-helpers.md)
  and
  [`rate_delay()`](https://purrr.tidyverse.org/reference/rate-helpers.md)
  functions to create rate objects. You can pass rates to
  [`insistently()`](https://purrr.tidyverse.org/reference/insistently.md),
  [`slowly()`](https://purrr.tidyverse.org/reference/slowly.md), or the
  lower level function
  [`rate_sleep()`](https://purrr.tidyverse.org/reference/rate_sleep.md).
  This will cause a function to wait for a given amount of time with
  exponential backoff (increasingly larger waiting times) or for a
  constant delay.

- `insistently(f)` modifies a function, `f`, so that it is repeatedly
  called until it succeeds
  ([@richierocks](https://github.com/richierocks),
  [@ijlyttle](https://github.com/ijlyttle)).

  [`slowly()`](https://purrr.tidyverse.org/reference/slowly.md) modifies
  a function so that it waits for a given amount of time between calls.

### `partial()`

The interface of
[`partial()`](https://purrr.tidyverse.org/reference/partial.md) has been
simplified. It now supports quasiquotation to control the timing of
evaluation, and the
[`rlang::call_modify()`](https://rlang.r-lib.org/reference/call_modify.html)
syntax to control the position of partialised arguments.

- [`partial()`](https://purrr.tidyverse.org/reference/partial.md) now
  supports empty `... =` argument to specify the position of future
  arguments, relative to partialised ones. This syntax is borrowed from
  (and implemented with)
  [`rlang::call_modify()`](https://rlang.r-lib.org/reference/call_modify.html).

  To prevent partial matching of `...` on `...f`, the latter has been
  renamed to `.f`, which is more consistent with other purrr function
  signatures.

- [`partial()`](https://purrr.tidyverse.org/reference/partial.md) now
  supports quasiquotation. When you unquote an argument, it is evaluated
  only once at function creation time. This is more flexible than the
  `.lazy` argument since you can control the timing of evaluation for
  each argument. Consequently, `.lazy` is soft-deprecated
  ([\#457](https://github.com/tidyverse/purrr/issues/457)).

- Fixed an infinite loop when partialised function is given the same
  name as the original function
  ([\#387](https://github.com/tidyverse/purrr/issues/387)).

- [`partial()`](https://purrr.tidyverse.org/reference/partial.md) now
  calls `as_closure()` on primitive functions to ensure argument
  matching ([\#360](https://github.com/tidyverse/purrr/issues/360)).

- The `.lazy` argument of
  [`partial()`](https://purrr.tidyverse.org/reference/partial.md) is
  soft-deprecated in favour of quasiquotation:

  ``` r
  # Before
  partial(fn, u = runif(1), n = rnorm(1), .lazy = FALSE)

  # After
  partial(fn, u = !!runif(1), n = !!rnorm(1))  # All constant
  partial(fn, u = !!runif(1), n = rnorm(1))    # First constant
  ```

### Minor improvements and fixes

- The tibble package is now in Suggests rather than Imports. This brings
  the hard dependency of purrr to just rlang and magrittr.

- [`compose()`](https://purrr.tidyverse.org/reference/compose.md) now
  returns an identity function when called without inputs.

- Functions created with
  [`compose()`](https://purrr.tidyverse.org/reference/compose.md) now
  have the same formal parameters as the first function to be called.
  They also feature a more informative print method that prints all
  composed functions in turn ([@egnha](https://github.com/egnha),
  [\#366](https://github.com/tidyverse/purrr/issues/366)).

- New `.dir` argument in
  [`compose()`](https://purrr.tidyverse.org/reference/compose.md). When
  set to `"forward"`, the functions are composed from left to right
  rather than right to left.

- [`list_modify()`](https://purrr.tidyverse.org/reference/list_assign.md)
  now supports the [`zap()`](https://rlang.r-lib.org/reference/zap.html)
  sentinel (reexported from rlang) to remove elements from lists.
  Consequently, removing elements with the ambiguous sentinel `NULL` is
  soft-deprecated.

- The requirements of
  [`list_modify()`](https://purrr.tidyverse.org/reference/list_assign.md)
  and
  [`list_merge()`](https://purrr.tidyverse.org/reference/list_assign.md)
  have been relaxed. Previously it required both the modified lists and
  the inputs to be either named or unnamed. This restriction now only
  applies to inputs in `...`. When inputs are all named, they are
  matched to the list by name. When they are all unnamed, they are
  matched positionally. Otherwise, this is an error.

- Fixed ordering of names returned by `accumulate_right()` output. They
  now correspond to the order of inputs.

- Fixed names of
  [`accumulate()`](https://purrr.tidyverse.org/reference/accumulate.md)
  output when `.init` is supplied.

- [`compose()`](https://purrr.tidyverse.org/reference/compose.md) now
  supports composition with lambdas
  ([@ColinFay](https://github.com/ColinFay),
  [\#556](https://github.com/tidyverse/purrr/issues/556))

- Fixed a [`pmap()`](https://purrr.tidyverse.org/reference/pmap.md)
  crash with empty lists on the Win32 platform
  ([\#565](https://github.com/tidyverse/purrr/issues/565)).

- `modify_depth` now has `.ragged` argument evaluates correctly to
  `TRUE` by default when `.depth < 0`
  ([@cderv](https://github.com/cderv),
  [\#530](https://github.com/tidyverse/purrr/issues/530)).

- [`accumulate()`](https://purrr.tidyverse.org/reference/accumulate.md)
  now inherits names from their first input
  ([@AshesITR](https://github.com/AshesITR),
  [\#446](https://github.com/tidyverse/purrr/issues/446)).

- [`attr_getter()`](https://purrr.tidyverse.org/reference/attr_getter.md)
  no longer uses partial matching. For example, if an `x` object has a
  `labels` attribute but no `label` attribute, `attr_getter("label")(x)`
  will no longer extract the `labels` attribute
  ([\#460](https://github.com/tidyverse/purrr/issues/460),
  [@huftis](https://github.com/huftis)).

- [`flatten_dfr()`](https://purrr.tidyverse.org/reference/flatten.md)
  and
  [`flatten_dfc()`](https://purrr.tidyverse.org/reference/flatten.md)
  now aborts if dplyr is not installed.
  ([\#454](https://github.com/tidyverse/purrr/issues/454))

- [`imap_dfr()`](https://purrr.tidyverse.org/reference/map_dfr.md) now
  works with `.id` argument is provided
  ([\#429](https://github.com/tidyverse/purrr/issues/429))

- [`list_modify()`](https://purrr.tidyverse.org/reference/list_assign.md),
  [`update_list()`](https://purrr.tidyverse.org/reference/update_list.md)
  and
  [`list_merge()`](https://purrr.tidyverse.org/reference/list_assign.md)
  now handle duplicate duplicate argument names correctly
  ([\#441](https://github.com/tidyverse/purrr/issues/441),
  [@mgirlich](https://github.com/mgirlich)).

- `map_raw`, `imap_raw`, `flatten_raw`, `invoke_map_raw`, `map2_raw` and
  `pmap_raw` added to support raw vectors.
  ([\#455](https://github.com/tidyverse/purrr/issues/455),
  [@romainfrancois](https://github.com/romainfrancois))

- [`flatten()`](https://purrr.tidyverse.org/reference/flatten.md) now
  supports raw and complex elements.

- [`array_branch()`](https://purrr.tidyverse.org/reference/array-coercion.md)
  and
  [`array_tree()`](https://purrr.tidyverse.org/reference/array-coercion.md)
  now retain the [`dimnames()`](https://rdrr.io/r/base/dimnames.html) of
  the input array
  ([\#584](https://github.com/tidyverse/purrr/issues/584),
  [@flying-sheep](https://github.com/flying-sheep))

- [`pluck()`](https://purrr.tidyverse.org/reference/pluck.md) no longer
  flattens lists of arguments. You can still do it manually with `!!!`.
  This change is for consistency with other dots-collecting functions of
  the tidyverse.

- [`map_at()`](https://purrr.tidyverse.org/reference/map_if.md),
  [`lmap_at()`](https://purrr.tidyverse.org/reference/lmap.md) and
  [`modify_at()`](https://purrr.tidyverse.org/reference/modify.md) now
  supports selection using
  [`vars()`](https://dplyr.tidyverse.org/reference/vars.html) and
  `tidyselect` ([@ColinFay](https://github.com/ColinFay),
  [\#608](https://github.com/tidyverse/purrr/issues/608)).

  Note that for now you need to import
  [`vars()`](https://dplyr.tidyverse.org/reference/vars.html) from dplyr
  or call it qualified like
  [`dplyr::vars()`](https://dplyr.tidyverse.org/reference/vars.html). It
  will be reexported from rlang in a future release.

- [`detect()`](https://purrr.tidyverse.org/reference/detect.md) now has
  a .default argument to specify the value returned when nothing is
  detected ([\#622](https://github.com/tidyverse/purrr/issues/622),
  [@ColinFay](https://github.com/ColinFay)).

### Life cycle

#### `.dir` arguments

We have standardised the purrr API for reverse iteration with a common
`.dir` argument.

- `reduce_right()` is soft-deprecated and replaced by a new `.dir`
  argument of
  [`reduce()`](https://purrr.tidyverse.org/reference/reduce.md):

  \`\`\`{r} \# Before: reduce_right(1:3, f)

  ## After:

  CRAN release: 2019-01-27

  reduce(1:3, f, .dir = “backward”)

      Note that the details of the computation have changed. Whereas
      `reduce_right()` computed `f(f(3, 2), 1)`, it now computes `f(1,
      f(2, 3))`. This is the standard way of reducing from the right.

      To produce the exact same reduction as `reduce_right()`, simply
      reverse your vector and use a left reduction:

      ```{r}
      # Before:
      reduce_right(1:3, f)

      # After:
      reduce(rev(1:3), f)

- `reduce2_right()` is soft-deprecated without replacement. It is not
  clear what algorithmic properties should a right reduction have in
  this case. Please reach out if you know about a use case for a right
  reduction with a ternary function.

- `accumulate_right()` is soft-deprecated and replaced by the new `.dir`
  argument of
  [`accumulate()`](https://purrr.tidyverse.org/reference/accumulate.md).
  Note that the algorithm has slightly changed: the accumulated value is
  passed to the right rather than the left, which is consistent with a
  right reduction.

  \`\`\`{r} \# Before: accumulate_right(1:3, f)

  ## After:

  CRAN release: 2019-01-27

  accumulate(1:3, f, .dir = “backward”) \`\`\`

- The `.right` argument of
  [`detect()`](https://purrr.tidyverse.org/reference/detect.md) and
  [`detect_index()`](https://purrr.tidyverse.org/reference/detect.md) is
  soft-deprecated and renamed to `.dir` for consistency with other
  functions and clarity of the interface.

  \`\`\`{r} \# Before detect(x, f, .right = TRUE)

  ## After

  CRAN release: 2019-01-27

  detect(x, f, .dir = “backward”) \`\`\`

#### Simplification of `partial()`

The interface of
[`partial()`](https://purrr.tidyverse.org/reference/partial.md) has been
simplified (see more about
[`partial()`](https://purrr.tidyverse.org/reference/partial.md) below):

- The `.lazy` argument of
  [`partial()`](https://purrr.tidyverse.org/reference/partial.md) is
  soft-deprecated in favour of quasiquotation.

- We had to rename `...f` to `.f` in
  [`partial()`](https://purrr.tidyverse.org/reference/partial.md) in
  order to support `... =` argument (which would otherwise partial-match
  on `...f`). This also makes
  [`partial()`](https://purrr.tidyverse.org/reference/partial.md) more
  consistent with other purrr function signatures.

#### Retirement of `invoke()`

[`invoke()`](https://purrr.tidyverse.org/reference/invoke.md) and
[`invoke_map()`](https://purrr.tidyverse.org/reference/invoke.md) are
retired in favour of
[`exec()`](https://rlang.r-lib.org/reference/exec.html). Note that
retired functions are no longer under active development, but continue
to be maintained undefinitely in the package.

- [`invoke()`](https://purrr.tidyverse.org/reference/invoke.md) is
  retired in favour of the
  [`exec()`](https://rlang.r-lib.org/reference/exec.html) function,
  reexported from rlang.
  [`exec()`](https://rlang.r-lib.org/reference/exec.html) evaluates a
  function call built from its inputs and supports tidy dots:

  ``` r
  # Before:
  invoke(mean, list(na.rm = TRUE), x = 1:10)

  # After
  exec(mean, 1:10, !!!list(na.rm = TRUE))
  ```

  Note that retired functions are not removed from the package and will
  be maintained undefinitely.

- [`invoke_map()`](https://purrr.tidyverse.org/reference/invoke.md) is
  retired without replacement because it is more complex to understand
  than the corresponding code using
  [`map()`](https://purrr.tidyverse.org/reference/map.md),
  [`map2()`](https://purrr.tidyverse.org/reference/map2.md) and
  [`exec()`](https://rlang.r-lib.org/reference/exec.html):

  ``` r
  # Before:
  invoke_map(fns, list(args))
  invoke_map(fns, list(args1, args2))

  # After:
  map(fns, exec, !!!args)
  map2(fns, list(args1, args2), function(fn, args) exec(fn, !!!args))
  ```

#### Other lifecycle changes

- `%@%` is soft-deprecated, please use the operator exported in rlang
  instead. The latter features an interface more consistent with `@` as
  it uses NSE, supports S4 fields, and has an assignment variant.

- Removing elements from lists using `NULL` in
  [`list_modify()`](https://purrr.tidyverse.org/reference/list_assign.md)
  is soft-deprecated. Please use the new
  [`zap()`](https://rlang.r-lib.org/reference/zap.html) sentinel
  reexported from rlang instead:

  \`\`\`{r} \# Before: list_modify(x, foo = NULL)

  \# After: list_modify(x, foo = zap()) \`\`\`

  This change is motivated by the ambiguity of `NULL` as a deletion
  sentinel because `NULL` is also a valid value in lists. In the future,
  `NULL` will set an element to `NULL` rather than removing the element.

- [`rerun()`](https://purrr.tidyverse.org/reference/rerun.md) is now in
  the questioning stage because we are no longer convinced NSE functions
  are a good fit for purrr. Also, `rerun(n, x)` can just as easily be
  expressed as `map(1:n, ~ x)` (with the added benefit of being passed
  the current index as argument to the lambda).

- `map_call()` is defunct.

## purrr 0.2.5

CRAN release: 2018-05-29

- This is a maintenance release following the release of dplyr 0.7.5.

## purrr 0.2.4

CRAN release: 2017-10-18

- Fixes for R 3.1.

## purrr 0.2.3

CRAN release: 2017-08-02

### Breaking changes

We noticed the following issues during reverse dependencies checks:

- If [`reduce()`](https://purrr.tidyverse.org/reference/reduce.md) fails
  with this message:
  `` Error: `.x` is empty, and no `.init` supplied ``, this is because
  [`reduce()`](https://purrr.tidyverse.org/reference/reduce.md) now
  returns `.init` when `.x` is empty. Fix the problem by supplying an
  appropriate argument to `.init`, or by providing special behaviour
  when `.x` has length 0.

- The type predicates have been migrated to rlang. Consequently the
  `bare-type-predicates` documentation topic is no longer in purrr,
  which might cause a warning if you cross-reference it.

### Dependencies

purrr no longer depends on lazyeval or Rcpp (or dplyr, as of the
previous version). This makes the dependency graph of the tidyverse
simpler, and makes purrr more suitable as a dependency of lower-level
packages.

There have also been two changes to eliminate name conflicts between
purrr and dplyr:

- [`order_by()`](https://dplyr.tidyverse.org/reference/order_by.html),
  [`sort_by()`](https://rdrr.io/r/base/sort_by.html) and `split_by()`
  have been removed.
  [`order_by()`](https://dplyr.tidyverse.org/reference/order_by.html)
  conflicted with
  [`dplyr::order_by()`](https://dplyr.tidyverse.org/reference/order_by.html)
  and the complete family doesn’t feel that useful. Use tibbles instead
  ([\#217](https://github.com/tidyverse/purrr/issues/217)).

- [`contains()`](https://tidyselect.r-lib.org/reference/starts_with.html)
  has been renamed to
  [`has_element()`](https://purrr.tidyverse.org/reference/has_element.md)
  to avoid conflicts with dplyr
  ([\#217](https://github.com/tidyverse/purrr/issues/217)).

### pluck()

The plucking mechanism used for indexing into data structures with
[`map()`](https://purrr.tidyverse.org/reference/map.md) has been
extracted into the function
[`pluck()`](https://purrr.tidyverse.org/reference/pluck.md). Plucking is
often more readable to extract an element buried in a deep data
structure. Compare this syntax-heavy extraction which reads
non-linearly:

    accessor(x[[1]])$foo

to the equivalent pluck:

    x |> pluck(1, accessor, "foo")

### Map helpers

- `as_function()` is now
  [`as_mapper()`](https://purrr.tidyverse.org/reference/as_mapper.md)
  because it is a tranformation that makes sense primarily for mapping
  functions, not in general
  ([\#298](https://github.com/tidyverse/purrr/issues/298)). `.null` has
  been renamed to `.default` to better reflect its intent
  ([\#298](https://github.com/tidyverse/purrr/issues/298)). `.default`
  is returned whenever an element is absent or empty
  ([\#231](https://github.com/tidyverse/purrr/issues/231),
  [\#254](https://github.com/tidyverse/purrr/issues/254)).

  [`as_mapper()`](https://purrr.tidyverse.org/reference/as_mapper.md)
  sanitises primitive functions by transforming them to closures with
  standardised argument names (using
  [`rlang::as_closure()`](https://rlang.r-lib.org/reference/as_closure.html)).
  For instance `+` is transformed to `function(.x, .y) .x + .y`. This
  results in proper argument matching so that
  `map(1:10, partial(`-`, .x = 5))` produces `list(5 - 1, 5 - 2, ...)`.

- Recursive indexing can now extract objects out of environments
  ([\#213](https://github.com/tidyverse/purrr/issues/213)) and S4
  objects ([\#200](https://github.com/tidyverse/purrr/issues/200)), as
  well as lists.

- [`attr_getter()`](https://purrr.tidyverse.org/reference/attr_getter.md)
  makes it possible to extract from attributes like
  `map(list(iris, mtcars), attr_getter("row.names"))`.

- The argument list for formula-functions has been tweaked so that you
  can refer to arguments by position with `..1`, `..2`, and so on. This
  makes it possible to use the formula shorthand for functions with more
  than two arguments
  ([\#289](https://github.com/tidyverse/purrr/issues/289)).

- [`possibly()`](https://purrr.tidyverse.org/reference/possibly.md),
  [`safely()`](https://purrr.tidyverse.org/reference/safely.md) and
  friends no longer capture interrupts: this means that you can now
  terminate a mapper using one of these with Escape or Ctrl + C
  ([\#314](https://github.com/tidyverse/purrr/issues/314))

### Map functions

- All map functions now treat `NULL` the same way as an empty vector
  ([\#199](https://github.com/tidyverse/purrr/issues/199)), and return
  an empty vector if any input is an empty vector.

- All [`map()`](https://purrr.tidyverse.org/reference/map.md) functions
  now force their arguments in the same way that base R does for
  [`lapply()`](https://rdrr.io/r/base/lapply.html)
  ([\#191](https://github.com/tidyverse/purrr/issues/191)). This makes
  [`map()`](https://purrr.tidyverse.org/reference/map.md) etc easier to
  use when generating functions.

- A new family of “indexed” map functions,
  [`imap()`](https://purrr.tidyverse.org/reference/imap.md),
  [`imap_lgl()`](https://purrr.tidyverse.org/reference/imap.md) etc,
  provide a short-hand for `map2(x, names(x))` or
  `map2(x, seq_along(x))`
  ([\#240](https://github.com/tidyverse/purrr/issues/240)).

- The data frame suffix `_df` has been (soft) deprecated in favour of
  `_dfr` to more clearly indicate that it’s a row-bind. All variants now
  also have a `_dfc` for column binding
  ([\#167](https://github.com/tidyverse/purrr/issues/167)). (These will
  not be terribly useful until
  [`dplyr::bind_rows()`](https://dplyr.tidyverse.org/reference/bind_rows.html)/[`dplyr::bind_cols()`](https://dplyr.tidyverse.org/reference/bind_cols.html)
  have better semantics for vectors.)

### Modify functions

A new [`modify()`](https://purrr.tidyverse.org/reference/modify.md)
family returns the same output of the type as the input `.x`. This is in
contrast to the [`map()`](https://purrr.tidyverse.org/reference/map.md)
family which always returns a list, regardless of the input type.

The modify functions are S3 generics. However their default methods
should be sufficient for most classes since they rely on the semantics
of `[<-`. `modify.default()` is thus a shorthand for `x[] <- map(x, f)`.

- `at_depth()` has been renamed to
  [`modify_depth()`](https://purrr.tidyverse.org/reference/map_depth.md).

- [`modify_depth()`](https://purrr.tidyverse.org/reference/map_depth.md)
  gains new `.ragged` argument, and negative depths are now computed
  relative to the deepest component of the list
  ([\#236](https://github.com/tidyverse/purrr/issues/236)).

### New functions

- `auto_browse(f)` returns a new function that automatically calls
  [`browser()`](https://rdrr.io/r/base/browser.html) if `f` throws an
  error ([\#281](https://github.com/tidyverse/purrr/issues/281)).

- [`vec_depth()`](https://purrr.tidyverse.org/reference/pluck_depth.md)
  computes the depth (i.e. the number of levels of indexing) or a vector
  ([\#243](https://github.com/tidyverse/purrr/issues/243)).

- [`reduce2()`](https://purrr.tidyverse.org/reference/reduce.md) and
  `reduce2_right()` make it possible to reduce with a 3 argument
  function where the first argument is the accumulated value, the second
  argument is `.x`, and the third argument is `.y`
  ([\#163](https://github.com/tidyverse/purrr/issues/163)).

- [`list_modify()`](https://purrr.tidyverse.org/reference/list_assign.md)
  extends `stats::modifyList()` to replace by position if the list is
  not named.([\#201](https://github.com/tidyverse/purrr/issues/201)).
  [`list_merge()`](https://purrr.tidyverse.org/reference/list_assign.md)
  operates similarly to
  [`list_modify()`](https://purrr.tidyverse.org/reference/list_assign.md)
  but combines instead of replacing
  ([\#322](https://github.com/tidyverse/purrr/issues/322)).

- The legacy function
  [`update_list()`](https://purrr.tidyverse.org/reference/update_list.md)
  is basically a version of `list_modify` that evaluates formulas within
  the list. It is likely to be deprecated in the future in favour of a
  tidyeval interface such as a list method for
  [`dplyr::mutate()`](https://dplyr.tidyverse.org/reference/mutate.html).

### Minor improvements and bug fixes

- Thanks to [@dchiu911](https://github.com/dchiu911), the unit test
  coverage of purrr is now much greater.

- All predicate functions are re-exported from rlang
  ([\#124](https://github.com/tidyverse/purrr/issues/124)).

- [`compact()`](https://purrr.tidyverse.org/reference/keep.md) now works
  with standard mapper conventions
  ([\#282](https://github.com/tidyverse/purrr/issues/282)).

- `cross_n()` has been renamed to
  [`cross()`](https://purrr.tidyverse.org/reference/cross.md). The `_n`
  suffix was removed for consistency with
  [`pmap()`](https://purrr.tidyverse.org/reference/pmap.md) (originally
  called `map_n()` at the start of the project) and
  [`transpose()`](https://purrr.tidyverse.org/reference/transpose.md)
  (originally called `zip_n()`). Similarly, `cross_d()` has been renamed
  to [`cross_df()`](https://purrr.tidyverse.org/reference/cross.md) for
  consistency with
  [`map_df()`](https://purrr.tidyverse.org/reference/map_dfr.md).

- [`every()`](https://purrr.tidyverse.org/reference/every.md) and
  [`some()`](https://purrr.tidyverse.org/reference/every.md) now return
  `NA` if present in the input
  ([\#174](https://github.com/tidyverse/purrr/issues/174)).

- [`invoke()`](https://purrr.tidyverse.org/reference/invoke.md) uses a
  more robust approach to generate the argument list
  ([\#249](https://github.com/tidyverse/purrr/issues/249)) It no longer
  uses lazyeval to figure out which enviroment a character `f` comes
  from.

- `is_numeric()` and `is_scalar_numeric()` are deprecated because they
  don’t test for what you might expect at first sight.

- [`reduce()`](https://purrr.tidyverse.org/reference/reduce.md) now
  throws an error if `.x` is empty and `.init` is not supplied.

- Deprecated functions `flatmap()`, `map3()`, `map_n()`, `walk3()`,
  `walk_n()`, `zip2()`, `zip3()`, `zip_n()` have been removed.

- [`pmap()`](https://purrr.tidyverse.org/reference/pmap.md) coerces data
  frames to lists to avoid the expensive `[.data.frame` which provides
  security that is unneeded here
  ([\#220](https://github.com/tidyverse/purrr/issues/220)).

- [`rdunif()`](https://purrr.tidyverse.org/reference/rdunif.md) checks
  its inputs for validity
  ([\#211](https://github.com/tidyverse/purrr/issues/211)).

- [`set_names()`](https://rlang.r-lib.org/reference/set_names.html) can
  now take a function to tranform the names programmatically
  ([\#276](https://github.com/tidyverse/purrr/issues/276)), and you can
  supply names in `...` to reduce typing even more more
  ([\#316](https://github.com/tidyverse/purrr/issues/316)).
  [`set_names()`](https://rlang.r-lib.org/reference/set_names.html) is
  now powered by
  [`rlang::set_names()`](https://rlang.r-lib.org/reference/set_names.html).

- [`safely()`](https://purrr.tidyverse.org/reference/safely.md) now
  actually uses the `quiet` argument
  ([\#296](https://github.com/tidyverse/purrr/issues/296)).

- [`transpose()`](https://purrr.tidyverse.org/reference/transpose.md)
  now matches by name if available
  ([\#164](https://github.com/tidyverse/purrr/issues/164)). You can
  override the default choice with the new `.names` argument.

- The function argument of
  [`detect()`](https://purrr.tidyverse.org/reference/detect.md) and
  [`detect_index()`](https://purrr.tidyverse.org/reference/detect.md)
  have been renamed from `.p` to `.f`. This is because they have mapper
  semantics rather than predicate semantics.

## purrr 0.2.2.1

This is a compatibility release with dplyr 0.6.0.

- All data-frame based mappers have been removed in favour of new
  functions and idioms in the tidyverse. `dmap()`, `dmap_at()`,
  `dmap_if()`, `invoke_rows()`, `slice_rows()`, `map_rows()`,
  `by_slice()`, `by_row()`, and `unslice()` have been moved to purrrlyr.
  This is a bit of an aggresive change but it allows us to make the
  dependencies much lighter.

## purrr 0.2.2

CRAN release: 2016-06-18

- Fix for dev tibble support.

- `as_function()` now supports list arguments which allow recursive
  indexing using either names or positions. They now always stop when
  encountering the first NULL
  ([\#173](https://github.com/tidyverse/purrr/issues/173)).

- `accumulate` and `reduce` correctly pass extra arguments to the worker
  function.

## purrr 0.2.1

CRAN release: 2016-02-13

- `as_function()` gains a `.null` argument that for character and
  numeric values allows you to specify what to return for null/absent
  elements ([\#110](https://github.com/tidyverse/purrr/issues/110)).
  This can be used with any map function,
  e.g. `map_int(x, 1, .null = NA)`

- `as_function()` is now generic.

- New
  [`is_function()`](https://rlang.r-lib.org/reference/is_function.html)
  that returns `TRUE` only for regular functions.

- Fix crash on GCC triggered by `invoke_rows()`.

## purrr 0.2.0

CRAN release: 2016-01-04

### New functions

- There are two handy infix functions:

  - `x %||% y` is shorthand for `if (is.null(x)) y else x`
    ([\#109](https://github.com/tidyverse/purrr/issues/109)).
  - `x %@% "a"` is shorthand for `attr(x, "a", exact = TRUE)`
    ([\#69](https://github.com/tidyverse/purrr/issues/69)).

- [`accumulate()`](https://purrr.tidyverse.org/reference/accumulate.md)
  has been added to handle recursive folding. It is shortand for
  `Reduce(f, .x, accumulate = TRUE)` and follows a similar syntax to
  [`reduce()`](https://purrr.tidyverse.org/reference/reduce.md)
  ([\#145](https://github.com/tidyverse/purrr/issues/145)). A right-hand
  version `accumulate_right()` was also added.

- [`map_df()`](https://purrr.tidyverse.org/reference/map_dfr.md)
  row-binds output together. It’s the equivalent of `plyr::ldply()`
  ([\#127](https://github.com/tidyverse/purrr/issues/127))

- [`flatten()`](https://purrr.tidyverse.org/reference/flatten.md) is now
  type-stable and always returns a list. To return a simpler vector, use
  [`flatten_lgl()`](https://purrr.tidyverse.org/reference/flatten.md),
  [`flatten_int()`](https://purrr.tidyverse.org/reference/flatten.md),
  [`flatten_dbl()`](https://purrr.tidyverse.org/reference/flatten.md),
  [`flatten_chr()`](https://purrr.tidyverse.org/reference/flatten.md),
  or [`flatten_df()`](https://purrr.tidyverse.org/reference/flatten.md).

- [`invoke()`](https://purrr.tidyverse.org/reference/invoke.md) has been
  overhauled to be more useful: it now works similarly to `map_call()`
  when `.x` is NULL, and hence `map_call()` has been deprecated.
  [`invoke_map()`](https://purrr.tidyverse.org/reference/invoke.md) is a
  vectorised complement to
  [`invoke()`](https://purrr.tidyverse.org/reference/invoke.md)
  ([\#125](https://github.com/tidyverse/purrr/issues/125)), and comes
  with typed variants
  [`invoke_map_lgl()`](https://purrr.tidyverse.org/reference/invoke.md),
  [`invoke_map_int()`](https://purrr.tidyverse.org/reference/invoke.md),
  [`invoke_map_dbl()`](https://purrr.tidyverse.org/reference/invoke.md),
  [`invoke_map_chr()`](https://purrr.tidyverse.org/reference/invoke.md),
  and
  [`invoke_map_df()`](https://purrr.tidyverse.org/reference/invoke.md).

- [`transpose()`](https://purrr.tidyverse.org/reference/transpose.md)
  replaces `zip2()`, `zip3()`, and `zip_n()`
  ([\#128](https://github.com/tidyverse/purrr/issues/128)). The name
  more clearly reflects the intent (transposing the first and second
  levels of list). It no longer has fields argument or the `.simplify`
  argument; instead use the new
  [`simplify_all()`](https://purrr.tidyverse.org/reference/as_vector.md)
  function.

- [`safely()`](https://purrr.tidyverse.org/reference/safely.md),
  [`quietly()`](https://purrr.tidyverse.org/reference/quietly.md), and
  [`possibly()`](https://purrr.tidyverse.org/reference/possibly.md) are
  experimental functions for working with functions with side-effects
  (e.g. printed output, messages, warnings, and errors)
  ([\#120](https://github.com/tidyverse/purrr/issues/120)).
  [`safely()`](https://purrr.tidyverse.org/reference/safely.md) is a
  version of [`try()`](https://rdrr.io/r/base/try.html) that modifies a
  function (rather than an expression), and always returns a list with
  two components, `result` and `error`.

- [`list_along()`](https://purrr.tidyverse.org/reference/along.md) and
  [`rep_along()`](https://rlang.r-lib.org/reference/rep_along.html)
  generalise the idea of
  [`seq_along()`](https://rdrr.io/r/base/seq.html).
  ([\#122](https://github.com/tidyverse/purrr/issues/122)).

- `is_null()` is the snake-case version of
  [`is.null()`](https://rdrr.io/r/base/NULL.html).

- [`pmap()`](https://purrr.tidyverse.org/reference/pmap.md) (parallel
  map) replaces `map_n()`
  ([\#132](https://github.com/tidyverse/purrr/issues/132)), and has
  typed-variants suffixed
  [`pmap_lgl()`](https://purrr.tidyverse.org/reference/pmap.md),
  [`pmap_int()`](https://purrr.tidyverse.org/reference/pmap.md),
  [`pmap_dbl()`](https://purrr.tidyverse.org/reference/pmap.md),
  [`pmap_chr()`](https://purrr.tidyverse.org/reference/pmap.md), and
  [`pmap_df()`](https://purrr.tidyverse.org/reference/map_dfr.md).

- [`set_names()`](https://rlang.r-lib.org/reference/set_names.html) is a
  snake-case alternative to
  [`setNames()`](https://rdrr.io/r/stats/setNames.html) with stricter
  equality checking, and more convenient defaults for pipes:
  `x |> set_names()` is equivalent to `setNames(x, x)`
  ([\#119](https://github.com/tidyverse/purrr/issues/119)).

### Row based functionals

We are still figuring out what belongs in dplyr and what belongs in
purrr. Expect much experimentation and many changes with these
functions.

- [`map()`](https://purrr.tidyverse.org/reference/map.md) now always
  returns a list. Data frame support has been moved to
  [`map_df()`](https://purrr.tidyverse.org/reference/map_dfr.md) and
  `dmap()`. The latter supports sliced data frames as a shortcut for the
  combination of `by_slice()` and `dmap()`:
  `x |> by_slice(dmap, fun, .collate = "rows")`. The conditional
  variants `dmap_at()` and `dmap_if()` also support sliced data frames
  and will recycle scalar results to the slice size.

- `map_rows()` has been renamed to `invoke_rows()`. As other rows-based
  functionals, it collates results inside lists by default, but with
  column collation this function is equivalent to `plyr::mdply()`.

- The rows-based functionals gain a `.to` option to name the output
  column as well as a `.collate` argument. The latter allows to collate
  the output in lists (by default), on columns or on rows. This makes
  these functions more flexible and more predictable.

### Bug fixes and minor changes

- `as_function()`, which converts formulas etc to functions, is now
  exported ([\#123](https://github.com/tidyverse/purrr/issues/123)).

- [`rerun()`](https://purrr.tidyverse.org/reference/rerun.md) is
  correctly scoped
  ([\#95](https://github.com/tidyverse/purrr/issues/95))

- [`update_list()`](https://purrr.tidyverse.org/reference/update_list.md)
  can now modify an element called `x`
  ([\#98](https://github.com/tidyverse/purrr/issues/98)).

- `map*()` now use custom C code, rather than relying on
  [`lapply()`](https://rdrr.io/r/base/lapply.html),
  [`mapply()`](https://rdrr.io/r/base/mapply.html) etc. The performance
  characteristcs are very similar, but it allows us greater control over
  the output ([\#118](https://github.com/tidyverse/purrr/issues/118)).

- [`map_lgl()`](https://purrr.tidyverse.org/reference/map.md) now has
  second argument `.f`, not `.p`
  ([\#134](https://github.com/tidyverse/purrr/issues/134)).

### Deprecated functions

- `flatmap()` -\> use
  [`map()`](https://purrr.tidyverse.org/reference/map.md) followed by
  the appropriate
  [`flatten()`](https://purrr.tidyverse.org/reference/flatten.md).

- `map_call()` -\>
  [`invoke()`](https://purrr.tidyverse.org/reference/invoke.md).

- `map_n()` -\>
  [`pmap()`](https://purrr.tidyverse.org/reference/pmap.md); `walk_n()`
  -\> [`pwalk()`](https://purrr.tidyverse.org/reference/pmap.md).

- `map3(x, y, z)` -\> `map_n(list(x, y, z))`;
  `walk3(x, y, z) ->`pwalk(list(x, y, z))\`
