## code to prepare `DATASET` dataset goes here
eventi <- data.frame(cod = 1:1000
                 , inizio = as.Date(sample(as.Date("2020/01/01"):as.Date("2020/12/31")
                                           , 1000
                                           , replace = TRUE)
                                    , origin = "1970-01-01"
                 )
                 , genere = as.factor(sample(c("M", "F"), 1000, replace = TRUE))
                 , settore = as.factor(sample(c("industria", "servizi"), 1000, replace = TRUE, prob = c(.2, .8))
                 ))
eventi$fine = eventi$inizio + sample(1:(365 * 1.79), 1000, replace = TRUE)
# eventi[sample(1:nrow(eventi), 7), "fine"] <- NA
usethis::use_data(eventi, overwrite = TRUE)

