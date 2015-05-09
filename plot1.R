## Create the Global Active Power plot

## To execute this script you should set the working directory to where 
## you have the "household_power_consumption.txt" file 

## Read complete data set and subset data for dates of interest  
file <- "household_power_consumption.txt"
datos <- read.table(file, sep=";", header=TRUE, na.string="?")
seleccion <- (datos$Date == "1/2/2007" | datos$Date == "2/2/2007")
datos <- datos[seleccion,] 

## Set up graphic device
## Graphic will be generated on the same directory containing original data
## using deafult values for width and height 
png(filename="plot1.png", bg="transparent", type="windows") 

## Create vector with required data 
gap <- datos$Global_active_power
hist(gap, main = "Global Active Power", xlab = "Global Active Power (kilowats",  col="red") 
dev.off()


