###############################################################################

df <- fread("111_osoby_nab_vira_zduver_self_labeling.csv") # nahrání dat

df2 <- aggregate(POCET_OSOB ~ NAB_VIRA + SO, df, sum)  # sloučím pohlaví

# IF --------------------------------------------------------------------------

variable <- NULL      # dále vytvořím agregované kategorie
variable <- unlist(
  pblapply(
    1:dim(df2)[1],
    function(i){
      if (df2$NAB_VIRA[i] == "bez náboženské víry") {
        variable[i] <- "Bez víry"
      } else
        if (df2$NAB_VIRA[i] == "Ateismus") {
          variable[i] <- "Bez víry"
        } else
          if (df2$NAB_VIRA[i] == "věřící1") {
            variable[i] <- "Věřící"
          } else
            if (df2$NAB_VIRA[i] == "věřící2") {
              variable[i] <- "Věřící"
            } else
              if (df2$NAB_VIRA[i] == "nezjištěno") {
                variable[i] <- "nezjištěno"
              }
    }
  )
)
|++++++++++++++++++++++++++++++++++++++++++++++++++| 100% elapsed = 01m 11s

# -----------------------------------------------------------------------------

###############################################################################

# Switch ----------------------------------------------------------------------

variable1 <- NULL      # dále vytvořím agregované kategorie
variable1 <- unlist(
  pblapply(
    1:dim(df2)[1],
    function(i){
      switch(df2$NAB_VIRA[i],
             "bez náboženské víry" = "Bez víry",
             "Ateismus" = "Bez víry",
             "věřící1" = "Věřící",
             "věřící2" = "Věřící",
             "nezjištěno" = "nezjištěno")
    }
  )
)
|++++++++++++++++++++++++++++++++++++++++++++++++++| 100% elapsed = 01s

###############################################################################
