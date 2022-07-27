test_that("la somma degli eventi = 5000", {
  expect_equal(nrow(eventi), 5000L)
})
test_that("la somma degli avviati torna", {
  expect_equal(nrow(eventi), sum(cosaldi(eventi, inizio, fine, genere)$avviati, na.rm = TRUE))
})
test_that("la somma dei cessati torna", {
  expect_equal(nrow(eventi), sum(saldi(eventi, "inizio", "fine", "genere")$cessati, na.rm = TRUE))
})
