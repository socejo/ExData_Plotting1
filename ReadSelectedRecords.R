## This script documents how to read a limited set of records after you
## have ran the RecordsToRead.R script
  
file <- "household_power_consumption.txt"
start <- 66637 		## value got from RecordsToRead.R
recordsToRead <- 2880 	## value got from RecordToRead.R 

## Read first record, to get the headings
datos <- read.table(file, sep=";", na.string="?", header=TRUE, nrows=1)
columnnames <- names(datos)
 
## Read only records of interest 
datos <- read.table(file, sep=";", na.string="?", skip=start, nrows=recordsToRead)
names(datos) <- columnnames