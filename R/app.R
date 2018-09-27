temp_file <- "temp.js"

htmltools::html_print(shiny::div(
  shiny::includeCSS("/Users/peter/Dropbox/Academic/projects/abcR/inst/css/abcjs-midi.css"),
  shiny::includeScript("/Users/peter/Dropbox/Academic/projects/abcR/inst/js/packages/abcjs_midi_5.2.0-min.js"),
  shiny::includeScript("/Users/peter/Dropbox/Academic/projects/abcR/inst/examples/example-song.js"),
  shiny::includeScript("/Users/peter/Dropbox/Academic/projects/abcR/inst/js/abc-render.js"),
  shiny::tags$script(type = "text/javascript",
                     src = "https://use.fontawesome.com/b8d1222982.js?ver=4.9.8"),
  shiny::div(id = "paper"),
  shiny::div(
    style = "text-align: center",
    shiny::div(id = "midi", style = "max-width: 300px; margin: auto"),
    shiny::p(shiny::div(id = "midi-download"))
  ),
  shiny::tags$script("abc_render()")
))
