###############################################################################

# Collatzuv problem -----------------------------------------------------------

# Vytvori skript, jehoz argumentem je libovolne kladne cislo a vygenerujte 
# sekvenci jako je v Collatzove hypoteze koncici 1
# Kdyz delitelne 2 tak ho vydelim a sepisu vysledek, kdyz neni tak vynasobimm 2
# a prictu 1


x <-  sample(1:100, 1)

print(x)

while (x >1){
  if (x %% 2 ==0){
    x <- x/2
    print(x)
  }
  else if (x %% 2 ==1){
    x <- 3*x+1
    print(x)
  }
}

# -----------------------------------------------------------------------------

###############################################################################
