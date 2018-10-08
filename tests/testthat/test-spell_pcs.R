context("test-spell_pcs")

test_that("examples", {
  expect_equal(
    spell_pcs(c(0, 4, 7)),
    c("C", "E", "G")
  )
  expect_equal(
    spell_pcs(c(0, 0, 4, 7)),
    c("C", "C", "E", "G")
  )
  expect_equal(
    spell_pcs(c(0, 4, 7, 0)),
    c("C", "E", "G", "C")
  )
  expect_equal(
    spell_pcs(c(0, 3, 7)),
    c("C", "_E", "G")
  )
  expect_equal(
    spell_pcs(c(0, 3, 4, 7)),
    c("C", "^D", "E", "G")
  )
  expect_equal(
    spell_pcs(c(0, 1, 4, 7)),
    c("C", "_D", "E", "G")
  )
})
