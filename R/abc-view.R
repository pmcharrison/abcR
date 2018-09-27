#' @export
abc_view_string <- function(...,
                            play_midi = TRUE, download_midi = FALSE,
                            online = is_online()) {
  x <- paste(..., sep = "\n")
  # 'eval' is necessary because htmltools changes the working directory
  html <- eval(abc_html_from_string(x,
                                    play_midi = play_midi,
                                    download_midi = download_midi,
                                    online = online))
  htmltools::html_print(html)
}

#' @export
abc_view_file <- function(x,
                          play_midi = TRUE, download_midi = FALSE,
                          online = is_online()) {
  # 'eval' is necessary because htmltools changes the working directory
  html <- eval(abc_html_from_file(x,
                                  play_midi = play_midi,
                                  download_midi = download_midi,
                                  online = online))
  htmltools::html_print(html)
}
