#' Match/validate a set of conditions for an object and continue with the action
#' associated with the first valid match.
#'
#' \code{when} is a flavour of pattern matching (or an if-else abstraction) in
#' which a value is matched against a sequence of condition-action sets. When a
#' valid match/condition is found the action is executed and the result of the
#' action is returned.
#'
#' @param .   the value to match agaist
#' @param ... formulas; each containing a condition as LHS and an action as RHS.
#'   named arguments will define additional values.
#'
#' @return the value resulting from the action of the first valid
#'   match/condition is returned. If no matches are found, and no default is
#'   given, NULL will be returned.
#'
# @details condition-action sets are written as formulas with conditions as
#   left-hand sides and actions as right-hand sides. A formula with only a
#   right-hand will be treated as a condition which is always satisfied. For
#   such a default case one can also omit the \code{~} symbol, but note that its
#   value will then be evaluated. Any named argument will be made available in
#   all conditions and actions, which is useful in avoiding repeated temporary
#   computations or temporary assignments.
#
#' Validity of the conditions are tested with \code{isTRUE}, or equivalently
#' with \code{identical(condition, TRUE)}.
#' In other words conditions resulting in more than one logical will never
#' be valid. Note that the input value is always treated as a single object,
#' as opposed to the \code{ifelse} function.
#'
#' @examples
#' 1:10 %>%
#'   when(
#'     sum(.) <=  50 ~ sum(.),
#'     sum(.) <= 100 ~ sum(.)/2,
#'     ~ 0
#'   )
#'
#' 1:10 %>%
#'   when(
#'     sum(.) <=   x ~ sum(.),
#'     sum(.) <= 2*x ~ sum(.)/2,
#'     ~ 0,
#'     x = 60
#'   )
#'
#' iris %>%
#'   subset(Sepal.Length > 10) %>%
#'   when(
#'     nrow(.) > 0 ~ .,
#'     ~ iris %>% head(10)
#'   )
#'
#' iris %>%
#'   head %>%
#'   when(nrow(.) < 10 ~ .,
#'        ~ stop("Expected fewer than 10 rows."))
#' @export
when <- function(., ...)
{
  dots   <- list(...)
  names  <- names(dots)
  named  <- if (is.null(names)) rep(FALSE, length(dots)) else names != ""

  if (sum(!named) == 0)
    stop("At least one matching condition is needed.",
         call. = FALSE)

  is_formula <-
    vapply(dots,
           function(dot) identical(class(dot), "formula"),
           logical(1L))

  env <- new.env(parent = parent.frame())
  env[["."]] <- .

  if (sum(named) > 0)
    for (i in which(named))
      env[[names[i]]] <- dots[[i]]

  result <- NULL
  for (i in which(!named))
  {
    if (is_formula[i]) {
      action <- length(dots[[i]])
      if (action == 2 || isTRUE(eval(dots[[i]][[2]], env, env))) {
        result <- eval(dots[[i]][[action]], env, env)
        break
      }
    } else {
      result <- dots[[i]]
    }
  }

  result
}
