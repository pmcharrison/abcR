context("test-pi_to_pc_set")

test_that("examples", {
  expect_equal(
    pi_to_pc_set(c(60, 64, 67)),
    c(0, 4, 7)
  )
  expect_equal(
    pi_to_pc_set(c(48, 60, 64, 67)),
    c(0, 4, 7)
  )
  expect_equal(
    pi_to_pc_set(c(48, 64, 67)),
    c(0, 4, 7)
  )
  expect_equal(
    pi_to_pc_set(c(48, 63, 67)),
    c(0, 3, 7)
  )
})
