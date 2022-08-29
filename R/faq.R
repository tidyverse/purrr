#' Best practices for exporting adverb-wrapped functions
#'
#' @description
#' Exporting functions created with purrr adverbs in your package
#' requires some precautions because the functions will contain internal
#' purrr code. This means that creating them once and for all when
#' the package is built may cause problems when purrr is updated, because
#' a function that the adverb uses might no longer exist.
#'
#' Instead, either create the modified function once per session on package
#' load or wrap the call within another function every time you use it:
#'
#' * Using the \code{\link[=.onLoad]{.onLoad()}} hook:
#'   ```
#'   #' My function
#'   #' @export
#'   insist_my_function <- function(...) "dummy"
#'
#'   my_function <- function(...) {
#'     # Implementation
#'   }
#'
#'   .onLoad <- function(lib, pkg) {
#'     insist_my_function <<- purrr::insistently(my_function)
#'   }
#'   ```
#'
#' * Using a wrapper function:
#'   ```
#'   my_function <- function(...) {
#'     # Implementation
#'   }
#'
#'   #' My function
#'   #' @export
#'   insist_my_function <- function(...) {
#'     purrr::insistently(my_function)(...)
#'   }
#'   ```
#' @keywords internal
#' @name faq-adverbs-export
NULL
