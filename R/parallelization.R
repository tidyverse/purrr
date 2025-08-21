#' Parallelization in purrr
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#' All map functions allow parallelized operation using \CRANpkg{mirai}.
#'
#' Wrap functions passed to the `.f` argument of [map()] and its variants with
#' [in_parallel()].
#'
#' [in_parallel()] is a \pkg{purrr} adverb that plays two roles:
#'  * It is a signal to purrr verbs like [map()] to go ahead and perform
#'    computations in parallel.
#'  * It helps you create self-contained functions that are isolated from your
#'    workspace. This is important because the function is packaged up
#'    (serialized) to be sent across to parallel processes. Isolation is
#'    critical for performance because it prevents accidentally sending very
#'    large objects between processes.
#'
#' For maps to actually be performed in parallel, the user must also set
#' [mirai::daemons()], otherwise they fall back to sequential processing.
#' [mirai::require_daemons()] may be used to enforce the use of parallel
#' processing. See the section 'Daemons settings' below.
#'
#' @param .f A fresh formula or function. "Fresh" here means that they should be
#'   declared in the call to [in_parallel()].
#' @param ... Named arguments to declare in the environment of the function.
#'
#' @return A 'crate' (classed function).
#'
#' @section Creating self-contained functions:
#'
#' * They should call package functions with an explicit `::` namespace. For
#'   instance `ggplot()` from the ggplot2 package must be called with its
#'   namespace prefix: `ggplot2::ggplot()`. An alternative is to use `library()`
#'   within the function to attach a package to the search path, which allows
#'   subsequent use of package functions without the explicit namespace.
#'
#' * They should declare any data they depend on. You can declare data by
#'   supplying additional named arguments to `...`. When supplying an anonymous
#'   function to a locally-defined function of the form `\(x) fun(x)`, the
#'   function `fun` itself must be supplied to `...`. The entire call would then
#'   be of the form: `in_parallel(\(x) fun(x), fun = fun)`.
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
#' map(1:3, in_parallel(\(x) vec_init(integer(), x)))
#' # Use :: to namespace all package functions:
#' map(1:3, in_parallel(\(x) vctrs::vec_init(integer(), x)))
#'
#' fun <- function(x) { x + x %% 2 }
#' # Operating in parallel, locally-defined objects will not be found:
#' map(1:3, in_parallel(\(x) x + fun(x)))
#' # Use the ... argument to supply those objects:
#' map(1:3, in_parallel(\(x) x + fun(x), fun = fun))
#' ```
#'
#' @section When to use:
#'
#' Parallelizing a map using 'n' processes does not automatically lead to it
#' taking 1/n of the time. Additional overhead from setting up the parallel task
#' and communicating with parallel processes eats into this benefit, and can
#' outweigh it for very short tasks or those involving large amounts of data.
#' The threshold at which parallelization becomes clearly beneficial will differ
#' according to your individual setup and task, but a rough guide would be in
#' the order of 100 microseconds to 1 millisecond for each map iteration.
#'
#' @section Daemons settings:
#'
#' How and where parallelization occurs is determined by [mirai::daemons()].
#' This is a function from the \pkg{mirai} package that sets up daemons
#' (persistent background processes that receive parallel computations) on your
#' local machine or across the network.
#'
#' Daemons must be set prior to performing any parallel map operation, otherwise
#' [in_parallel()] will fall back to sequential processing. To ensure that maps
#' are always performed in parallel, put [mirai::require_daemons()] before the
#' map.
#'
#' It is usual to set daemons once per session. You can leave them running on
#' your local machine as they consume almost no resources whilst waiting to
#' receive tasks. The following sets up 6 daemons locally:
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
#' mirai::daemons(0)
#' ```
#'
#' All daemons automatically terminate when your session ends. You do not need
#' to explicitly terminate daemons in this instance, although it is still good
#' practice to do so.
#'
#' Note: it should always be for the user to set daemons. If you are using
#' parallel map within a package, do not make any [mirai::daemons()] calls
#' within the package, as it should always be up to the user how they wish to
#' set up parallel processing e.g. using local or remote daemons. This also
#' helps prevent inadvertently spawning too many daemons if functions are used
#' recursively within each other.
#'
#' @references
#'
#' \pkg{purrr}'s parallelization is powered by \CRANpkg{mirai}. See the
#' [mirai website](https://mirai.r-lib.org/) for more details.
#'
#' @seealso [map()] for usage examples.
#' @aliases parallelization
#' @export
#' @examplesIf interactive() && rlang::is_installed("mirai") && rlang::is_installed("carrier")
#' # Run in interactive sessions only as spawns additional processes
#'
#' slow_lm <- function(formula, data) {
#'   Sys.sleep(0.5)
#'   lm(formula, data)
#' }
#'
#' # Example of a 'crate' returned by in_parallel(). The object print method
#' # shows the size of the crate and any objects contained within:
#' crate <- in_parallel(\(df) slow_lm(mpg ~ disp, data = df), slow_lm = slow_lm)
#' crate
#'
#' # Use mirai::mirai() to test that a crate is self-contained
#' # by running it in a daemon and collecting its return value:
#' mirai::mirai(crate(mtcars), crate = crate) |> mirai::collect_mirai()
#'
in_parallel <- function(.f, ...) {
  parallel_pkgs_installed()
  inject(
    carrier::crate(
      !!substitute(.f),
      !!!list(...),
      .parent_env = globalenv(),
      .error_arg = ".f",
      .error_call = environment()
    )
  )
}

running_in_parallel <- function(x) {
  inherits(x, "crate") && parallel_pkgs_installed() && mirai::daemons_set()
}

parallel_pkgs_installed <- function() {
  is.logical(the$parallel_pkgs_installed) ||
    {
      check_installed(
        c("carrier", "mirai"),
        version = c("0.2.0", "2.4.0"),
        reason = "for parallel map."
      )
      the$parallel_pkgs_installed <- TRUE
    }
}
