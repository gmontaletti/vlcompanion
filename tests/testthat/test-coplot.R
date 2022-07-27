test_that("la scala y non ha labels",{
  p <- saldi(eventi, "inizio", "fine", "genere") |> coplot(gruppo = genere)
  expect_identical(p$labels$y, "")
})
