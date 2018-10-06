###############################################################################

for(
  my_file_name in dir()[
    (grepl(pattern = "ADR", dir()) & grepl("\\.csv$", dir())  
     # pokud bychom chtěli, aby byl vždy nějaký znak před a po "ADR", 
     # tak je regex tvaru pattern "^[:word:]+ADR[:word:]+\\.csv$"
     ]
    ){
      
      assign(
        gsub("\\.csv$", "", my_file_name),
        read.table(
          file = my_file_name,
          header = TRUE,
          colClasses = "character",
          sep = ";"
        )
      )
      
      flush.console()
      print(
        paste(
          "Proces nahrávání hotov z ",
          format(
            round(
              which(
                dir()[
                  grepl("\\ADR.csv$", dir())
                  ] == my_file_name
              ) / length(
                dir()[
                  grepl("\\ADR.csv$", dir())
                  ]
              ) * 100,
              digits = 2
            ),
            nsmall = 2
          ),
          " %.",
          sep = ""
        )
      )
      
    }
    
###############################################################################  
    
