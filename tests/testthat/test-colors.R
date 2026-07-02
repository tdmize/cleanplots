test_that("cleanplots_colors returns the full palettes", {
  expect_length(cleanplots_colors(), 10)
  expect_length(cleanplots_colors(bars = TRUE), 10)
  expect_named(cleanplots_colors(),
    c("red", "ltblue", "black", "gray", "purple", "pink", "navy",
      "ltgray", "dkgray", "lavender"))
})

test_that("cleanplots_colors selects colors by name", {
  expect_identical(unname(cleanplots_colors("red")), "#D50000")
  expect_identical(unname(cleanplots_colors("gray")), "#909090")
  expect_identical(unname(cleanplots_colors("navy", bars = TRUE)), "#5D7A93")
  expect_identical(names(cleanplots_colors("navy", "red")), c("navy", "red"))
})

test_that("cleanplots_colors errors on unknown names", {
  expect_error(cleanplots_colors("chartreuse"), "Unknown color")
})
