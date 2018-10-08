#' @export
abc_html_from_midi_chord <- function(x,
                                     play_midi = FALSE,
                                     download_midi = FALSE,
                                     staff_width = 100,
                                     container_style = "max-width: 200px",
                                     ...) {
  checkmate::qassert(x, "X+")
  spelt <- spell_midi_chord(x)
  is_bass <- attr(spelt, "octaves") < 0
  bass <- spelt[is_bass] %>% paste(collapse = "")
  sop <- spelt[!is_bass] %>% paste(collapse = "")

  str <- sprintf("L:1\nV:1 treble\nV:2 bass\n[V:1][%s]\n[V:2][%s]", sop, bass)
  abc_html_from_string(str,
                       play_midi = play_midi,
                       download_midi = download_midi,
                       staff_width = staff_width,
                       container_style = container_style,
                       ... = ...)
}

#' @export
abc_view_midi_chord <- function(x, ...) {
  view_html(abc_html_from_midi_chord(x, ...))
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
  attr(res, "octaves") <- octaves
  res
}
