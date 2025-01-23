#' Parallelization in purrr
#'
#' @description
#' purrr's map functions have a `.parallel` argument to parallelize a map using
#' the \CRANpkg{mirai} package. This allows you to run computations in parallel
#' using more cores on your machine, or distributed over the network.
#'
#' `.parallel` can be:
#'
#' * `FALSE`: the default, does not use parallelization.
#' * `TRUE`: uses parallelization.
#' * A named list: uses parallelization and supplies the objects provided to the
#' parallel processes.
#'
#' ## Supplying objects to parallel processes
#'
#' In the majority of cases, such as when `.f` is a base or package function,
#' simply set `.parallel` to `TRUE`.
#'
#' If `.f` is a user-defined function, then ideally everything required by the
#' function is passed in as arguments (a pure function). Any constant arguments
#' in this case can be supplied through `...` in the usual way.
#'
#' However, if the function references an object that is not supplied as an
#' argument or defined in the function itself, i.e. a free variable, these
#' should be supplied as a list to `.parallel`. This makes them available to
#' `.f` in the parallel processes. `purrr` requires these to be explicitly
#' supplied, rather than try to determine them from analysing `.f`, as this
#' provides for consistent and reliable behaviour that is hence easy to debug.
#'
#' Examples:
#' \preformatted{
#' # can just specify TRUE:
#' map(1:3, stats::runif, .parallel = TRUE)
#'
#' # requires 'fun1' to be supplied in a list:
#' fun1 <- function(x) \{x + x \%\% 2 \}
#' fun2 <- function(x) \{ x + fun1(x) \}
#' map(1:3, fun2, .parallel = list(fun1 = fun1))
#' }
#'
#' ## Daemons settings
#'
#' How and where parallelization occurs is determined by
#' [`daemons()`][mirai::daemons]. This is a function from the \pkg{mirai}
#' package that sets up daemons (persistent background processes that receive
#' parallel computations) on your local machine or across the network.
#'
#' \pkg{purrr} requires these to be set up prior to performing any parallel map
#' operations. It is usual to set daemons once per session. You can leave them
#' running as they consume little in resources whilst waiting to receive tasks.
#'
#' If they are not set, you will see a warning from the \pkg{mirai} package that
#' it is launching one local daemon - this ensures that the function proceeds,
#' but offers no actual parallelization and is hence probably not what you would
#' want.
#'
#' `daemons()`arguments:
#'
#' * `n`: the number of daemons to launch on your local machine, e.g.
#'   `daemons(7)`. As a rule of thumb, for maximum efficiency this should be (at
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
#' `daemons(0)` resets and terminates any existing daemons.
#'
#' All daemons automatically terminate when you end your session and the
#' connection drops. For this reason, it is not required to specifically
#' terminate daemons in this instance, although it is still good practice to do
#' so.
#'
#' ## with() method
#'
#' The `with()` method for daemons provides a convenient way of evaluating a
#' statement with daemons set up for the duration of the statement.
#'
#' As an example, the below is evaluated in parallel using 7 daemons:
#'
#' \preformatted{
#' with(daemons(7), {
#'   1:10 |>
#'   map(rnorm, n = 10, .parallel = TRUE) |>
#'   map_dbl(mean, .parallel = TRUE)
#' })
#' }
#'
#' ## Further documentation
#'
#' \pkg{purrr}'s parallelization is powered by \CRANpkg{mirai}, so see the
#' [mirai introduction and reference](https://shikokuchuo.net/mirai/articles/mirai.html)
#' for more details.
#'
#' @name parallelization
NULL
