test_that("cleanplots_save writes a file at the fixed size", {
  p <- ggplot2::ggplot(iris,
         ggplot2::aes(Sepal.Length, Sepal.Width, color = Species)) +
    ggplot2::geom_point()
  f <- tempfile(fileext = ".png")
  cleanplots_save(f, p)
  expect_true(file.exists(f))
  # 7 x 5 inches at 300 dpi = 2100 x 1500 pixels
  hdr <- readBin(f, "raw", n = 24)
  w <- sum(as.integer(hdr[17:20]) * 256^(3:0))
  h <- sum(as.integer(hdr[21:24]) * 256^(3:0))
  expect_equal(w, 2100)
  expect_equal(h, 1500)
  unlink(f)
})
