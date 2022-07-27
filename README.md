
<!-- README.md is generated from README.Rmd. Please edit that file -->

# vlcompanion

<!-- badges: start -->
<!-- badges: end -->

Obiettivo di vlcompanion facilitare il calcolo di alcune statistiche
sulle COB e usare le funzioni per la creazione di dashboard.

## Installazione

Puoi installare al versione di sviluppo di vlcompanion da
[GitHub](https://github.com/) con:

``` r
# install.packages("devtools")
devtools::install_github("gmontaletti/vlcompanion")
```

## Esempi

La prima funzione `cosaldi()` calcola i saldi giornalieri fra avviamenti
e cessazioni e il saldo cumulato, usando una variabile come
raggruppamento.

Il risultato è una data table.

``` r
library(vlcompanion)
#> 
#> Attaching package: 'vlcompanion'
#> The following object is masked from 'package:graphics':
#> 
#>     coplot
cosaldi(eventi, inizio, fine, area) |> head()
#> Key: <data>
#>          data avviati cessati saldo saldo_cumulato        area
#>        <Date>   <int>   <int> <int>          <int>      <fctr>
#> 1: 2020-01-01       2       0     2              2      centro
#> 2: 2020-01-01       2       0     2              2    nord-est
#> 3: 2020-01-01       3       0     3              3  nord-ovest
#> 4: 2020-01-01       1       0     1              1 sud e isole
#> 5: 2020-01-02       1       0     1              3      centro
#> 6: 2020-01-02       6       0     6              8    nord-est
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/v1/examples>.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
