# Parallelization in purrr

**\[experimental\]**

All map functions allow parallelized operation using
[mirai](https://CRAN.R-project.org/package=mirai).

Wrap functions passed to the `.f` argument of
[`map()`](https://purrr.tidyverse.org/dev/reference/map.md) and its
variants with `in_parallel()`.

`in_parallel()` is a purrr adverb that plays two roles:

- It is a signal to purrr verbs like
  [`map()`](https://purrr.tidyverse.org/dev/reference/map.md) to go
  ahead and perform computations in parallel.

- It helps you create self-contained functions that are isolated from
  your workspace. This is important because the function is packaged up
  (serialized) to be sent across to parallel processes. Isolation is
  critical for performance because it prevents accidentally sending very
  large objects between processes.

For maps to actually be performed in parallel, the user must also set
[`mirai::daemons()`](https://mirai.r-lib.org/reference/daemons.html),
otherwise they fall back to sequential processing.
[`mirai::require_daemons()`](https://mirai.r-lib.org/reference/require_daemons.html)
may be used to enforce the use of parallel processing. See the section
'Daemons settings' below.

## Usage

``` r
in_parallel(.f, ...)
```

## Arguments

- .f:

  A fresh formula or function. "Fresh" here means that they should be
  declared in the call to `in_parallel()`.

- ...:

  Named arguments to declare in the environment of the function.

## Value

A 'crate' (classed function).

## Creating self-contained functions

- They should call package functions with an explicit `::` namespace.
  For instance `ggplot()` from the ggplot2 package must be called with
  its namespace prefix: `ggplot2::ggplot()`. An alternative is to use
  [`library()`](https://rdrr.io/r/base/library.html) within the function
  to attach a package to the search path, which allows subsequent use of
  package functions without the explicit namespace.

- They should declare any data they depend on. Declare data by supplying
  named arguments to `...`. When `.f` is an anonymous function to a
  locally-defined function of the form `\(x) fun(x)`, `fun` itself must
  be supplied to `...` in the manner of:
  `in_parallel(\(x) fun(x), fun = fun)`.

- Functions (closures) supplied to `...` must themselves be
  self-contained, as they are modified to share the same closure as the
  main function. This means that all helper functions and other required
  variables must also be supplied as further `...` arguments. This
  applies only for functions directly supplied to `...`, and containers
  such as lists are not recursively walked to find functions (meaning
  you're at risk of unexpectedly including large objects with your
  parallel function if you supply complex lists).

`in_parallel()` is a simple wrapper of
[`carrier::crate()`](https://rdrr.io/pkg/carrier/man/crate.html) and you
may refer to that package for more details.

Example usage:

    # The function needs to be freshly-defined, so instead of:
    mtcars |> map_dbl(in_parallel(sum))
    # Use an anonymous function:
    mtcars |> map_dbl(in_parallel(\(x) sum(x)))

    # Package functions need to be explicitly namespaced, so instead of:
    map(1:3, in_parallel(\(x) vec_init(integer(), x)))
    # Use :: to namespace all package functions:
    map(1:3, in_parallel(\(x) vctrs::vec_init(integer(), x)))

    fun <- function(x) { param + helper(x) }
    helper <- function(x) { x %% 2 }
    param <- 5
    # Operating in parallel, locally-defined functions, including helper
    # functions and other objects required by it, will not be found:
    map(1:3, in_parallel(\(x) fun(x)))
    # Use the ... argument to supply these objects:
    map(1:3, in_parallel(\(x) fun(x), fun = fun, helper = helper, param = param))

## When to use

Parallelizing a map using 'n' processes does not automatically lead to
it taking 1/n of the time. Additional overhead from setting up the
parallel task and communicating with parallel processes eats into this
benefit, and can outweigh it for very short tasks or those involving
large amounts of data.

The threshold at which parallelization becomes clearly beneficial will
differ according to your individual setup and task, but a rough guide
would be in the order of 100 microseconds to 1 millisecond for each map
iteration.

## Daemons settings

How and where parallelization occurs is determined by
[`mirai::daemons()`](https://mirai.r-lib.org/reference/daemons.html).
This is a function from the mirai package that sets up daemons
(persistent background processes that receive parallel computations) on
your local machine or across the network.

Daemons must be set prior to performing any parallel map operation,
otherwise `in_parallel()` will fall back to sequential processing. To
ensure that maps are always performed in parallel, place
[`mirai::require_daemons()`](https://mirai.r-lib.org/reference/require_daemons.html)
before the map.

It is usual to set daemons once per session. You can leave them running
on your local machine as they consume almost no resources whilst waiting
to receive tasks. The following sets up 6 daemons locally:

    mirai::daemons(6)

Function arguments:

- `n`: the number of daemons to launch on your local machine, e.g.
  `mirai::daemons(6)`. As a rule of thumb, for maximum efficiency this
  should be (at most) one less than the number of cores on your machine,
  leaving one core for the main R process.

- `url` and `remote`: used to set up and launch daemons for distributed
  computing over the network. See
  [`mirai::daemons()`](https://mirai.r-lib.org/reference/daemons.html)
  documentation for more details.

Resetting daemons:

Daemons persist for the duration of your session. To reset and tear down
any existing daemons:

    mirai::daemons(0)

All daemons automatically terminate when your session ends. You do not
need to explicitly terminate daemons in this instance, although it is
still good practice to do so.

Note: if you are using parallel map within a package, do not make any
[`mirai::daemons()`](https://mirai.r-lib.org/reference/daemons.html)
calls within the package. This is as it should always be up to the user
how they wish to set up parallel processing: (i) resources are only
known at run-time e.g. availability of local or remote daemons, (ii)
packages should make use of existing daemons when already set, rather
than reset them, and (iii) it helps prevent inadvertently spawning too
many daemons when functions are used recursively within each other.

## References

purrr's parallelization is powered by
[mirai](https://CRAN.R-project.org/package=mirai). See the [mirai
website](https://mirai.r-lib.org/) for more details.

## See also

[`map()`](https://purrr.tidyverse.org/dev/reference/map.md) for usage
examples.

## Examples

``` r
if (FALSE) { # interactive() && rlang::is_installed("mirai") && rlang::is_installed("carrier")
# Run in interactive sessions only as spawns additional processes

default_param <- 0.5

delay <- function(secs = default_param) {
  Sys.sleep(secs)
}

slow_lm <- function(formula, data) {
  delay()
  lm(formula, data)
}

# Example of a 'crate' returned by in_parallel(). The object print method
# shows the size of the crate and any objects contained within:
crate <- in_parallel(
  \(df) slow_lm(mpg ~ disp, data = df),
  slow_lm = slow_lm,
  delay = delay,
  default_param = default_param
)
crate

# Use mirai::mirai() to test that a crate is self-contained
# by running it in a daemon and collecting its return value:
mirai::mirai(crate(mtcars), crate = crate) |> mirai::collect_mirai()
}
```
