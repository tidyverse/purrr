test_that("list_c() concatenates vctrs of compatible types", {
  expect_identical(list_c(list(1L, 2:3)), c(1L, 2L, 3L))
  expect_identical(list_c(list(1, 2:3)), c(1, 2, 3))

  expect_snapshot(error = TRUE, list_c(list("a", 1)))
})

test_that("list_c() can enforce ptype", {
  expect_snapshot(error = TRUE, list_c(list("a"), ptype = integer()))
})

test_that("list_c() strips outer names and preserves inner names (#997)", {
  expect_equal(list_c(list(x = 1:2, y = 3:4)), 1:4)
  expect_equal(list_c(list(c(a = 1), c(b = 2))), c(a = 1, b = 2))
})

test_that("list_cbind() column-binds compatible data frames", {
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
  df3 <- data.frame(x = "a", stringsAsFactors = FALSE)

  expect_equal(list_rbind(list(df1, df2)), data.frame(x = 1:2, y = c(NA, 1)))

  # and names don't make a difference unless `names_to` is set
  out <- list_rbind(list(a = df1, b = df2))
  expect_equal(out, data.frame(x = c(1, 2), y = c(NA, 1)))

  expect_snapshot(error = TRUE, {
    list_rbind(list(df1, df3))
  })
})

test_that("list_rbind() can enforce ptype", {
  df1 <- data.frame(x = 1)

  expect_snapshot(error = TRUE, {
    ptype <- data.frame(x = character(), stringsAsFactors = FALSE)
    list_rbind(list(df1), ptype = ptype)
  })
})

test_that("NULLs are ignored", {
  df1 <- data.frame(x = 1)
  df2 <- data.frame(y = 1)

  expect_equal(list_c(list(1, NULL, 2)), c(1, 2))
  expect_equal(list_rbind(list(df1, NULL, df1)), vec_rbind(df1, df1))
  expect_equal(list_cbind(list(df1, NULL, df2)), vec_cbind(df1, df2))
})

test_that("empty inputs return expected output", {
  expect_equal(list_c(list()), NULL)
  expect_equal(list_c(list(NULL)), NULL)

  expect_equal(list_rbind(list()), data.frame())
  expect_equal(list_rbind(list(NULL)), data.frame())
  expect_equal(list_cbind(list()), data.frame())
  expect_equal(list_cbind(list(NULL)), data.frame())
})

test_that("assert input is a list", {
  expect_snapshot(error = TRUE, {
    list_c(1)
    list_rbind(1)
    list_cbind(1)
  })

  # and not just built on a list
  expect_snapshot(error = TRUE, {
    list_c(mtcars)
    list_rbind(mtcars)
    list_cbind(mtcars)
  })
})

test_that("assert input is list of data frames", {
  expect_snapshot(error = TRUE, {
    list_rbind(list(1, mtcars, 3))
    list_cbind(list(1, mtcars, 3))
  })
})
