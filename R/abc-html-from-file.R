#' @export
abc_html_from_file <- function(x,
                               play_midi = TRUE,
                               download_midi = FALSE,
                               html_id = "abc",
                               staff_width = 740) {
  checkmate::qassert(x, "S1")
  checkmate::qassert(play_midi, "B1")
  checkmate::qassert(download_midi, "B1")
  checkmate::qassert(html_id, "S1")
  checkmate::qassert(staff_width, "X1")
  shiny::div(
    id = html_id,
    load_abcjs(),
    load_abc_score(x),
    abc_content(play_midi = play_midi, download_midi = download_midi),
    abc_render(play_midi = play_midi, download_midi = download_midi,
               staff_width = staff_width)
  )
}

abc_content <- function(play_midi, download_midi) {
  shiny::div(
    shiny::div(id = "abc_image"),
    if (play_midi || download_midi) shiny::div(
      style = "text-align: center",
      if (play_midi) shiny::div(id = "abc_midi_player",
                                style = "max-width: 300px; margin: auto"),
      if (download_midi) shiny::p(shiny::div(id = "abc_midi_download"))
    )
  )
}

abc_render <- function(play_midi, download_midi, staff_width) {
  list(
    shiny::includeScript(system.file("js/abc-render.js", package = "abcR")),
    shiny::tags$script(sprintf("abc_render(abc_data, %s, %s, %i);",
                               tolower(play_midi),
                               tolower(download_midi),
                               staff_width))
  )
}

load_abc_score <- function(x) {
  checkmate::qassert(x, "S1")
  score <- paste(readLines(x, warn = FALSE, encoding = "UTF-8"),
                 collapse = "\\n")
  shiny::tags$script(shiny::HTML(sprintf('var abc_data = "%s";', score)))
}

load_abcjs <- function() {
  list(
    shiny::includeScript(system.file("js/packages/abcjs_midi_5.2.0-min.js",
                                     package = "abcR")),
    shiny::includeCSS(system.file("css/abcjs-midi.css",
                                  package = "abcR")),
    shiny::tags$script(type = "text/javascript",
                       src = "https://use.fontawesome.com/b8d1222982.js?ver=4.9.8")
  )
}
