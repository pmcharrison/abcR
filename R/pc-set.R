#' @export
html_from_pc_set <- function(x,
                             play_midi = TRUE,
                             download_midi = FALSE,
                             staff_width = 100,
                             container_style = "max-width: 200px",
                             ...) {
  checkmate::qassert(x, "X+")
  x <- sort(unique(x %% 12))
  str <- sprintf("L:1\n[%s]", spell_pcs(x) %>% paste(collapse = ""))
  html_from_abc_string(str,
                       play_midi = play_midi,
                       download_midi = download_midi,
                       staff_width = staff_width,
                       container_style = container_style,
                       ... = ...)
}

#' @export
view_pc_set <- function(x, ...) {
  view_html(html_from_pc_set(x, ...))
}

pc_set_key <- tibble::tribble(
  ~ pc, ~ natural, ~ flat, ~ sharp,
  0L, "C", NA, NA,
  1L, NA, "D", "C",
  2L, "D", NA, NA,
  3L, NA, "E", "D",
  4L, "E", NA, NA,
  5L, "F", NA, NA,
  6L, NA, "G", "F",
  7L, "G", NA, NA,
  8L, NA, "A", "G",
  9L, "A", NA, NA,
  10L, NA, "B", "A",
  11L, "B", NA, NA
)

cost_by_sharp <- c(F = 1, C = 2, G = 3, D = 4, A = 5)
cost_by_flat <- c(B = 1, E = 2, A = 3, D = 4, G = 5)

#' @export
spell_pcs <- function(x, duplication_cost = 5) {
  if (length(x) == 0L) character()
  checkmate::qassert(x, "X[0,12)")
  N <- length(x)
  res <- tibble::tibble(pc = x) %>%
    dplyr::mutate(is_natural = !is.na(pc_set_key$natural[.data$pc + 1L])) %>%
    dplyr::mutate(with_flats = dplyr::case_when(
      .data$is_natural ~ pc_set_key$natural[.data$pc + 1L],
      TRUE ~ pc_set_key$flat[.data$pc + 1L]
    )) %>%
    dplyr::mutate(with_sharps = dplyr::case_when(
      .data$is_natural ~ pc_set_key$natural[.data$pc + 1L],
      TRUE ~ pc_set_key$sharp[.data$pc + 1L]))
  cost_sharp <- sum(cost_by_sharp[res$with_sharps[!res$is_natural]]) +
    duplication_cost * (res$with_sharps %>% table %>%
                          Filter(function(x) x > 1L, .) %>% length)
  cost_flat <- sum(cost_by_flat[res$with_flats[!res$is_natural]]) +
    duplication_cost * (res$with_flats %>% table %>%
                          Filter(function(x) x > 1L, .) %>% length)
  use_sharps <- cost_sharp <= cost_flat
  accidental_letters <- res[[if (use_sharps) "with_sharps" else "with_flats"]] %>%
    unique %>%
    purrr::keep(function(letter) {
      any(!res$is_natural[res[[if (use_sharps) "with_sharps" else "with_flats"]] == letter])
    })
  res$force_accidental <- res[[if (use_sharps) "with_sharps" else "with_flats"]] %in% accidental_letters
  res <- dplyr::mutate(res, final = paste(
    dplyr::case_when(
      .data$is_natural ~ dplyr::case_when(.data$force_accidental ~ "=",
                                          TRUE ~ ""),
      use_sharps ~ "^",
      TRUE ~ "_"
    ),
    res[[if (use_sharps) "with_sharps" else "with_flats"]],
    sep = ""))
  res$final
}
