context("test-pi_to_octave")

test_that("examples", {
  expect_equal(pi_to_octave(numeric()), numeric())

  expect_equal(pi_to_octave(60), 0)
  expect_equal(pi_to_octave(72), 1)
  expect_equal(pi_to_octave(48), -1)

  expect_equal(pi_to_octave(65), 0)
  expect_equal(pi_to_octave(76), 1)
  expect_equal(pi_to_octave(52), -1)

  expect_equal(pi_to_octave(71), 0)
  expect_equal(pi_to_octave(83), 1)
  expect_equal(pi_to_octave(59), -1)
})
