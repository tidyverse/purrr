#' Parallelization in purrr
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
#' How and where parallelization occurs is determined by
#' [`daemons()`][mirai::daemons]. This is a function from the \pkg{mirai}
#' package that sets up daemons (persistent background processes that receive
#' parallel computations) on your local machine or across the network.
#'
#' \pkg{purrr} requires these to be set up prior to performing any parallel map
#' operations. It is usual to set daemons once per session. You can leave them
#' running as they consume almost no resources whilst waiting to receive tasks.
#' The following sets up 6 daemons on your local machine:
#'
#' \preformatted{
#' daemons(6)
#' }
#'
#' `daemons()`arguments:
#'
#' * `n`: the number of daemons to launch on your local machine, e.g.
#'   `daemons(6)`. As a rule of thumb, for maximum efficiency this should be (at
#'   most) one less than the number of cores on your machine, leaving one core
#'   for the main R process.
#' * `url` and `remote`: used to set up and launch daemons for distributed
#'   computing over the network. See [daemons][mirai::daemons] function
#'   documentation for more details.
#' * None: calling `daemons()` with no arguments returns a summary of the
#'   current connection status and mirai tasks queued and completed.
#'
#' For more details, including on further arguments, see
#' [daemons][mirai::daemons].
#'
#' Resetting daemons:
#'
#' Daemons persist for the duration of your session.
#'
#' `daemons(0)` resets and terminates any existing daemons.
#'
#' All daemons automatically terminate when your session ends and the connection
#' drops. Hence you do not need to explicitly terminate daemons in this instance,
#' although it is still good practice to do so.
#'
#' # Crating a function
#'
#' As the function `.f` needs to be serialized and shared with other processes,
#' we recommend that you [crate()][carrier::crate] your function for use in a
#' parallel map.
#'
#' The only exception is if `.f` is a function from a package or base R. Do not
#' [crate][carrier::crate] these functions - although you can
#' [crate][carrier::crate] an anonymous function that calls these functions.
#' \preformatted{
#' # either use a base R or package function directly:
#' mtcars |> map_dbl(sum, .parallel = TRUE)
#' # or crate() it as an anonymous function:
#' mtcars |> map_dbl(crate(function(...) sum(...)), .parallel = TRUE)
#' }
#'
#' Crating ensures that everything needed by the function is serialized along
#' with it, but not other objects which happen to be in the function's enclosing
#' environment. This helps to prevent inadvertently shipping large data objects
#' to daemons, and is hence recommnded practice, even when a function is
#' otherwise self-contained.
#'
#' Examples:
#' \preformatted{
#' # do not crate() a package function:
#' map(1:3, stats::runif, .parallel = TRUE)
#'
#' # crate() a function, including the definition of 'fun':
#' fun <- function(x) \{x + x \%\% 2 \}
#' map(1:3, crate(function(x) x + fun(x), fun = fun), .parallel = TRUE)
#' }
#'
#' For details on further options, see [crate][carrier::crate].
#'
#' # Further documentation
#'
#' \pkg{purrr}'s parallelization is powered by \CRANpkg{mirai}.See the
#' [mirai introduction and reference](https://shikokuchuo.net/mirai/articles/mirai.html)
#' for more details.
#'
#' [crate] is re-exported from the \CRANpkg{carrier} package. See the
#' [crate readme](https://github.com/r-lib/carrier) for more details.
#'
#' @name parallelization
NULL
