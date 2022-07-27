test_that("la scala x delle barre non ha labels",{
  p <- saldi(eventi, "inizio", "fine", "genere") |> cobarre(gruppo = genere)
  expect_identical(p$labels$x, "")
})
