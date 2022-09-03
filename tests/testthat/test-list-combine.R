test_that("list_c() concatenates vctrs of compatible types", {
  expect_identical(list_c(list(1L, 2:3)), c(1L, 2L, 3L))
  expect_identical(list_c(list(1, 2:3)), c(1, 2, 3))

  expect_snapshot(error = TRUE,
    list_c(list("a", 1))
  )
})

test_that("list_c() can enforce ptype", {
  expect_snapshot(error = TRUE,
    list_c(list("a"), ptype = integer())
  )
})

test_that("list_cbind() column-binds compatible data frames",{
  df1 <- data.frame(x = 1:2)
  df2 <- data.frame(y = 1:2)
  df3 <- data.frame(z = 1:3)

  expect_equal(list_cbind(list(df1, df2)), data.frame(x = 1:2, y = 1:2))
  expect_snapshot(error = TRUE, {
    list_cbind(list(df1, df3))
  })
})

test_that("list_cbind() can enforce size", {
  df1 <- data.frame(x = 1:2)
  expect_snapshot(error = TRUE, {
    list_cbind(list(df1), size = 3)
  })
})

test_that("list_rbind() row-binds compatible data.frames", {
  df1 <- data.frame(x = 1)
  df2 <- data.frame(x = 2, y = 1)
  df3 <- data.frame(x = "a")

  expect_equal(list_rbind(list(df1, df2)), data.frame(x = 1:2, y = c(NA, 1)))

  expect_snapshot(error = TRUE, {
    list_rbind(list(df1, df3))
  })
})

test_that("list_rbind() can enforce ptype", {
  df1 <- data.frame(x = 1)
  expect_snapshot(error = TRUE, {
    list_rbind(list(df1), ptype = data.frame(x = character()))
  })
})

test_that("assert input is a list", {
  expect_snapshot(error = TRUE, {
    list_c(1)
    list_rbind(1)
    list_cbind(1)
  })
})
