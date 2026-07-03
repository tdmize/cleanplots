#' cleanplots theme for ggplot2
#'
#' A ggplot2 theme that replicates the non-color settings of the Stata
#' `cleanplots` graphing scheme: white background, no plot-region border,
#' light gray (gs10) axis lines and ticks, dotted light gray horizontal and
#' vertical gridlines, and a frameless legend in the lower right.
#'
#' Correspondence to the Stata scheme file:
#' \itemize{
#'   \item White background (`color background white`)
#'   \item No plot region border (`linestyle plotregion none`)
#'   \item Axis lines, ticks in gs10 gray (`color axisline gs10`, etc.)
#'   \item Dotted gs10 major gridlines, horizontal and vertical
#'     (`draw_major_hgrid yes`, `draw_major_vgrid yes`,
#'     `linepattern major_grid dot`, `color major_grid gs10`)
#'   \item No minor gridlines
#'   \item Legend at the right, single column, no frame, no title
#'     (`clockdir legend_position 3`, `numstyle legend_cols 1`,
#'     `linestyle legend none`)
#'   \item Horizontal y-axis tick labels (`anglestyle vertical_tick
#'     horizontal`)
#'   \item Facet strips: black-outlined, unfilled boxes with bold labels
#' }
#'
#' @param base_size Base font size in points (default: `12`, sized to
#'   match the body text of an academic article when the figure is saved
#'   at 7 x 5 inches; see [cleanplots_save()]).
#' @param base_family Base font family (default: `""`).
#' @param legend_position Position of the legend (default: `"right"`,
#'   vertically centered). Set to `"none"` to remove, or any value
#'   accepted by `ggplot2::theme(legend.position = ...)`.
#'
#' @return A ggplot2 theme object.
#'
#' @examples
#' library(ggplot2)
#'
#' ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
#'   geom_point(size = 2) +
#'   theme_cleanplots() +
#'   scale_color_cleanplots()
#' @export
theme_cleanplots <- function(base_size = 12, base_family = "",
                             legend_position = "right") {
  gs10 <- "#A0A0A0" # Stata gs10, used for axis lines, ticks, and gridlines

  ggplot2::theme_bw(base_size = base_size, base_family = base_family) +
    ggplot2::theme(
      # White background, no plot-region border
      panel.background = ggplot2::element_rect(fill = "white", color = NA),
      plot.background = ggplot2::element_rect(fill = "white", color = NA),
      panel.border = ggplot2::element_blank(),

      # Axis lines and ticks: light gray (gs10)
      axis.line = ggplot2::element_line(color = gs10, linewidth = 0.4),
      axis.ticks = ggplot2::element_line(color = gs10, linewidth = 0.3),

      # Dotted gs10 major gridlines (both directions); no minor gridlines
      panel.grid.major = ggplot2::element_line(
        color = gs10, linewidth = 0.3, linetype = "dotted"
      ),
      panel.grid.minor = ggplot2::element_blank(),

      # Text: black; tick labels slightly smaller than axis titles
      text = ggplot2::element_text(color = "black"),
      axis.text = ggplot2::element_text(
        color = "black", size = ggplot2::rel(0.85)
      ),
      axis.title = ggplot2::element_text(size = ggplot2::rel(0.95)),

      # Legend: right, centered, no frame, no title
      legend.position = legend_position,
      legend.title = ggplot2::element_blank(),
      legend.background = ggplot2::element_blank(),
      legend.key = ggplot2::element_blank(),

      # Facet strips: black outline, no fill, bold labels
      strip.background = ggplot2::element_rect(
        fill = NA, color = "black", linewidth = 0.4
      ),
      strip.text = ggplot2::element_text(
        face = "bold", size = ggplot2::rel(0.95)
      )
    )
}
