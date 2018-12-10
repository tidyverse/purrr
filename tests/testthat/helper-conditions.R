
expect_error_cnd <- function(expr, regexp, class, ...) {
  err <- catch_cnd(expr)
  expect_true(inherits_all(err, c(class, "error", "condition")))
  expect_match(conditionMessage(err), regexp, ...)
}
