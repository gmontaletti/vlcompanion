#'  Eventi - eventi simulati
#'
#' un dataset che contiene  eventi simulati con un inizio, durata in giorni,
#' una fine e tre fattori (genere, settore e area geografica).
#'
#' Il dataset non è una ricostruzione realistica,
#' dato che tutti contratti simulati iniziano in un periodo specifico
#' e risultano tutti conclusi entrpo tre anni.
#' La struttura dele informazioni, generate casualmente,
#' riflette quella di un vero archivio di COB.
#'
#' @format Un data frame con 5000 righe and 7 variabili:
#' \describe{
#'   \item{cod}{codice della riga da 1 a 1000}
#'   \item{inizio}{data, inizio dell'evento}
#'   \item{fine}{data, fine dell'evento}
#'   \item{durata_giorni}{durata in giorni dell'evento da 1 a 365*3}
#'   \item{area}{area geografica: centro, nord-est, nord-ovest, sud e isole}
#'   \item{genere}{fattore con due livelli "M" e "F"}
#'   \item{settore}{fattore con tre livelli "agricoltura", "industria" e "servizi"}
#'
#' }
#'
"eventi"
