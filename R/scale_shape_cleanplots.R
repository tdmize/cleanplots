# Marker shapes matching the Stata cleanplots scheme (symbol p1-p10):
# hollow circle, solid circle, hollow square, solid square,
# hollow triangle, solid triangle, hollow diamond, solid diamond,
# plus, plus.
# Dark colors get hollow markers and light colors get solid markers, so
# markers sharing a shape (p1/p2, p3/p4, ...) always differ strongly in
# lightness.
.cleanplots_shapes <- c(1, 16, 0, 15, 2, 17, 5, 18, 3, 3)

# Line patterns matching the scheme (linepattern p1line-p10line):
# solid, solid, dashed, dashed, shortdash, shortdash, longdash,
# longdash, solid, solid.
# Series sharing a line pattern (p1/p2, p3/p4, p5/p6, p7/p8) always
# differ strongly in lightness, so line-only plots remain readable in
# black & white and under colorblindness. "22" is a short dash.
.cleanplots_linetypes <- c(
  "solid", "solid", "dashed", "dashed", "22", "22",
  "longdash", "longdash", "solid", "solid"
)

#' cleanplots shape and linetype scales for ggplot2
#'
#' Discrete shape and linetype scales matching the marker symbols and
#' line patterns of the Stata cleanplots scheme. Combined with
#' [`scale_color_cleanplots()`][scale_color_cleanplots], these make
#' series distinguishable even when printed in black & white or viewed
#' with colorblindness: markers alternate hollow (dark colors) and solid
#' (light colors) shapes, and series that share a line pattern always
#' differ strongly in lightness.
#'
#' @param ... Additional arguments passed to
#'   [ggplot2::scale_shape_manual()] or
#'   [ggplot2::scale_linetype_manual()].
#'
#' @examples
#' library(ggplot2)
#'
#' ggplot(iris, aes(Sepal.Length, Sepal.Width,
#'                  color = Species, shape = Species)) +
#'   geom_point(size = 2) +
#'   theme_cleanplots() +
#'   scale_color_cleanplots() +
#'   scale_shape_cleanplots()
#'
#' ggplot(economics_long, aes(date, value01,
#'                            color = variable, linetype = variable)) +
#'   geom_line() +
#'   theme_cleanplots() +
#'   scale_color_cleanplots() +
#'   scale_linetype_cleanplots()
#' @export
scale_shape_cleanplots <- function(...) {
  ggplot2::scale_shape_manual(values = .cleanplots_shapes, ...)
}

#' @rdname scale_shape_cleanplots
#' @export
scale_linetype_cleanplots <- function(...) {
  ggplot2::scale_linetype_manual(values = .cleanplots_linetypes, ...)
}
