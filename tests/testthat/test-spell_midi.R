context("test-spell_pi_chord")

test_that("examples", {
  expect_equal(spell_pi_chord(c(48, 64, 67)),
               list(bass = "[C,]", treble = "[EG]"))

  expect_equal(spell_pi_chord(c(48, 64, 67, 72)),
               list(bass = "[C,]", treble = "[EGC']"))

  expect_equal(spell_pi_chord(c(48, 63, 64, 67, 72)),
               list(bass = "[C,]", treble = "[^DEGC']"))
})
