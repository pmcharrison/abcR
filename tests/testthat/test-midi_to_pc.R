context("test-pi_to_pc")

test_that("examples", {
  expect_equal(pi_to_pc(numeric()), numeric())
  expect_equal(pi_to_pc(c(60, 64, 67, 67)), c(0, 4, 7, 7))
  expect_equal(pi_to_pc(c(59, 60, 64, 67, 67)), c(11, 0, 4, 7, 7))
})
