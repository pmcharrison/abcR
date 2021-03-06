abc_id_counter <- new.env()
abc_id_counter$val <- 0L

new_abc_id <- function() {
  abc_id_counter$val <- abc_id_counter$val + 1L
  abc_id_counter$val
}

# @param container_style CSS style specification; any double quotes must be escaped
html_from_abc_file <- function(x,
                               play_midi = FALSE,
                               download_midi = FALSE,
                               id = new_abc_id(),
                               staff_width = 740,
                               container_style = "") {
  checkmate::qassert(x, "S1")
  checkmate::qassert(play_midi, "B1")
  checkmate::qassert(download_midi, "B1")
  checkmate::qassert(id, "I1")
  checkmate::qassert(staff_width, "X1")
  res <- htmltools::div(
    id = paste0("abc_", id),
    load_abcjs(),
    load_abc_score(x, id),
    abc_content(id = id, play_midi = play_midi, download_midi = download_midi),
    abc_render(id = id,
               play_midi = play_midi, download_midi = download_midi,
               staff_width = staff_width,
               container_style = container_style)
  )
  attr(res, "id") <- paste0("abc_image_", id)
  res
}

abc_content <- function(id, play_midi, download_midi) {
  htmltools::div(
    htmltools::p(id = paste0("abc_image_", id)),
    if (play_midi || download_midi) htmltools::div(
      style = "text-align: center",
      if (play_midi) htmltools::p(id = paste0("abc_midi_player_", id),
                                  style = "max-width: 300px; margin: auto"),
      if (download_midi) htmltools::p(htmltools::div(id = paste0("abc_midi_download_", id)))
    )
  )
}

abc_render <- function(id, play_midi, download_midi, staff_width,
                       container_style) {
  list(
    htmltools::includeScript(system.file("js/abc-render.js", package = "abcR")),
    htmltools::tags$script(sprintf('abc_render(%i, %s, %s, %i, "%s");',
                                   id,
                                   tolower(play_midi),
                                   tolower(download_midi),
                                   staff_width,
                                   container_style))
  )
}

load_abc_score <- function(x, id) {
  checkmate::qassert(x, "S1")
  score <- paste(readLines(x, warn = FALSE, encoding = "UTF-8"),
                 collapse = "\\n")
  htmltools::tags$script(htmltools::HTML(sprintf('var abc_data_%i = "%s";', id, score)))
}

load_abcjs <- function() {
  list(
    htmltools::includeScript(system.file("js/packages/abcjs_midi_5.2.0-min.js",
                                         package = "abcR")),
    htmltools::includeCSS(system.file("css/abcjs-midi.css",
                                      package = "abcR")),
    htmltools::tags$script(type = "text/javascript",
                           src = "https://use.fontawesome.com/b8d1222982.js?ver=4.9.8")
  )
}
