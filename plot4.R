## Create the Global Active Power plot

## To execute this script you should set the working directory to where 
## you have the household_power_consumption.txt file 

## Read complete data set and subset data for dates of interest  
file <- "household_power_consumption.txt"
datos <- read.table(file, sep=";", header=TRUE, na.string="?")
seleccion <- (datos$Date == "1/2/2007" | datos$Date == "2/2/2007")
datos <- datos[seleccion,] 

## Set up graphic device
## Graphic will be generated on the same directory containing original data
## using deafult values for width and height 
png(filename="plot4.png", bg="transparent", type="windows") 

## Please observe that because my equipmenrt is configured in spanish the x 
## tickmarks values are in spanish 

## Set up multiple graphics per page 
par(mfrow = c(2,2))

## Create required vectors for first graphics
dtchar <- paste(datos$Date,datos$Time)
dt <- strptime(dtchar, "%d/%m/%Y %T")
gap <- datos$Global_active_power
plot(dt, gap, type="l", xlab=" ", ylab="Global Active Power")

## Create additional vector for second graphic
v <- datos$Voltage
plot (dt, v, type="l", xlab="datetime", ylab="Voltage")

## Create additional series vectors for third graphic
## and generate and annotate graphic
sm1 <- datos$Sub_metering_1
sm2 <- datos$Sub_metering_2
sm3 <- datos$Sub_metering_3
plot(dt, sm1, type="l", col="blue", xlab=" ", ylab="Energy sub metering")
lines(dt, sm2, type="l", col="green")
lines(dt, sm3, type="l", col="red")
ltext <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
lcolor <- c("blue", "green", "red")
lpch <- c("_","_","_")
legend("topright", ltext, col=lcolor, pch=lpch, bty="n") 

## Create additional vector for fourth graphic 
grp <- datos$Global_reactive_power
plot (dt, grp, type="l", ylab="Gloabla_reactive_power", xlab="datetime")
dev.off()
