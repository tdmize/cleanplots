# cleanplots 0.2.0

* Initial release.
* `cleanplots_defaults()`: one-call session setup -- default theme,
  larger markers and thicker lines, cleanplots colors applied to all
  plots automatically, and `geom_smooth()` fit lines in cleanplots red.
* `theme_cleanplots()`: facet strips drawn as black-outlined, unfilled
  boxes with bold labels; legend at the right, vertically centered;
  default text size 12 (sized to match article body text at the
  recommended figure size).
* `cleanplots_save()`: save figures at a fixed 7 x 5 inches, 300 dpi,
  so plots look the same regardless of the plot window.
* Discrete color and fill scales (`scale_color_cleanplots()`,
  `scale_fill_cleanplots()`) with the main and bar/area palettes.
* Shape and linetype scales (`scale_shape_cleanplots()`,
  `scale_linetype_cleanplots()`) matching the Stata scheme's marker
  symbols and line patterns.
* `theme_cleanplots()` replicating the layout defaults of the Stata
  cleanplots graphing scheme (v1.0.4).
* `cleanplots_colors()` and `palette_cleanplots()` to extract hex codes.
