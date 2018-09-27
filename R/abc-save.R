#' @export
abc_pdf_from_html <- function(html, pdf_path, crop = TRUE) {
  html_path <- tempfile(fileext = ".html")
  htmltools::save_html(html, html_path)
  webshot::webshot(url = html_path,
                   file = pdf_path,
                   selector = "#abc_image")
  if (crop) knitr::plot_crop(pdf_path)
    # system(sprintf("pdfcrop %s %s",
    #                shQuote(pdf_path),
    #                shQuote(pdf_path)))
}
