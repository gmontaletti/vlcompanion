## code to prepare `DATASET` dataset goes here
nsample <- 5000
eventi <- data.frame(cod = 1:nsample
                 , inizio = as.Date(sample(as.Date("2020/01/01"):as.Date("2021/12/31")
                                           , nsample
                                           , replace = TRUE)
                                    , origin = "1970-01-01"
                 )
                 , genere = as.factor(sample(c("M", "F"), nsample, replace = TRUE))
                 , settore = as.factor(sample(c("agricoltura", "industria", "servizi"), nsample, replace = TRUE, prob = c(.05, .2, .75)))
                 , area = as.factor(sample(c("nord-est", "nord-ovest", "centro", "sud e isole"), nsample, replace = TRUE, prob = c(.30, .35, .15, .20)))
                 )
eventi$durata_giorni <- sample(1L:(365L * 3L), nsample, replace = TRUE)
eventi$fine = eventi$inizio + eventi$durata_giorni
# eventi[sample(1:nrow(eventi), 7), "fine"] <- NA
usethis::use_data(eventi, overwrite = TRUE)

