#' View a pitch chord
#'
#' Displays a musical chord, defined as a finite set of musical pitches.
#'
#' @param x
#' Chord to display, expressed as a numeric vector of MIDI note numbers.
#' Only integerish note numbers are supported.
#'
#' @inheritParams view_abc_string
#'
#' @export
view_pi_chord <- function(
  x,
  play_midi = FALSE,
  download_midi = FALSE,
  staff_width = 100
) {
  html_from_pi_chord(
    x = x,
    play_midi = play_midi,
    download_midi = download_midi,
    staff_width = staff_width
  ) %>%
    view_html()
}

html_from_pi_chord <- function(x,
                               play_midi = FALSE,
                               download_midi = FALSE,
                               staff_width = 100,
                               container_style = "max-width: 200px",
                               ...) {
  checkmate::qassert(x, "X+")
  y <- spell_pi_chord(x)
  str <- paste0("L:1\n",
                if (y$treble != "x") "V:1 treble\n",
                if (y$bass != "x") "V:2 bass\n",
                if (y$treble != "x") paste0("[V:1]", y$treble, "\n"),
                if (y$bass != "x") paste0("[V:2]", y$bass, "\n"))
  html_from_abc_string(str,
                       play_midi = play_midi,
                       download_midi = download_midi,
                       staff_width = staff_width,
                       container_style = container_style,
                       ... = ...)
}

spell_pi_chord <- function(x, duplication_cost = 5) {
  checkmate::qassert(x, "X*")
  checkmate::qassert(duplication_cost, "R1[0,]")
  letters <- spell_pcs(pi_to_pc(x))
  octaves <- pi_to_octave(x)
  res <- paste(
    letters,
    strrep("'", pmax(0, octaves)),
    strrep(",", pmax(0, - octaves)),
    sep = ""
  )
  is_bass <- octaves < 0
  bass <- res[is_bass] %>% paste(collapse = "")
  treble <- res[!is_bass] %>% paste(collapse = "")

  if (bass == "") bass <- "x" else bass <- paste0("[", bass, "]")
  if (treble == "") treble <- "x" else treble <- paste0("[", treble, "]")

  list(bass = bass, treble = treble)
}
