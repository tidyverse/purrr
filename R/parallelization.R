#' Parallelization in purrr
#'
#' `r lifecycle::badge("experimental")`
#' All map functions allow parallelized operation using \CRANpkg{mirai}. To take
#' advantage of this, wrap a function that is passed to the `.f` argument of
#' [map()] or any of its variants with [parallelize()]. This declares that the
#' computation should proceed in parallel utilizing multiple cores on your local
#' machine, or distributed over the network.
#'
#' @param .fn A fresh formula or function. "Fresh" here means that they should
#'   be declared in the call to [parallelize()].
#' @param ... Arguments to declare in the environment of the function.
#'
#' @section How to Use:
#'
#' Wrapping a function that is passed to the `.f` argument in [map()] or any of
#' its variants with [parallelize()] declares that the map should be performed
#' in parallel.
#'
#' Under the hood, [parallelize()] provides a systematic way of making a
#' function self-contained so that it can be readily shared with other parallel
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
#'   supplying additional arguments to `...` or by unquoting objects with `!!`⁠.
#'
#' [parallelize()] is a simple alias for [carrier::crate()] and you may refer to
#' that package for more details.
#'
#' Example usage:
#' \preformatted{
#' # The function needs to be freshly-defined, so instead of:
#' mtcars |> map_dbl(parallelize(sum))
#' # Use an anonymous function:
#' mtcars |> map_dbl(parallelize(\(...) sum(...)))
#'
#' # Package functions need to be explicitly namespaced, so instead of:
#' map(1:3, parallelize(\(x) runif(x)))
#' # Use :: to namespace all packages, even those on the default search path:
#' map(1:3, parallelize(\(x) stats::runif(x)))
#'
#' fun <- \(x) \{x + x \%\% 2 \}
#' # Operating in parallel, locally-defined objects will not be found:
#' map(1:3, parallelize(\(x) x + fun(x)))
#' # Use the ... argument to supply those objects:
#' map(1:3, parallelize(\(x) x + fun(x), fun = fun))
#' }
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
#' \preformatted{
#' mirai::daemons(6)
#' }
#'
#' Function arguments:
#'
#' * `n`: the number of daemons to launch on your local machine, e.g.
#'   `mirai::daemons(6)`. As a rule of thumb, for maximum efficiency this should
#'   be (at most) one less than the number of cores on your machine, leaving one
#'   core for the main R process.
#' * `url` and `remote`: used to set up and launch daemons for distributed
#'   computing over the network. See [mirai::daemons] function documentation for
#'   more details.
#'
#' Resetting daemons:
#'
#' Daemons persist for the duration of your session. To reset and tear down any
#' existing daemons:
#'
#' \preformatted{
#' mirai::daemons(0)
#' }
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
parallelize <- carrier::crate
