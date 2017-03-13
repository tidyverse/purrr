#' Negate a predicate function.
#'
#' @inheritParams map_if
#' @inheritParams as_mapper
#' @return A new predicate function.
#' @export
#' @examples
#' negate("x")
#' negate(is.null)
#'
#' x <- transpose(list(x = 1:10, y = rbernoulli(10)))
#' x %>% keep("y") %>% length()
#' x %>% keep(negate("y")) %>% length()
#' # Same as
#' x %>% discard("y") %>% length()
negate <- function(.p, .default = FALSE) {
  .p <- tidy_capture(.p)
  transform_expr(.p, ~ lang_interp({!(UQE(.))}), default = .default)
}

transform_expr <- function(quo_f, trans, default) {
  trans <- rlang::as_function(trans)

  f <- tidy_eval(quo_f)
  if (is.function(f)) {
    args <- fn_fmls(f)
    call_args <- map(names(args), as_symbol)

    body <- lang_interp(UQE(quo_f)(UQS(call_args)))
  } else if (is_formula(f)) {
    args <- f_mapper_args()
    body <- f_rhs(quo_f)
  } else if (is.character(f) || is.numeric(f) || is.list(f)) {
    x <- NULL # quiet R CMD check warning
    args <- alist(x = )
    body <- lang_interp(extract(x, UQ(as.list(f)), default = UQ(default)))
  } else {
    stop("Unknown input", call. = FALSE)
  }

  new_fn(args, trans(body), f_env(quo_f))
}

lang_interp <- function(x) {
  f_rhs(tidy_capture(x))
}
