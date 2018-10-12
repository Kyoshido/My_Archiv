###############################################################################

# Path:
"C:/Documents/Year/201806/Company/Analysis"


# List the Files in a Directory/Folder ----------------------------------------
dir()				
[1] "File1.csv" "File2.csv" 

# Base file (Last path location) ----------------------------------------------
basename(getwd())
[1] "Analysis"

# Path except file location of the file ---------------------------------------
dirname(getwd())
[1] "C:/Documents/Year/201806/Company"

# Structure of file path ------------------------------------------------------
strsplit(getwd(), "/")
[[1]]
[1] "C:"                      "Documents"                "Year" "201806"                  "Company"           "nbC_Liab_Life"          
[7] "Analysis"

# 4th part of structure
strsplit(getwd(), "/")[4]
[[1]]
NULL

strsplit(getwd(), "/")[[4]]
Error in strsplit(getwd(), "/")[[4]] : subscript out of bounds

strsplit(getwd(), "/")[[[4]]]
Error: unexpected '[' in "strsplit(getwd(), "/")[[["

strsplit(getwd(), "/")[[1]][4]   # Correct approach
[1] "201806"

# Begining of the path --------------------------------------------------------
head(strsplit(getwd(), "/")[[1]], 1)
[1] "C:"

# End of the path -------------------------------------------------------------

tail(strsplit(getwd(), "/")[[1]], 1)
[1] "Analysis"

# -----------------------------------------------------------------------------

###############################################################################
