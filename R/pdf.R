# pdf_from_abc_html <- function(html, pdf_path, id = attr(html, "id"), crop = TRUE) {
#   html_path <- tempfile(fileext = ".html")
#   htmltools::save_html(html, html_path)
#   webshot::webshot(url = html_path,
#                    file = pdf_path,
#                    selector = paste0("#", id))
#   if (crop) knitr::plot_crop(pdf_path)
# }
