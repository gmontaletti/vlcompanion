saldi <- function(dati = df, data_inizio = inizio, data_fine = fine, classifica = classificatore
          ) {
  t <- merge(dati[, .(cessati = .N), .(data = data_fine + 1, classifica)]
             , dati[, .(avviati = .N), .(data = data_inizio, classifica)]
             , by.x = c("data", classifica)
             , by.y = c("data", classifica)
             , all = T)
  setkey(t, data)
  t[is.na(cessati), cessati := 0]
  t[is.na(avviati), avviati := 0]
  t[, saldo := avviati - cessati]
  t <- t[, saldo_cumulato := cumsum(saldo), nup_nome2]
  t <- t[data >= data_inizio & data <= as.IDate(data_fine)]
  return(t)
}
