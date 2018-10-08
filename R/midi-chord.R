#' @export
html_from_midi_chord <- function(x,
                                     play_midi = FALSE,
                                     download_midi = FALSE,
                                     staff_width = 100,
                                     container_style = "max-width: 200px",
                                     ...) {
  checkmate::qassert(x, "X+")
  y <- spell_midi_chord(x)
  str <- sprintf("L:1\nV:1 treble\nV:2 bass\n[V:1][%s]\n[V:2][%s]",
                 y$treble, y$bass)
  html_from_abc_string(str,
                       play_midi = play_midi,
                       download_midi = download_midi,
                       staff_width = staff_width,
                       container_style = container_style,
                       ... = ...)
}

#' @export
abc_view_midi_chord <- function(x, ...) {
  view_html(html_from_midi_chord(x, ...))
}

#' @export
spell_midi_chord <- function(x, duplication_cost = 5) {
  checkmate::qassert(x, "X*")
  checkmate::qassert(duplication_cost, "R1[0,]")
  letters <- spell_pcs(midi_to_pc(x))
  octaves <- midi_to_octave(x)
  res <- paste(
    letters,
    strrep("'", pmax(0, octaves)),
    strrep(",", pmax(0, - octaves)),
    sep = ""
  )
  is_bass <- octaves < 0
  bass <- res[is_bass] %>% paste(collapse = "")
  treble <- res[!is_bass] %>% paste(collapse = "")

  if (bass == "") bass <- "z" else bass <- paste0("[", bass, "]")
  if (treble == "") treble <- "z" else treble <- paste0("[", treble, "]")

  list(bass = bass, treble = treble)
}
