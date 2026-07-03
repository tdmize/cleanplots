# Changelog

## cleanplots 0.2.0

- Initial release.
- [`cleanplots_defaults()`](https://tdmize.github.io/cleanplots/reference/cleanplots_defaults.md):
  one-call session setup – default theme, larger markers and thicker
  lines, cleanplots colors applied to all plots automatically, and
  [`geom_smooth()`](https://ggplot2.tidyverse.org/reference/geom_smooth.html)
  fit lines in cleanplots red.
- [`theme_cleanplots()`](https://tdmize.github.io/cleanplots/reference/theme_cleanplots.md):
  facet strips drawn as black-outlined, unfilled boxes with bold labels;
  legend at the right, vertically centered; default text size 12 (sized
  to match article body text at the recommended figure size).
- [`cleanplots_save()`](https://tdmize.github.io/cleanplots/reference/cleanplots_save.md):
  save figures at a fixed 7 x 5 inches, 300 dpi, so plots look the same
  regardless of the plot window.
- Discrete color and fill scales
  ([`scale_color_cleanplots()`](https://tdmize.github.io/cleanplots/reference/scale_color_cleanplots.md),
  [`scale_fill_cleanplots()`](https://tdmize.github.io/cleanplots/reference/scale_color_cleanplots.md))
  with the main and bar/area palettes.
- Shape and linetype scales
  ([`scale_shape_cleanplots()`](https://tdmize.github.io/cleanplots/reference/scale_shape_cleanplots.md),
  [`scale_linetype_cleanplots()`](https://tdmize.github.io/cleanplots/reference/scale_shape_cleanplots.md))
  matching the Stata scheme’s marker symbols and line patterns.
- [`theme_cleanplots()`](https://tdmize.github.io/cleanplots/reference/theme_cleanplots.md)
  replicating the layout defaults of the Stata cleanplots graphing
  scheme (v1.0.4).
- [`cleanplots_colors()`](https://tdmize.github.io/cleanplots/reference/cleanplots_colors.md)
  and
  [`palette_cleanplots()`](https://tdmize.github.io/cleanplots/reference/palette_cleanplots.md)
  to extract hex codes.
