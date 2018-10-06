###############################################################################
###############################################################################
###############################################################################

## instaluji a loaduji balíček ------------------------------------------------

for(my_package in c(
    
    "sqldf"
    
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


## ----------------------------------------------------------------------------

###############################################################################

## nastavuji pracovní složku --------------------------------------------------

while(!"script.R" %in% dir()){
    setwd(choose.dir())
}

mother_working_directory <- getwd()


## ----------------------------------------------------------------------------

###############################################################################

## nahrávám tabulky -----------------------------------------------------------

setwd(paste(mother_working_directory, "tabulky", sep = "/"))

for(my_filename in dir()){
    
    my_data <- read.table(
        file = my_filename,
        header = TRUE,
        sep = ";",
        colClasses = "character",
        encoding = "UTF-8",
        na.strings = "NULL"
    )
    
    for(i in 1:dim(my_data)[2]){
        my_data[which(my_data[, i] == ""), i] <- NA
    }
    
    assign(
        gsub(
            ".csv",
            "",
            my_filename
        ),
        my_data
    )
    
}

setwd(mother_working_directory)


## ----------------------------------------------------------------------------

###############################################################################
###############################################################################
###############################################################################

## zkouším SQL dotazy ---------------------------------------------------------

#### Jaké unikátní funkce se vyskytují u zaměstnanců?

sqldf("
    SELECT DISTINCT ZAMESTNANEC.fce
    FROM ZAMESTNANEC;
")


#### Vypište seznam projektů, které se alespoň podle názvu týkají dat.

sqldf("
    SELECT PROJEKT.nazev_t_projektu
    FROM PROJEKT
    WHERE PROJEKT.nazev_t_projektu LIKE '%at%';
")


#### Vypište jména a příjmení analytiků I a II s názvy jejich úkolů.

sqldf("
    SELECT ZAMESTNANEC.jmeno,
           ZAMESTNANEC.prijmeni,
           UKOLY.nazev AS 'nazev_ukolu'
    FROM ZAMESTNANEC
    LEFT JOIN RESENI ON (ZAMESTNANEC.os_cis = RESENI.os_cis)
    LEFT JOIN UKOLY ON (RESENI.cislo = UKOLY.cislo)
    WHERE ZAMESTNANEC.fce in ('ANALYTIK I.', 'ANALYTIK II.');
")


#### Vypište jména a příjmení zaměstnanců, kteří mají nějaký titul,
#### a výsledek seřaďte abecedně

sqldf("
    SELECT ZAMESTNANEC.jmeno,
           ZAMESTNANEC.prijmeni,
           ZAMESTNANEC.titul
    FROM ZAMESTNANEC
    WHERE ZAMESTNANEC.titul IS NOT NULL
    ORDER BY ZAMESTNANEC.prijmeni ASC,
             ZAMESTNANEC.jmeno ASC;
")


#### Kolik je mezi zaměstnanci žen?

sqldf("
    SELECT count(ZAMESTNANEC.pohlavi)
    FROM ZAMESTNANEC
    WHERE ZAMESTNANEC.pohlavi = 'Z';
")


#### Pro každý projekt vypište počet funkcí, které na něm pracují.

sqldf("
    SELECT PROJEKT.kod,
           PROJEKT.nazev_t_projektu,
           count(DISTINCT ZAMESTNANEC.fce) AS 'funkce'
    FROM PROJEKT
    LEFT JOIN UKOLY ON (UKOLY.kod = PROJEKT.kod)
    LEFT JOIN RESENI ON (RESENI.cislo = UKOLY.cislo)
    LEFT JOIN ZAMESTNANEC ON (ZAMESTNANEC.os_cis = RESENI.os_cis)
    GROUP BY PROJEKT.kod,
             PROJEKT.nazev_t_projektu
    ORDER BY PROJEKT.kod;
")


## ----------------------------------------------------------------------------

###############################################################################
###############################################################################
###############################################################################





