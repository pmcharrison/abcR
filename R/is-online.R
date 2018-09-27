# Thanks to https://stackoverflow.com/questions/5076593/how-to-determine-if-you-have-an-internet-connection-in-r
#' @export
is_online <- function() {
  !is.null(curl::nslookup("google.com", error = FALSE))
}
