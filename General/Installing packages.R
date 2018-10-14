###############################################################################

## installing and loading of packages -----------------------------------------
for(my_package in c(
  
  "package_1",
  "package_2"

  
)){
  
  if(!(my_package %in% rownames(installed.packages()))){
    
    install.packages(
      my_package,
      dependencies = TRUE,
      repos = "http://cran.us.r-project.org"
    )
    
  }
  
  library(my_package, character.only = TRUE)
  
}

##-----------------------------------------------------------------------------

###############################################################################
