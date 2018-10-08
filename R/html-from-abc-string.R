#' @export
html_from_abc_string <- function(x,
                                 temp_file = tempfile(fileext = ".abc"),
                                 ...) {
  checkmate::qassert(x, "S1")
  checkmate::qassert(temp_file, "S1")
  write(x, temp_file, append = FALSE)
  html_from_abc_file(x = temp_file, ...)
}
