midi_to_octave <- function(x) {
  checkmate::qassert(x, "R()")
  floor((x - 60) / 12)
}

midi_to_pc <- function(x) {
  checkmate::qassert(x, "R()")
  x %% 12
}

midi_to_pc_set <- function(x) {
  checkmate::qassert(x, "R()")
  sort(unique(x %% 12))
}
