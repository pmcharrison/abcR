#' @export
abc_view_string <- function(...,
                            play_midi = FALSE,
                            download_midi = FALSE,
                            staff_width = 740) {
  view_html(abc_html_from_string(...,
                                 play_midi = play_midi,
                                 download_midi = download_midi,
                                 staff_width = staff_width))
}

#' @export
abc_view_file <- function(x,
                          play_midi = FALSE,
                          download_midi = FALSE,
                          staff_width = 740) {
  view_html(abc_html_from_file(x,
                               play_midi = play_midi,
                               download_midi = download_midi,
                               staff_width = staff_width))
}
