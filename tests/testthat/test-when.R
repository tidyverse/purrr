context("when")

test_that("when chooses the correct action", {

  x <-
    1:5 %>%
    when(
      sum(.) <=  50 ~ sum(.),
      sum(.) <= 100 ~ sum(.) / 2,
      ~ 0
    )

  expect_equal(x, 15)

  y <-
    1:10 %>%
    when(
      sum(.) <=  50 ~ sum(.),
      sum(.) <= 100 ~ sum(.) / 2,
      ~ 0
    )

  expect_equal(y, sum(1:10) / 2)

  z <-
    1:100 %>%
    when(
      sum(.) <=  50 ~ sum(.),
      sum(.) <= 100 ~ sum(.) / 2,
      ~ 0
    )

  expect_equal(z, 0)
})

test_that("named arguments work with when", {
  x <-
    1:10 %>%
    when(
      sum(.) <=     x ~ sum(.) * x,
      sum(.) <= 2 * x ~ sum(.) * x / 2,
      ~ 0,
      x = 60
    )

  expect_equal(x, sum(1:10) * 60)
})

test_that("default values work without a formula", {
  x <-
    iris %>%
    subset(Sepal.Length > 10) %>%
    when(
      nrow(.) > 0 ~ .,
      head(iris, 10)
    )

  expect_equivalent(x, head(iris, 10))

})

test_that("error when named arguments have no matching conditions", {
  expect_error(1:5 %>% when(a = sum(.) < 5 ~ 3))
})
