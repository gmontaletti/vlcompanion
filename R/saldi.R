#' Saldi
#'
#' genera una data table con i saldi fra avviamenti  e cessazioni
#' per ogni giorno in cui si verifica almeno un evento
#'
#' @param dati
#' il data frame che contiene i dati
#' @param data_inizio
#' la variabile che contiene la data di inizio dell'evento
#' @param data_fine
#' la varibile che contiene la data di fine dell'evento
#' @param gruppo
#' variabile che contiene i raggruppamementi per i quali si generano i saldi
#'
#' @details
#' La funzione gestisce anche i valori NA nelle date.
#' In questo caso il totale degli eventi viene modificato sottraendo
#' i casi con date NA dal conto di avvimenti e cessazioni.
#' Allo stesso modo dalla tavola dei saldi vengono rimosse le righe
#' che sono NA per le varibili di classificazione.
#'
#' @return t, una data.table con avviati, cessati, saldo
#' e saldo_cumulato per ogni giorno e per la variabile di raggruppamento
#' @export
#' @import data.table
#'
#' @examples
#' dsa <- saldi(eventi, "inizio", "fine", "genere")
#'
saldi <- function(dati = df, data_inizio = inizio, data_fine = fine, gruppo = genere
          ) {
  setDT(dati)
  avviati <- cessati  <- saldo <- saldo_cumulato <- as.integer(1L)
  t2 <- dati[, .(avviati = .N), by = c(data_inizio, gruppo)]
  setnames(t2, data_inizio, "data")
  t1 <- dati[, .(cessati = .N), by = c(data_fine, gruppo)]
  setnames(t1, data_fine, "data")

  t <- merge.data.table(t1, t2
             , by.x = c("data", gruppo)
             , by.y = c("data", gruppo)
             , all = T)
  data.table::setkey(t, data)
  t <- t[!is.na(data)][!is.na(get(gruppo))]
  t[is.na(cessati), cessati := 0]
  t[is.na(avviati), avviati := 0]
  t[, saldo := avviati - cessati]

  t <- t[, saldo_cumulato := cumsum(saldo), gruppo]
  return(t)
}
