###############################################################################

# Detection of duplicates -----------------------------------------------------

data$Is_duplicate <- ave(data$column, 
                         data$column, 
                         FUN = length) > 1L 

# -----------------------------------------------------------------------------

###############################################################################