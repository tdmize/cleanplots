# Color definitions for the cleanplots scheme
#
# Hex values converted from the Stata scheme (scheme-cleanplots.scheme v1.0.4)
# using Stata's intensity-adjustment formula:
#   multiplier m < 1 (lighten): round(RGB * m + 255 * (1 - m))
#   multiplier m > 1 (darken):  round(RGB / m)

# Main plot colors (Stata p1-p10: markers, lines, CIs)
.cleanplots_main <- c(
  `red`      = "#D50000", # red*1.2
  `ltblue`   = "#8FC6EB", # eltblue*.9
  `black`    = "#000000", # black
  `gray`     = "#909090", # gs9
  `purple`   = "#740074", # purple*1.1
  `pink`     = "#FFB3D9", # pink*.3
  `navy`     = "#143755", # navy*1.3
  `ltgray`   = "#C0C0C0", # gs12
  `dkgray`   = "#404040", # gs4
  `lavender` = "#D9D7F0"  # lavender*.35
)

# Bar/area colors (Stata p1bar-p10bar, as rendered with the scheme's
# default `intensity bar 70`, i.e., faded 30% toward white). The scheme
# uses a softer palette for bars/areas because of how much ink they use.
.cleanplots_bars <- c(
  `red`      = "#FF4D4D", # red, at intensity 70
  `ltblue`   = "#C2E0F5", # eltblue*.7, at intensity 70
  `black`    = "#5F5F5F", # black*.9, at intensity 70
  `gray`     = "#B1B1B1", # gs9, at intensity 70
  `purple`   = "#AF5FAF", # purple*.9, at intensity 70
  `pink`     = "#FFDBEE", # pink*.2, at intensity 70
  `navy`     = "#5D7A93", # navy*1.1, at intensity 70
  `ltgray`   = "#D3D3D3", # gs12, at intensity 70
  `dkgray`   = "#909090", # gs6, at intensity 70
  `lavender` = "#E8E7F6"  # lavender*.3, at intensity 70
)

#' Extract cleanplots colors as hex codes
#'
#' Get the hex color codes used by the cleanplots color scheme,
#' either the full palette or specific colors by name.
#'
#' @param ... Character names of colors to return. If none are specified,
#'   all colors in the palette are returned. Available names: `"red"`,
#'   `"ltblue"`, `"black"`, `"gray"`, `"purple"`, `"pink"`, `"navy"`,
#'   `"ltgray"`, `"dkgray"`, `"lavender"`.
#' @param bars Logical. If `TRUE`, return the softer bar/area versions of
#'   the colors (the colors Stata's cleanplots scheme uses for bar charts,
#'   area plots, and pie charts). Default is `FALSE` (the main colors used
#'   for markers and lines).
#'
#' @return A named character vector of hex color codes.
#'
#' @references
#' Mize, T. D. cleanplots: Stata graphing scheme.
#' \url{https://www.trentonmize.com/software/cleanplots}
#'
#' @examples
#' cleanplots_colors()
#'
#' cleanplots_colors("red", "navy")
#'
#' cleanplots_colors(bars = TRUE)
#' @export
cleanplots_colors <- function(..., bars = FALSE) {
  pal <- if (isTRUE(bars)) .cleanplots_bars else .cleanplots_main
  cols <- c(...)
  if (is.null(cols)) {
    return(pal)
  }
  unknown <- setdiff(cols, names(pal))
  if (length(unknown) > 0) {
    stop(
      "Unknown color name(s): ", paste(unknown, collapse = ", "),
      ". Available: ", paste(names(pal), collapse = ", "),
      call. = FALSE
    )
  }
  pal[cols]
}
