test_that("la somma degli eventi = 1000", {
  expect_equal(nrow(eventi), 1000L)
})
test_that("la somma degli avviati torna", {
  expect_equal(nrow(eventi), sum(saldi(eventi, "inizio", "fine", "genere")$avviati, na.rm = TRUE))
})
test_that("la somma dei cessati torna", {
  expect_equal(nrow(eventi), sum(saldi(eventi, "inizio", "fine", "genere")$cessati, na.rm = TRUE))
})
