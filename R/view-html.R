view_html <- function(x) {
  # 'force' is necessary because htmltools changes the working directory
  html <- force(x)
  htmltools::html_print(html)
}
