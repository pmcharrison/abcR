#' View ABC string
#'
#' Creates an HTML preview of a piece of ABC notation expressed as a string.
#' This preview should automatically appear in the RStudio viewer pane.
#'
#' @param x
#' (Character scalar)
#' ABC notation to view, expressed as a string.
#'
#' @param play_midi
#' (Logical scalar)
#' If \code{TRUE}, the display window will include a prompt whereby the
#' user can play an audio rendition of the musical sequence.
#'
#' @param download_midi
#' (Logical scalar)
#' If \code{TRUE}, the display window will provide the user with an option
#' to download a MIDI file representing the musical sequence.
#'
#' @param staff_width
#' (Numeric scalar)
#' \code{staffwidth} parameter passed to \code{ABCJS.renderAbc}.
#'
#' @examples
#' view_abc_string("C D E F G")
#' view_abc_string("L:1\nC D E F G")
#' view_abc_string("L:1\n[CEG]\n")
#'
#' @export
view_abc_string <- function(x,
                            play_midi = FALSE,
                            download_midi = FALSE,
                            staff_width = 740) {
  view_html(html_from_abc_string(x,
                                 play_midi = play_midi,
                                 download_midi = download_midi,
                                 staff_width = staff_width))
}

#' View ABC file
#'
#' Creates an HTML preview of an ABC file.
#' This preview should automatically appear in the RStudio viewer pane.
#'
#' @param x Path to the ABC file.
#'
#' @inheritParams view_abc_string
#'
#' @export
view_abc_file <- function(x,
                          play_midi = FALSE,
                          download_midi = FALSE,
                          staff_width = 740) {
  view_html(html_from_abc_file(x,
                               play_midi = play_midi,
                               download_midi = download_midi,
                               staff_width = staff_width))
}
