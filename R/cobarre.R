#' cobarre
#'
#' produce un grafico a barre degli eventi per una variabile di raggruppamento,
#' individuata come come colonna in un dataframe
#'
#' @param df
#' il dataframe o datatable che contiene gli eventi
#' @param gruppo
#' la  variabile (colonna) chge consente il raggruppamento
#'
#' @return p, un grafico ggplot a linee
#' @export
#'
#' @examples
#'
#'cobarre(df = eventi, gruppo = settore)
#'
cobarre <- function(df = eventi, gruppo = settore) {
  setDT(df)
  dff <- eval(substitute(df[, .N, gruppo]))

p <- ggplot(dff) +
  aes(x = reorder({{gruppo}}, N), y = N) +
  geom_col(col = "firebrick", fill = "firebrick") +
  labs(title = "Avviamenti"
       , y = "Numero"
       , x = ""
       # , subtitle = paste0("contratti avviati fra il "
       #                     , min(df$data_inizio)
       #                     , " e il "
       #                     , max(df$data_inizio)
       # )
       , caption = "Elaborazioni del mantainer su dati COB simulati"
  ) +
  theme_minimal() +
  coord_flip()

return(p)
  }
