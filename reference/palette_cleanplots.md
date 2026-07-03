# cleanplots color palette

Generate a palette function for the cleanplots color scheme. This
function is usually not called directly, but from within
[`scale_color_cleanplots()`](https://tdmize.github.io/cleanplots/reference/scale_color_cleanplots.md).

## Usage

``` r
palette_cleanplots(palette = "default", reverse = FALSE, order = 1:10, ...)
```

## Arguments

- palette:

  Character name of palette. One of `"default"` (the main colors used
  for markers, lines, and confidence intervals in the Stata cleanplots
  scheme) or `"bars"` (the softer, lighter versions the scheme uses for
  bar charts, area plots, and pie charts).

- reverse:

  Logical. Should the palette be reversed?

- order:

  A vector of numbers from 1 to 10 indicating the order of colors to use
  (default: `1:10`).

- ...:

  Ignored (included for compatibility).

## Value

A function that takes a single integer `n` and returns a character
vector of `n` hex colors.

## Examples

``` r
palette_cleanplots()(4)
#> [1] "#D50000" "#8FC6EB" "#000000" "#909090"

palette_cleanplots("bars")(3)
#> [1] "#FF4D4D" "#C2E0F5" "#5F5F5F"
```
