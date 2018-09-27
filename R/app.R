temp_file <- "temp.js"

htmltools::html_print(shiny::div(
  shiny::includeCSS("/Users/peter/Dropbox/Academic/projects/vexflowR/www/js/abcjs-midi.css"),
  shiny::includeScript("/Users/peter/Dropbox/Academic/projects/vexflowR/www/js/abcjs_midi_5.2.0-min.js"),
  shiny::includeScript("/Users/peter/Dropbox/Academic/projects/vexflowR/www/abc-song.js"),
  shiny::includeScript("/Users/peter/Dropbox/Academic/projects/vexflowR/www/abc-helpers.js"),
  shiny::div(id = "paper"),
  shiny::div(id = "midi"),
  shiny::tags$script("load()")
))
