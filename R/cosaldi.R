#' cosaldi
#'
#' genera una data table con i saldi fra avviamenti  e cessazioni
#' per ogni giorno in cui si verifica almeno un evento.
#' accetta i parametri non quotati (senza le virgolette)
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
#' dsa <- cosaldi(eventi, inizio, fine, genere)
#'
cosaldi <- function(dati = df, data_inizio = inizio, data_fine = fine, gruppo = genere) {
  avviati <- cessati <- saldo <- saldo_cumulato <- as.integer(1L)
  setDT(dati)
  t1 <- eval(substitute(dati[, .(avviati = .N), .(data = data_inizio, n_gruppo = gruppo)]))
  t2 <- eval(substitute(dati[, .(cessati = .N), .(data = data_fine, n_gruppo = gruppo)]))
  setkeyv(t1, c("data", "n_gruppo"))
  setkeyv(t2, c("data", "n_gruppo"))
  t <- merge.data.table(t1, t2, all = TRUE)
  t <- t[!is.na(data)][!is.na(n_gruppo)]
  t[is.na(cessati), cessati := 0]
  t[is.na(avviati), avviati := 0]
  t[, saldo := avviati - cessati]
  setkeyv(t, c("data", "n_gruppo"))
  t <- t[, saldo_cumulato := cumsum(saldo), .(n_gruppo)]
  # eval(substitute(setnames(t, "n_gruppo", gruppo)))
  # setnames(t, "n_gruppo", quote(gruppo))
  eval(substitute(t[, gruppo := n_gruppo][, n_gruppo := NULL]))
  return(t)
}
