view_html <- function(x) {
  # 'eval' is necessary because htmltools changes the working directory
  html <- eval(x)
  htmltools::html_print(html)
}
