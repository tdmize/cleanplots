test_that("scales return ggplot2 scale objects", {
  expect_s3_class(scale_color_cleanplots(), "ScaleDiscrete")
  expect_s3_class(scale_colour_cleanplots(), "ScaleDiscrete")
  expect_s3_class(scale_fill_cleanplots(), "ScaleDiscrete")
  expect_s3_class(scale_shape_cleanplots(), "ScaleDiscrete")
  expect_s3_class(scale_linetype_cleanplots(), "ScaleDiscrete")
  expect_s3_class(theme_cleanplots(), "theme")
})

test_that("scales apply the palette in a plot", {
  p <- ggplot2::ggplot(iris,
         ggplot2::aes(Sepal.Length, Sepal.Width, color = Species)) +
    ggplot2::geom_point() +
    scale_color_cleanplots()
  b <- ggplot2::ggplot_build(p)
  expect_setequal(unique(b$data[[1]]$colour),
                  c("#D50000", "#8FC6EB", "#000000"))
})
