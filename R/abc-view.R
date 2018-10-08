#' @export
view_abc_string <- function(...,
                            play_midi = FALSE,
                            download_midi = FALSE,
                            staff_width = 740) {
  view_html(html_from_abc_string(...,
                                 play_midi = play_midi,
                                 download_midi = download_midi,
                                 staff_width = staff_width))
}

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
