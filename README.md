# cleanplots for R

<!-- badges: start -->
[![R-CMD-check](https://github.com/tdmize/cleanplots/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/tdmize/cleanplots/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Full documentation: [tdmize.github.io/cleanplots](https://tdmize.github.io/cleanplots/)

Color scales and a theme for **ggplot2** implementing the
[cleanplots](https://www.trentonmize.com/software/cleanplots) graphing
scheme by Trenton D. Mize, originally developed for Stata. The scheme is
designed for clean, publication-ready default plots — particularly plots
of predictions and marginal effects.

## Installation

```r
# install.packages("remotes")
remotes::install_github("tdmize/cleanplots")
```

## Usage

The quickest way to use cleanplots is one setup call, which mirrors how
the Stata scheme works: it sets the theme, makes markers and lines
larger and thicker, and applies the cleanplots colors to all plots by
default (main palette for `color`, softer bar palette for `fill`):

```r
library(ggplot2)
library(cleanplots)
cleanplots_defaults()

ggplot(mpg, aes(displ, hwy, color = class, shape = class)) +
  geom_point() +
  scale_shape_cleanplots()
```

Or apply the pieces individually per plot:

```r
library(ggplot2)
library(cleanplots)

# Scatterplot with the main palette and theme
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point(size = 2) +
  theme_cleanplots() +
  scale_color_cleanplots()

# Bar charts use the softer bar/area palette
ggplot(mpg, aes(x = class, fill = drv)) +
  geom_bar(position = "dodge") +
  theme_cleanplots() +
  scale_fill_cleanplots(palette = "bars")

# Reorder or reverse the colors
scale_color_cleanplots(order = c(7, 1, 2))
scale_color_cleanplots(reverse = TRUE)

# Extract hex codes directly
cleanplots_colors()
cleanplots_colors("red", "navy")
cleanplots_colors(bars = TRUE)
```

![](man/figures/preview.png)

## The palettes

**Main colors** (`palette = "default"`) — used for markers, lines, and
confidence intervals in the Stata scheme:

| # | Name | Hex | Stata definition |
|---|----------|-----------|------------------|
| 1 | red | `#D50000` | `red*1.2` |
| 2 | ltblue | `#8FC6EB` | `eltblue*.9` |
| 3 | black | `#000000` | `black` |
| 4 | gray | `#909090` | `gs9` |
| 5 | purple | `#740074` | `purple*1.1` |
| 6 | pink | `#FFB3D9` | `pink*.3` |
| 7 | navy | `#143755` | `navy*1.3` |
| 8 | ltgray | `#C0C0C0` | `gs12` |
| 9 | dkgray | `#404040` | `gs4` |
| 10 | lavender | `#D9D7F0` | `lavender*.35` |

**Bar/area colors** (`palette = "bars"`) — the softer versions the Stata
scheme uses for bar charts, area plots, and pie charts, as rendered with
the scheme's default `intensity bar 70` (30% fade toward white):

| # | Name | Hex | Stata definition |
|---|----------|-----------|------------------|
| 1 | red | `#FF4D4D` | `red` @ 70% |
| 2 | ltblue | `#C2E0F5` | `eltblue*.7` @ 70% |
| 3 | black | `#5F5F5F` | `black*.9` @ 70% |
| 4 | gray | `#B1B1B1` | `gs9` @ 70% |
| 5 | purple | `#AF5FAF` | `purple*.9` @ 70% |
| 6 | pink | `#FFDBEE` | `pink*.2` @ 70% |
| 7 | navy | `#5D7A93` | `navy*1.1` @ 70% |
| 8 | ltgray | `#D3D3D3` | `gs12` @ 70% |
| 9 | dkgray | `#909090` | `gs6` @ 70% |
| 10 | lavender | `#E8E7F6` | `lavender*.3` @ 70% |

## The theme

`theme_cleanplots()` replicates the non-color settings of the Stata
scheme: white background, no plot-region border, light gray axis lines
and ticks, dotted light gray gridlines in both directions, and a
frameless, untitled legend at the lower right. To restore a legend title:

```r
theme_cleanplots() + theme(legend.title = element_text())
```

## Shapes and line patterns

The Stata scheme also sets default marker symbols and line patterns,
which make series distinguishable in black & white and under
colorblindness. Use `scale_shape_cleanplots()` and
`scale_linetype_cleanplots()` to get the same behavior in ggplot2:

```r
# Markers: hollow shapes for dark colors, solid for light colors
ggplot(iris, aes(Sepal.Length, Sepal.Width,
                 color = Species, shape = Species)) +
  geom_point(size = 2) +
  theme_cleanplots() +
  scale_color_cleanplots() +
  scale_shape_cleanplots()

# Line patterns: solid, solid, dashed, dashed, shortdash, shortdash,
# longdash, longdash -- same-pattern series always differ in lightness
ggplot(df, aes(x, y, color = group, linetype = group)) +
  geom_line() +
  theme_cleanplots() +
  scale_color_cleanplots() +
  scale_linetype_cleanplots()
```

## Design goals

The palette alternates dark and light colors so the first several
series are distinguishable by lightness alone when printed in black &
white, contains no red-green pair, and passes deuteranopia,
protanopia, and tritanopia simulation checks for the first five colors
(minimum Delta-E of about 21). Beyond 4-5 series, add
`scale_shape_cleanplots()` (points) or `scale_linetype_cleanplots()`
(lines): shapes and patterns are assigned so that any two series
sharing a shape or pattern always differ strongly in lightness.
Check the palette yourself at
[Coloring for Colorblindness](https://davidmathlogic.com/colorblind/#%23D50000-%238FC6EB-%23000000-%23909090-%23740074-%23FFB3D9-%23143755-%23C0C0C0-%23404040-%23D9D7F0).

## Stata version

The original Stata scheme is available at
<https://www.trentonmize.com/software/cleanplots> or via
`net install cleanplots, from("https://tdmize.github.io/data/cleanplots") replace`.
