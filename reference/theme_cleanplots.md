# cleanplots theme for ggplot2

A ggplot2 theme that replicates the non-color settings of the Stata
`cleanplots` graphing scheme: white background, no plot-region border,
light gray (gs10) axis lines and ticks, dotted light gray horizontal and
vertical gridlines, and a frameless legend in the lower right.

## Usage

``` r
theme_cleanplots(base_size = 13, base_family = "", legend_position = "right")
```

## Arguments

- base_size:

  Base font size in points (default: `13`).

- base_family:

  Base font family (default: `""`).

- legend_position:

  Position of the legend (default: `"right"`, bottom-justified, matching
  the Stata scheme's 4-o'clock position). Set to `"none"` to remove, or
  any value accepted by `ggplot2::theme(legend.position = ...)`.

## Value

A ggplot2 theme object.

## Details

Correspondence to the Stata scheme file:

- White background (`color background white`)

- No plot region border (`linestyle plotregion none`)

- Axis lines, ticks in gs10 gray (`color axisline gs10`, etc.)

- Dotted gs10 major gridlines, horizontal and vertical
  (`draw_major_hgrid yes`, `draw_major_vgrid yes`,
  `linepattern major_grid dot`, `color major_grid gs10`)

- No minor gridlines

- Legend at lower right, single column, no frame, no title
  (`clockdir legend_position 4`, `numstyle legend_cols 1`,
  `linestyle legend none`)

- Horizontal y-axis tick labels (`anglestyle vertical_tick horizontal`)

- Facet strips: black-outlined, unfilled boxes with bold labels

## Examples

``` r
library(ggplot2)

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point(size = 2) +
  theme_cleanplots() +
  scale_color_cleanplots()
```
