#' Parallelization in purrr
#'
#' @param .fn A fresh formula or function.
#' @param ... Arguments to declare in the environment of `.fn`.
#'
#' @description
#' purrr's map functions have a `.parallel` argument to parallelize a map using
#' the \CRANpkg{mirai} package. This allows you to run computations in parallel
#' using more cores on your machine, or distributed over the network.
#'
#' Parallelizing a map using 'n' processes does not automatically lead to it
#' taking 1/n of the time. Additional overhead from setting up the parallel task
#' and communicating with parallel processes eats into this benefit, and can
#' outweigh it for very short tasks or those involving large amounts of data.
#' The threshold at which parallelization becomes clearly beneficial will differ
#' according to your individual setup and task, but a rough guide would be in
#' the order of 100 microseconds to 1 millisecond for each map iteration.
#'
#' # Daemons settings
#'
#' How and where parallelization occurs is determined by [mirai::daemons()].
#' This is a function from the \pkg{mirai} package that sets up daemons
#' (persistent background processes that receive parallel computations) on your
#' local machine or across the network.
#'
#' \pkg{purrr} requires these to be set up prior to performing any parallel map
#' operations. It is usual to set daemons once per session. You can leave them
#' running as they consume almost no resources whilst waiting to receive tasks.
#' The following sets up 6 daemons on your local machine:
#'
#' \preformatted{
#' mirai::daemons(6)
#' }
#'
#' `daemons()`arguments:
#'
#' * `n`: the number of daemons to launch on your local machine, e.g.
#'   `mirai::daemons(6)`. As a rule of thumb, for maximum efficiency this should
#'   be (at most) one less than the number of cores on your machine, leaving one
#'   core for the main R process.
#' * `url` and `remote`: used to set up and launch daemons for distributed
#'   computing over the network. See [mirai::daemons] function documentation for
#'   more details.
#' * None: calling `mirai::daemons()` with no arguments returns a summary of the
#'   current connection status and mirai tasks.
#'
#' For details on further options, see [mirai::daemons].
#'
#' Resetting daemons:
#'
#' Daemons persist for the duration of your session. To reset and terminate any
#' existing daemons:
#'
#' \preformatted{
#' mirai::daemons(0)
#' }
#'
#' All daemons automatically terminate when your session ends and the connection
#' drops. Hence you do not need to explicitly terminate daemons in this instance,
#' although it is still good practice to do so.
#'
#' Note: it should always be for the user to set daemons. If you are using
#' parallel map within a package, do not make any [mirai::daemons()] calls
#' within the package. This helps prevent inadvertently spawning too many
#' daemons if functions are used recursively within each other.
#'
#' # Crating a function
#'
#' [carrier::crate()] provides a systematic way of making the function `.f`
#' self-contained so that it can be readily shared with other processes.
#'
#' Crating ensures that everything needed by the function is serialized along
#' with it, but not other objects which happen to be in the function's enclosing
#' environment. This helps to prevent inadvertently shipping large data objects
#' to daemons, where they are not needed.
#'
#' Any non-package function supplied to `.f` will be automatically crated. When
#' this happens, a confirmation along with the crate size is printed to the
#' console. Package functions are not crated as these are already
#' self-contained.
#'
#' If your function `.f()` contains free variables, for example it references
#' other local functions in its body, then explicitly [carrier::crate()] your
#' function supplying these variables to its `...` argument. This ensures that
#' these objects are available to `.f()` when it is executed in a parallel
#' process.
#'
#' Examples:
#' \preformatted{
#' # package functions are not auto-crated:
#' map(1:3, parallelize(\(x) stats::runif(x))
#'
#' # other functions (incl. anonymous functions) are auto-crated:
#' mtcars |> map_dbl(parallelize(\(...) sum(...)))
#'
#' # explicitly crate a function to include other objects required by it:
#' fun <- \(x) \{x + x \%\% 2 \}
#' map(1:3, parallelize(\(x) x + fun(x), fun = fun))
#' }
#'
#' For details on further options, see [carrier::crate].
#'
#' # Further documentation
#'
#' \pkg{purrr}'s parallelization is powered by \CRANpkg{mirai}. See the
#' [mirai website](https://mirai.r-lib.org/) for more details.
#'
#' Crating is provided by the \CRANpkg{carrier} package. See the
#' [carrier readme](https://github.com/r-lib/carrier) for more details.
#'
#' @export
parallelize <- carrier::crate
