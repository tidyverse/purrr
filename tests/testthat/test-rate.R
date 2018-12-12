
test_that("new_rate() creates rate objects", {
  rate <- new_rate("foo", jitter = FALSE, max_times = 10)
  expect_identical(rate$state$i, 0L)
  expect_identical(rate$max_times, 10)
  expect_false(rate$jitter)
})

test_that("can bump and reset count", {
  rate <- new_rate("foo")

  rate_bump_count(rate)
  rate_bump_count(rate)
  expect_identical(rate_count(rate), 2L)

  rate_reset(rate)
  expect_identical(rate_count(rate), 0L)
})

test_that("rates have print methods", {
  expect_known_output(file = test_path("test-rate-print.txt"), {
    # Also checks infinite `max_times` prints properly
    print(rate_delay(20, max_times = Inf))

    cat_line()
    print(rate_backoff())
  })
})

test_that("rate_delay() delays", {
  rate <- rate_delay(
    pause = 0.02,
    max_times = 3
  )

  rate_sleep(rate, quiet = FALSE)

  rate_reset(rate)

  msg <- catch_cnd(rate_sleep(rate))
  expect_true(inherits_all(msg, c("purrr_condition_rate_init", "condition")))

  msg <- catch_cnd(rate_sleep(rate, quiet = FALSE))
  expect_true(inherits_all(msg, c("purrr_message_rate_retry", "message")))
  expect_identical(msg$length, 0.02)

  msg <- catch_cnd(rate_sleep(rate, quiet = FALSE))
  expect_identical(msg$length, 0.02)

  expect_error_cnd(
    rate_sleep(rate),
    "Request failed after 3 attempts",
    "purrr_error_rate_excess"
  )

  expect_error_cnd(
    rate_sleep(rate),
    "has already be run more than `max_times`",
    "purrr_error_rate_expired"
  )
})

test_that("rate_backoff() backs off", {
  rate <- rate_backoff(
    pause_base = 0.02,
    pause_min = 0,
    jitter = FALSE
  )

  msg <- catch_cnd(rate_sleep(rate))
  expect_true(inherits_all(msg, c("purrr_condition_rate_init", "condition")))

  msg <- catch_cnd(rate_sleep(rate, quiet = FALSE))
  expect_true(inherits_all(msg, c("purrr_message_rate_retry", "message")))
  expect_identical(msg$length, 0.04)

  msg <- catch_cnd(rate_sleep(rate, quiet = FALSE))
  expect_identical(msg$length, 0.08)

  expect_error_cnd(
    rate_sleep(rate),
    "Request failed after 3 attempts",
    "purrr_error_rate_excess"
  )

  expect_error_cnd(
    rate_sleep(rate),
    "has already be run more than",
    "purrr_error_rate_expired"
  )
})

test_that("rate_sleep() checks that rate is still valid", {
  rate <- rate_delay(1, max_times = 0)
  expect_error_cnd(
    rate_sleep(rate),
    "failed after 0 attempts",
    "purrr_error_rate_excess"
  )
  expect_error_cnd(
    rate_sleep(rate),
    "already be run more than `max_times` allows",
    "purrr_error_rate_expired"
  )
})

test_that("insistently() resets rate state", {
  fn <- insistently(compose(), rate_delay(1, max_times = 0))
  expect_error_cnd(
    fn(),
    "failed after 0 attempts",
    "purrr_error_rate_excess"
  )
  expect_error_cnd(
    fn(),
    "failed after 0 attempts",
    "purrr_error_rate_excess"
  )
})
