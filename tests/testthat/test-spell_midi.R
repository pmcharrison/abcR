context("test-spell_midi_chord")

test_that("examples", {
  x <- c("C,", "E", "G")
  attr(x, "octaves") <- c(-1, 0, 0)
  expect_equal(spell_midi_chord(c(48, 64, 67)), x)

  x <- c("C,", "E", "G", "C'")
  attr(x, "octaves") <- c(-1, 0, 0, 1)
  expect_equal(spell_midi_chord(c(48, 64, 67, 72)), x)

  x <- c("C,", "^D", "E", "G", "C'")
  attr(x, "octaves") <- c(-1, 0, 0, 0, 1)
  expect_equal(spell_midi_chord(c(48, 63, 64, 67, 72)), x)
})
