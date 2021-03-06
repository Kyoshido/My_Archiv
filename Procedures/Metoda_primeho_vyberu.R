###############################################################################

## The goal is to sort a vector from the smallest to the biggest, 
## without sort function.
# Cil setridit vektor od mensi po nejvetsi, bez pouziti funkce sort.

# -----------------------------------------------------------------------------

# Metoda primeho vyberu

## sekvence 2 1 4 5 3 
## ptam se, je 1 mensi nez 2 (ANO), 
## je 4 mensi nez 2 (NE), 
## je 5 mensi nez 2 (NE), 
## 3 mensi nez 2 (NE) -> prohodim 1 s 2
## proces opakuji


x <- c(2,1,4,5,3)
n <- length(x)
for (i in 1:n){
    mi <-i
    for (j in i:n){
      if (x[j] < x[mi]){
        mi <- j
        }
      }
    y = x[i];
    x[i] = x[mi];
    x[mi] = y
}
print(x)

###############################################################################
