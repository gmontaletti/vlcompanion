#' coplot
#'
#' Plot dei saldi usando ggplot2
#'
#' usa una data.table con i saldi per reppresentare la curca dei saldi cumulati.
#' @param saldo
#' la table che contiene i saldi da rappresentare. Tipicamente generata con la funzione saldi()
#' @param classificazione
#' la colonna che contiene la variabile di classificazione (ad esempio il genere)
#'
#' @return
#' @export
#'
#' @examples
#' saldi(eventi, "inizio", "fine", "genere") |>
#'          coplot(classificazione = genere)
#'
#' @import ggplot2
coplot <- function(saldo = df, classificazione = classif) {
ggplot2::ggplot(saldo) +
    ggplot2::aes(x = data
                 , y = saldo_cumulato
                 , group = {{classificazione}}
                 , col = {{classificazione}}) +
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
}
