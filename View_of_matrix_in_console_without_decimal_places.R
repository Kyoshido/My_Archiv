###############################################################################

## View of matrix in console without decimal places
## funkce zobrazení matice v konzoli pro nuly bez desetinných míst

m <- matrix(c(
  0, 0, 0,
  0, 1.1, 1,
  0, 2.1, 1
), nrow = 3, byrow = TRUE)


printf <- function(x){
  
  # ---
  suppressWarnings(
    x[floor(x) == x] <- as.character(
      x[floor(x) == x]
    )
  )
  # ---  
  return(noquote(x))
  
}


m
print(m)
printf(m)

###############################################################################
