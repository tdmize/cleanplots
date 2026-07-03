#' Save a plot at cleanplots' recommended size
#'
#' A drop-in replacement for [ggplot2::ggsave()] with sensible fixed
#' defaults: 7 x 5 inches at 300 dpi. `ggsave()` without explicit
#' dimensions saves at the current size of your plot window, so figures
#' come out at a different size every time the window changes -- and all
#' text, marker, and line sizes are physical units, so the same plot can
#' look cramped or sparse depending on nothing but the window.
#' `cleanplots_save()` gives every figure the same canvas.
#'
#' The defaults are chosen for academic work: 7 x 5 inches matches the
#' default figure size in R Markdown (HTML) documents, and a 7-inch-wide
#' figure placed at the 6.5-inch text width of a US-letter manuscript
#' scales the default 12-point text to about 11 points -- comparable to
#' the article's own body text. The output format is inferred from the
#' file extension (`.png`, `.pdf`, `.tiff`, `.eps`, ...), so journal
#' submission formats work directly.
#'
#' @param filename File name to write to. The extension determines the
#'   format.
#' @param plot Plot to save (default: the last plot displayed).
#' @param width,height Plot dimensions in inches (default: `7` x `5`).
#' @param dpi Resolution for raster formats (default: `300`,
#'   print-quality).
#' @param ... Additional arguments passed to [ggplot2::ggsave()]
#'   (e.g., `bg`, `units`, `device`).
#'
#' @return Invisibly returns the file name.
#'
#' @examples
#' library(ggplot2)
#' p <- ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
#'   geom_point() +
#'   scale_color_cleanplots() +
#'   theme_cleanplots()
#'
#' f <- tempfile(fileext = ".png")
#' cleanplots_save(f, p)
#'
#' # Override any default as needed, e.g. for presentations and lectures:
#' cleanplots_save(f, p, width = 10, height = 5.6)
#' @export
cleanplots_save <- function(filename, plot = ggplot2::last_plot(),
                            width = 7, height = 5, dpi = 300, ...) {
  ggplot2::ggsave(
    filename, plot = plot,
    width = width, height = height, dpi = dpi, ...
  )
}
