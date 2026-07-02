#' cleanplots color scales for ggplot2
#'
#' Discrete color and fill scales using the cleanplots color scheme
#' (Mize), a port of the colors from the Stata `cleanplots` graphing scheme.
#' The palette is designed for clean, publication-ready plots of predictions
#' and marginal effects.
#'
#' The `"default"` palette contains the 10 colors used for markers, lines,
#' and confidence intervals. The `"bars"` palette contains the softer,
#' lighter versions of the same colors that the Stata scheme uses for bar
#' charts, area plots, and pie charts (because those elements use much more
#' ink); it is typically paired with `scale_fill_cleanplots()`.
#'
#' The cleanplots palette is only available as a discrete palette.
#'
#' @param palette Character name of palette: `"default"` or `"bars"`.
#' @param reverse Logical. Should the palette be reversed?
#' @param order A vector of numbers from 1 to 10 indicating the order of
#'   colors to use (default: `1:10`).
#' @param aesthetics A vector of aesthetic names this scale should apply to
#'   (e.g., `"color"` or `"fill"`).
#' @param ... Additional arguments passed to [ggplot2::discrete_scale()].
#'
#' @references
#' Mize, T. D. cleanplots: Stata graphing scheme.
#' \url{https://www.trentonmize.com/software/cleanplots}
#'
#' @examples
#' library(ggplot2)
#'
#' ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
#'   geom_point(size = 2) +
#'   theme_cleanplots() +
#'   scale_color_cleanplots()
#'
#' ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
#'   geom_boxplot() +
#'   theme_cleanplots() +
#'   scale_fill_cleanplots(palette = "bars")
#'
#' # Use colors in a different order
#' ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
#'   geom_point(size = 2) +
#'   theme_cleanplots() +
#'   scale_color_cleanplots(order = c(7, 1, 2))
#' @export
scale_color_cleanplots <- function(palette = "default", reverse = FALSE,
                                   order = 1:10, aesthetics = "color", ...) {
  .discrete_scale_compat(
    aesthetics = aesthetics,
    palette = palette_cleanplots(palette = palette, reverse = reverse,
                                 order = order),
    ...
  )
}

#' @rdname scale_color_cleanplots
#' @export
scale_colour_cleanplots <- scale_color_cleanplots

#' @rdname scale_color_cleanplots
#' @export
scale_fill_cleanplots <- function(palette = "default", reverse = FALSE,
                                  order = 1:10, aesthetics = "fill", ...) {
  .discrete_scale_compat(
    aesthetics = aesthetics,
    palette = palette_cleanplots(palette = palette, reverse = reverse,
                                 order = order),
    ...
  )
}

# ggplot2 < 3.5.0 requires the (since-deprecated) `scale_name` argument to
# discrete_scale(); ggplot2 >= 3.5.0 does not accept passing it as missing.
.discrete_scale_compat <- function(...) {
  if (utils::packageVersion("ggplot2") >= "3.5.0") {
    ggplot2::discrete_scale(...)
  } else {
    ggplot2::discrete_scale(scale_name = "cleanplots", ...)
  }
}
