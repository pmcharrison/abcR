pi_to_octave <- function(x) {
  checkmate::qassert(x, "N()")
  floor((x - 60) / 12)
}

pi_to_pc <- function(x) {
  checkmate::qassert(x, "N()")
  x %% 12
}

pi_to_pc_set <- function(x) {
  checkmate::qassert(x, "N()")
  sort(unique(x %% 12))
}
