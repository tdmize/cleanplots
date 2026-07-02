test_that("palette_cleanplots returns correct colors", {
  expect_identical(palette_cleanplots()(3), c("#D50000", "#8FC6EB", "#000000"))
  expect_identical(palette_cleanplots("bars")(1), "#FF4D4D")
  expect_identical(palette_cleanplots(reverse = TRUE)(1), "#D9D7F0")
  expect_identical(palette_cleanplots(order = c(7, 1))(2),
                   c("#143755", "#D50000"))
})

test_that("palette_cleanplots validates inputs", {
  expect_error(palette_cleanplots("neon"), "must be")
  expect_error(palette_cleanplots(order = 0:3), "between 1 and")
  expect_warning(palette_cleanplots()(11), "recycled")
})
