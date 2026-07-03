test_that("cleanplots_defaults sets theme, geoms, and scale options", {
  old_theme <- ggplot2::theme_get()
  old_opts <- options(ggplot2.discrete.colour = NULL,
                      ggplot2.discrete.fill = NULL)

  cleanplots_defaults()

  expect_identical(getOption("ggplot2.discrete.colour"),
                   scale_color_cleanplots)
  expect_true(is.function(getOption("ggplot2.discrete.fill")))
  pt <- ggplot2::GeomPoint$default_aes
  expect_equal(pt$size, 2)
  expect_equal(pt$stroke, 0.7)
  expect_equal(ggplot2::GeomLine$default_aes$linewidth, 0.75)
  sm <- ggplot2::GeomSmooth$default_aes
  expect_equal(sm$linewidth, 0.75)
  expect_equal(unclass(sm$colour)[[1]], "#D50000")

  # default color scale actually applies in a plot
  p <- ggplot2::ggplot(iris,
         ggplot2::aes(Sepal.Length, Sepal.Width, color = Species)) +
    ggplot2::geom_point()
  b <- ggplot2::ggplot_build(p)
  expect_setequal(unique(b$data[[1]]$colour),
                  c("#D50000", "#8FC6EB", "#000000"))

  # restore session state
  ggplot2::theme_set(old_theme)
  options(old_opts)
  ggplot2::update_geom_defaults("point", list(size = 1.5, stroke = 0.5))
  for (g in c("line", "path", "step"))
    ggplot2::update_geom_defaults(g, list(linewidth = 0.5))
  ggplot2::update_geom_defaults("smooth",
    list(linewidth = 1, colour = "#3366FF"))
  for (g in c("errorbar", "linerange", "pointrange"))
    ggplot2::update_geom_defaults(g, list(linewidth = 0.5))
})
