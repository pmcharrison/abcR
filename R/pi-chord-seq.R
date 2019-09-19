#' View a sequence of pitch chords
#'
#' Displays a chord sequence, where each chord is expressed as a
#' vector of MIDI note numbers.
#'
#' @param x
#' Chord sequence to display, expressed as a list of numeric vectors,
#' where each vector expresses a single chord as a list of MIDI
#' note numbers.
#'
#' @param annotate
#' If not \code{NULL}, a character vector of the same length as \code{x},
#' providing text to display under each chord. This text may not
#' contain whitespace.
#'
#' @param chords_per_line
#' (Integerish scalar)
#' Number of chords to display on each line.
#'
#' @inheritParams view_abc_string
#'
#' @export
view_pi_chord_seq <- function(
  x,
  annotate = NULL,
  chords_per_line = 5,
  staff_width = 75 * pmin(pmax(2, length(x)), 5),
  play_midi = FALSE,
  download_midi = FALSE
) {
  html_from_pi_chord_seq(
    x = x,
    annotate = annotate,
    chords_per_line = chords_per_line,
    staff_width = staff_width,
    play_midi = play_midi,
    download_midi = download_midi
  ) %>%
    view_html()
}

html_from_pi_chord_seq <- function(
  x,
  annotate = NULL,
  chords_per_line = 5,
  staff_width = 75 * pmin(pmax(2, length(x)), 5),
  play_midi = FALSE,
  download_midi = FALSE,
  ...
) {
  checkmate::qassert(x, "l")
  if (!is.null(annotate)) {
    annotate <- as.character(annotate)
    stopifnot(is.character(annotate),
              length(annotate) == length(x))
  }
  if (any(grepl("\\s", annotate)))
    stop("<annotate> strings may not contain whitespace")

  y <- purrr::map(x, spell_pi_chord) %>% (dplyr::bind_rows)
  if (!is.null(annotate)) y$annotate <- annotate
  by_row <- split(y, floor(seq(from = 0, length.out = nrow(y)) / chords_per_line))
  score <- purrr::map_chr(by_row, function(t) {
    treble_str <- paste0("[V:1]", paste(t$treble, collapse = "|"), "|")
    bass_str <- paste0("[V:2]", paste(t$bass, collapse = "|"), "|")
    annotate_str <- if (!is.null(annotate))
      paste(c("w:", t$annotate), collapse = " ")
    paste(c(treble_str,
            if (!is.null(treble_str)) annotate_str,
            bass_str,
            if (is.null(treble_str)) annotate_str
    ), collapse = "\n")
  }) %>% paste(collapse = "\n%\n")

  str <- sprintf("L:1\nV:1 treble\nV:2 bass\n%s", score)

  html_from_abc_string(str,
                       play_midi = play_midi,
                       download_midi = download_midi,
                       staff_width = staff_width,
                       ... = ...)
}
