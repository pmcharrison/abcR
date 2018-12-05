#' @export
html_from_pi_chord_seq <- function(x,
                                   chords_per_line = 5,
                                   staff_width = 75 * pmin(pmax(2, length(x)), 5),
                                   play_midi = FALSE,
                                   download_midi = FALSE,
                                   ...) {
  checkmate::qassert(x, "l")

  y <- purrr::map(x, spell_pi_chord) %>% (dplyr::bind_rows)
  by_row <- split(y, floor(seq(from = 0, length.out = nrow(y)) / chords_per_line))
  score <- purrr::map_chr(by_row, function(t) {
    treble_str <- if (all(t$treble == "x")) NULL else
      paste0("[V:1]", paste(t$treble, collapse = "|"), "|")
    bass_str <- if (all(t$bass == "x")) NULL else
      paste0("[V:2]", paste(t$bass, collapse = "|"), "|")
    paste(c(treble_str, bass_str), collapse = "\n")
  }) %>% paste(collapse = "\n%\n")

  str <- sprintf("L:1\nV:1 treble\nV:2 bass\n%s", score)

  html_from_abc_string(str,
                       play_midi = play_midi,
                       download_midi = download_midi,
                       staff_width = staff_width,
                       ... = ...)
}

#' @export
view_pi_chord_seq <- function(x, ...) {
  view_html(html_from_pi_chord_seq(x, ...))
}
