test_that("la somma degli eventi sia uguale al conto in saldi", {
  expect_equal(nrow(eventi), sum(cosaldi(eventi, inizio, fine, genere)$avviati))
})
test_that("la somma degli avviati torna", {
  expect_equal(nrow(eventi), sum(cosaldi(eventi, inizio, fine, genere)$avviati, na.rm = TRUE))
})
test_that("la somma dei cessati torna", {
  expect_equal(nrow(eventi), sum(saldi(eventi, "inizio", "fine", "genere")$cessati, na.rm = TRUE))
})
