#' Saldi
#'
#' genera una data table con i saldi fra avviamenti  e cessazioni per ogni giorno in cui si verifica almeno un evento
#'
#' @param dati
#' il data frame che contiene i dati
#' @param data_inizio
#' la variabile che contiene la data di inizio dell'evento
#' @param data_fine
#' la varibile che contiene la data di fine dell'evento
#' @param classifica
#' variabile che contiene la classificazione per la quale si generano i saldi
#'
#' @return
#' @export
#'
#' @examples
saldi <- function(dati = df, data_inizio = inizio, data_fine = fine, classifica = classificatore
          ) {
  data.table::setDT(dati)
  t <- data.table::merge.data.table(dati[, .(cessati = .N), .(data = data_fine + 1, classifica)]
             , dati[, .(avviati = .N), .(data = data_inizio, classifica)]
             , by.x = c("data", classifica)
             , by.y = c("data", classifica)
             , all = T)
  data.table::setkey(t, data)
  t[is.na(cessati), cessati := 0]
  t[is.na(avviati), avviati := 0]
  t[, saldo := avviati - cessati]
  t <- t[, saldo_cumulato := cumsum(saldo), nup_nome2]
  t <- t[data >= data_inizio & data <= as.IDate(data_fine)]
  return(t)
}
