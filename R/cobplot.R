#' cobplot
#'
#' Plot dei saldi usando ggplot2
#'
#' usa una data.table con i saldi per reppresentare la curca dei saldi cumulati.
#'
#' @param saldo
#' la table che contiene i saldi da rappresentare. Tipicamente generata con la funzione saldi()
#' @param gruppo
#' la colonna che contiene la variabile di raggruppamento (ad esempio il genere)
#'
#' @return p, un grafico ggplot a linee
#'
#' @export
#'
#' @examples
#' cosaldi(eventi, inizio, fine, genere) |>
#'          cobplot(gruppo = genere)
#'
#' @import ggplot2

cobplot <- function(saldo = df, gruppo = genere) {
  p <- ggplot2::ggplot(saldo) +
    ggplot2::aes(x = data
                 , y = saldo_cumulato
                 , group = {{gruppo}}
                 , col = {{gruppo}}) +
    ggplot2::geom_line() +
    ggplot2::theme_minimal() +
    ggplot2::labs(x = "", y = ""
                  , title = "Saldi cumulati"
                  , subtitle = paste0("contratti avviati fra il "
                                      , min(saldo$data)
                                      , " e il "
                                      , max(saldo[avviati > 0, data])
                  )
                  , caption = "Elaborazioni Veneto Lavoro su dati COB Regione Veneto"
    )
  return(p)

}
