test_that("la scala y non ha labels",{
  p <- saldi(eventi, "inizio", "fine", "genere") |> coplot(classificazione = genere)
  expect_identical(p$labels$y, "")
})
