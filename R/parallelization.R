#' Parallelization in purrr
#'
#' @description
#' purrr's map functions have a `.parallel` argument to parallelize a map using
#' the \CRANpkg{mirai} package. This allows you to run computations in parallel
#' using more cores on your machine, or distributed over the network.
#'
#' # Crating a function
#'
#' As the function `.f` needs to be serialized and sent outside of your current
#' session to parallel processes, a little care needs to be taken to make sure
#' that it is self-contained, so that it will work as expected.
#'
#' A function will be self-contained if:
#'
#' * It is a function from base R or any installed package.
#'
#' * If it is a user-defined function where everything not defined in the
#'   function itself is passed in as arguments (a pure function).
#'
#' Otherwise, or if you are not sure, use `crate()` from the \CRANpkg{carrier}
#' package to create self-contained functions before supplying to `.f`.
#'
#' It is necessary to `crate()` a user-defined function if it references any
#' object that is not supplied as an argument or defined in the function itself,
#' i.e. a free variable. Using `crate()` ensures that everything needed by the
#' function is serialized along with it.
#'
#' Examples:
#' \preformatted{
#' # can just use a package function:
#' map(1:3, stats::runif, .parallel = TRUE)
#'
#' # crate() a function to include the definition of 'fun':
#' fun <- function(x) \{x + x \%\% 2 \}
#' map(1:3, carrier::crate(function(x) x + fun(x), fun = fun), .parallel = TRUE)
#' }
#'
#' For further details, see the documentation for `carrier::crate()`.
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
#' # with() method
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
#' # Further documentation
#'
#' \pkg{purrr}'s parallelization is powered by \CRANpkg{mirai}, so see the
#' [mirai introduction and reference](https://shikokuchuo.net/mirai/articles/mirai.html)
#' for more details.
#'
#' For 'crating' a function, see the \CRANpkg{carrier} package
#' [readme](https://github.com/r-lib/carrier) for more details.
#'
#' @name parallelization
NULL

mmap_ <- function(.x, .f, .progress, .type, error_call, ...) {

  m <- mirai::mirai_map(.x, .f, .args = list(...))

  options <- c(".stop", if (isTRUE(.progress)) ".progress")
  x <- withCallingHandlers(
    mirai::collect_mirai(m, options = options),
    error = function(cnd) {
      location <- cnd$location
      iname <- cnd$name
      cli::cli_abort(
        c(i = "In index: {location}.",
          i = if (length(iname) && nzchar(iname)) "With name: {iname}."),
        location = location,
        name = iname,
        parent = cnd$parent,
        call = error_call,
        class = "purrr_error_indexed"
      )
    },
    interrupt = function(cnd) {
      mirai::stop_mirai(m)
    }
  )
  if (.type != "list") {
    x <- simplify_impl(x, ptype = vector(mode = .type), error_call = error_call)
  }
  x

}
