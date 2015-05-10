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
png(filename="plot3.png", bg="transparent", type="windows") 

## Create x and y series vectors 
dtchar <- paste(datos$Date,datos$Time)
dt <- strptime(dtchar, "%d/%m/%Y %T")
sm1 <- datos$Sub_metering_1
sm2 <- datos$Sub_metering_2
sm3 <- datos$Sub_metering_3

## Generate and annotate graphic
## Please observe that because my equipmenrt is configured in spanish the x 
## tickmarks values are in spanish 
plot(dt, sm1, type="l", col="black", xlab=" ", ylab="Energy sub metering")
lines(dt, sm2, type="l", col="red")
lines(dt, sm3, type="l", col="blue")
ltext <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
lcolor <- c("black", "red", "blue")
lpch <- c("_","_","_")
legend("topright", ltext, col=lcolor, pch=lpch)
dev.off() 