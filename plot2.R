## Create the Global Active Power plot

## To execute this script you should set the working directory to where 
## you have the household_power_consumption.txt file 

file <- "household_power_consumption.txt"
start <- 66637 		## value I got from RecordsToRead.R
recordsToRead <- 2880 	## value I got from RecordToRead.R 

## Read first record, to get the headings
datos <- read.table(file, sep=";", na.string="?", header=TRUE, nrows=1)
columnnames <- names(datos)
## Read only records of interest 
datos <- read.table(file, sep=";", na.string="?", skip=start, nrows=recordsToRead)
names(datos) <- columnnames## Set up graphic device

## Set up graphic device
## Graphic will be generated on the same directory containing original data
## using deafult values for width and height 
png(filename="plot2.png", bg="transparent", type="windows") 

## Create x,y vectors 
dtchar <- paste(datos$Date,datos$Time)
dt <- strptime(dtchar, "%d/%m/%Y %T")
gap <- datos$Global_active_power
plot(dt, gap, type="l", xlab=" ", ylab="Global Active Power (kilowatts)")
dev.off()