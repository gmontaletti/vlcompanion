test_that("i dati usati sono giusti", {
  cosaldi(eventi, gruppo = settore) |> cobplot(settore) -> p
  cosaldi(eventi, gruppo = settore) -> sett
expect_identical(p$data, sett)
})

test_that("i dati usati sono giusti", {
  cosaldi(eventi, gruppo = settore) |> cobplot(settore) -> p
  expect_identical(p$labels$x, "")
})
