## Create the Global Active Power plot

## To execute this script you should set the working directory to where 
## you have the "household_power_consumption.txt" file 

file <- "household_power_consumption.txt"
start <- 66637 		## value I got from RecordsToRead.R
recordsToRead <- 2880 	## value I got from RecordToRead.R 

## Read first record, to get the headings
datos <- read.table(file, sep=";", na.string="?", header=TRUE, nrows=1)
columnnames <- names(datos)
## Read only records of interest 
datos <- read.table(file, sep=";", na.string="?", skip=start, nrows=recordsToRead)
names(datos) <- columnnames## Set up graphic device

## Graphic will be generated on the same directory containing original data
## using deafult values for width and height 
png(filename="plot1.png", bg="transparent", type="windows") 

## Create vector with required data 
gap <- datos$Global_active_power
hist(gap, main = "Global Active Power", xlab = "Global Active Power (kilowats)",  col="red") 
dev.off()


