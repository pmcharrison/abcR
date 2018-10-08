context("test-spell-pc-set")

test_that("examples", {
  expect_equal(
    spell_pc_set(c(0, 4, 7)),
    c("C", "E", "G")
  )
  expect_equal(
    spell_pc_set(c(0, 3, 7)),
    c("C", "_E", "G")
  )
  expect_equal(
    spell_pc_set(c(0, 3, 4, 7)),
    c("C", "^D", "E", "G")
  )
})
