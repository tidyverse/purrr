#' Parallelization in purrr
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#' All map functions allow parallelized operation using \CRANpkg{mirai}. To take
#' advantage of this, wrap a function that is passed to the `.f` argument of
#' [map()] or any of its variants with [in_parallel()]. This declares that the
#' computation should proceed in parallel utilizing multiple cores on your local
#' machine, or distributed over the network.
#'
#' @param .f A fresh formula or function. "Fresh" here means that they should be
#'   declared in the call to [in_parallel()].
#' @param ... Arguments to declare in the environment of the function.
#'
#' @section How to Use:
#'
#' Wrapping a function that is passed to the `.f` argument in [map()] or any of
#' its variants with [in_parallel()] declares that the map should be performed
#' in parallel.
#'
#' Under the hood, [in_parallel()] provides a systematic way of making `.f`
#' self-contained so that it can be readily shared with other parallel
#' processes. It ensures that everything needed by the function is serialized
#' along with it, but not other objects which happen to be in the function's
#' enclosing environment. This helps to prevent inadvertently shipping large
#' data objects when they may not be needed.
#'
#' To create self-contained functions:
#'
#' * They should call package functions with an explicit `::` namespace. This
#'   includes packages in the default search path, with the exception of the
#'   base package. For instance `var()` from the stats package must be called
#'   with its namespace prefix: `stats::var(x)`.
#'
#' * They should declare any data they depend on. You can declare data by
#'   supplying additional named arguments to `...`⁠.
#'
#' [in_parallel()] is a simple wrapper of [carrier::crate()] and you may refer
#' to that package for more details.
#'
#' Example usage:
#' ```r
#' # The function needs to be freshly-defined, so instead of:
#' mtcars |> map_dbl(in_parallel(sum))
#' # Use an anonymous function:
#' mtcars |> map_dbl(in_parallel(\(x) sum(x)))
#'
#' # Package functions need to be explicitly namespaced, so instead of:
#' map(1:3, in_parallel(\(x) runif(x)))
#' # Use :: to namespace all packages, even those on the default search path:
#' map(1:3, in_parallel(\(x) stats::runif(x)))
#'
#' fun <- function(x) { x + x %% 2 }
#' # Operating in parallel, locally-defined objects will not be found:
#' map(1:3, in_parallel(\(x) x + fun(x)))
#' # Use the ... argument to supply those objects:
#' map(1:3, in_parallel(\(x) x + fun(x), fun = fun))
#' ```
#'
#' @section When to Use:
#'
#' Parallelizing a map using 'n' processes does not automatically lead to it
#' taking 1/n of the time. Additional overhead from setting up the parallel task
#' and communicating with parallel processes eats into this benefit, and can
#' outweigh it for very short tasks or those involving large amounts of data.
#' The threshold at which parallelization becomes clearly beneficial will differ
#' according to your individual setup and task, but a rough guide would be in
#' the order of 100 microseconds to 1 millisecond for each map iteration.
#'
#' If your function allows the user to supply a function to [map()] or its
#' variants, and you want to ensure that it never runs in parallel, simply wrap
#' that argument in [unclass()]. For example:
#' ```r
#' map_mtcars <- function(.f) {
#'   map(mtcars, unclass(.f))
#' }
#' # not run in parallel:
#' map_mtcars(in_parallel(\(x) sum(x)))
#' ```
#'
#' @section Daemons Settings:
#'
#' How and where parallelization occurs is determined by [mirai::daemons()].
#' This is a function from the \pkg{mirai} package that sets up daemons
#' (persistent background processes that receive parallel computations) on your
#' local machine or across the network.
#'
#' Daemons must be set up prior to performing any parallel map operation. It is
#' usual to set daemons once per session. You can leave them running on your
#' local machine as they consume almost no resources whilst waiting to receive
#' tasks. The following sets up 6 daemons on your local machine:
#'
#' ```r
#' mirai::daemons(6)
#' ```
#'
#' Function arguments:
#'
#' * `n`: the number of daemons to launch on your local machine, e.g.
#'   `mirai::daemons(6)`. As a rule of thumb, for maximum efficiency this should
#'   be (at most) one less than the number of cores on your machine, leaving one
#'   core for the main R process.
#' * `url` and `remote`: used to set up and launch daemons for distributed
#'   computing over the network. See [mirai::daemons()] documentation for more
#'   details.
#'
#' Resetting daemons:
#'
#' Daemons persist for the duration of your session. To reset and tear down any
#' existing daemons:
#'
#' ```r
#' mirai::daemons(6)
#' ```
#'
#' All daemons automatically terminate when your session ends. You do not need
#' to explicitly terminate daemons in this instance, although it is still good
#' practice to do so.
#'
#' Note: it should always be for the user to set daemons. If you are using
#' parallel map within a package, do not make any [mirai::daemons()] calls
#' within the package. This helps prevent inadvertently spawning too many
#' daemons if functions are used recursively within each other.
#'
#' @references
#'
#' \pkg{purrr}'s parallelization is powered by \CRANpkg{mirai}. See the
#' [mirai website](https://mirai.r-lib.org/) for more details.
#'
#' @export
#' @examplesIf interactive() && requireNamespace("mirai", quietly = TRUE) && requireNamespace("carrier", quietly = TRUE)
#' # Run in interactive sessions only as spawns additional processes
#'
#' # To use parallelized map:
#' # 1. Set daemons (number of parallel processes) first:
#' mirai::daemons(2)
#'
#' # 2. Wrap .f with in_parallel():
#' mtcars |> map_dbl(in_parallel(\(x) sum(x)))
#'
#' 1:10 |>
#'   map(in_parallel(\(x) stats::rnorm(10, mean = x))) |>
#'   map_dbl(in_parallel(\(x) mean(x)))
#'
#' # A locally-defined function should be passed via ... of in_parallel():
#' slow_lm <- \(formula, data) {
#'   Sys.sleep(0.5)
#'   lm(formula, data)
#' }
#'
#' mtcars |>
#'   split(mtcars$cyl) |>
#'   map(in_parallel(\(df) slow_lm(mpg ~ disp, data = df), slow_lm = slow_lm))
#'
#' # Tear down daemons when no longer in use:
#' mirai::daemons(0)
#'
in_parallel <- function(.f, ...) {
  if (is.null(the$packages_installed)) {
    check_installed(
      c("carrier", "mirai"),
      version = c("0.1.1", "2.3.0"),
      reason = "for parallel map."
    )
    the$packages_installed <- TRUE
  }
  inject(carrier::crate(!!substitute(.f), !!!list(...)))
}

is_crate <- function(x) {
  inherits(x, "crate")
}
