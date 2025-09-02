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
  expect_snapshot({
    # Also checks infinite `max_times` prints properly
    rate_delay(20, max_times = Inf)

    rate_backoff()
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

  expect_snapshot(rate_sleep(rate), error = TRUE)
  expect_snapshot(rate_sleep(rate), error = TRUE)
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

  expect_snapshot(rate_sleep(rate), error = TRUE)
  expect_snapshot(rate_sleep(rate), error = TRUE)
})

test_that("rate_sleep() checks that rate is still valid", {
  rate <- rate_delay(1, max_times = 0)
  expect_snapshot(rate_sleep(rate), error = TRUE)
  expect_snapshot(rate_sleep(rate), error = TRUE)
})
