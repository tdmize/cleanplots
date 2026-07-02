#' cleanplots color palette
#'
#' Generate a palette function for the cleanplots color scheme. This function
#' is usually not called directly, but from within
#' [`scale_color_cleanplots()`][scale_color_cleanplots].
#'
#' @param palette Character name of palette. One of `"default"` (the main
#'   colors used for markers, lines, and confidence intervals in the Stata
#'   cleanplots scheme) or `"bars"` (the softer, lighter versions the scheme
#'   uses for bar charts, area plots, and pie charts).
#' @param reverse Logical. Should the palette be reversed?
#' @param order A vector of numbers from 1 to 10 indicating the order of
#'   colors to use (default: `1:10`).
#' @param ... Ignored (included for compatibility).
#'
#' @return A function that takes a single integer `n` and returns a character
#'   vector of `n` hex colors.
#'
#' @examples
#' palette_cleanplots()(4)
#'
#' palette_cleanplots("bars")(3)
#' @export
palette_cleanplots <- function(palette = "default", reverse = FALSE,
                               order = 1:10, ...) {
  pal <- switch(palette,
    default = .cleanplots_main,
    bars    = .cleanplots_bars,
    stop("`palette` must be \"default\" or \"bars\".", call. = FALSE)
  )

  if (!is.numeric(order) || any(order < 1) || any(order > length(pal))) {
    stop("`order` must be a vector of integers between 1 and ", length(pal),
      ".",
      call. = FALSE
    )
  }
  pal <- pal[order]

  if (isTRUE(reverse)) pal <- rev(pal)

  function(n) {
    if (n > length(pal)) {
      warning(
        "The cleanplots palette contains only ", length(pal), " colors, ",
        "but ", n, " were requested. Colors will be recycled.",
        call. = FALSE
      )
      pal <- rep_len(pal, n)
    }
    unname(pal[seq_len(n)])
  }
}
