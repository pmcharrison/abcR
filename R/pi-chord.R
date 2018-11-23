#' @export
html_from_pi_chord <- function(x,
                               play_midi = FALSE,
                               download_midi = FALSE,
                               staff_width = 100,
                               container_style = "max-width: 200px",
                               ...) {
  checkmate::qassert(x, "X+")
  y <- spell_pi_chord(x)
  str <- paste0("L:1\n",
                if (!is.null(y$treble)) "V:1 treble\n",
                if (!is.null(y$bass)) "V:2 bass\n",
                if (!is.null(y$treble)) paste0("[V:1][", y$treble, "]\n"),
                if (!is.null(y$bass)) paste0("[V:2][", y$bass, "]\n")) %>% print
  html_from_abc_string(str,
                       play_midi = play_midi,
                       download_midi = download_midi,
                       staff_width = staff_width,
                       container_style = container_style,
                       ... = ...)
}

#' @export
view_pi_chord <- function(x, ...) {
  view_html(html_from_pi_chord(x, ...))
}

#' @export
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

  if (bass == "") bass <- NULL else bass <- paste0("[", bass, "]")
  if (treble == "") treble <- NULL else treble <- paste0("[", treble, "]")

  list(bass = bass, treble = treble)
}
