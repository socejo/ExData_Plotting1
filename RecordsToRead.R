## This script can be used to determine how many records 
## should be skipped to avoid reading the complete data set
## into memory, and how many records to read from there.

## The script is considering the data set is ordered by Date.

## 1. Save this script on your PC
## 2. Set the working directory where you have the original data set
## 3. Source the script into R
## 4. Take note of the numbers the script generates

file <- "household_power_consumption.txt"
count <- 1
skiped <- 0 	
while (count<220){
## read and check bunches of 10,000 records 
data<-read.table(file, sep=";", skip=skiped, nrows=10000)
 for (j in 1:10000) { 
	if (data[j,1] == "1/2/2007" | data[j,1] == "2/2/2007") {
		start = skiped + j - 1
		print(paste("When reading use  skip=", start, sep=""))
		count <- 220
		break}
	}
skiped <- skiped + 10000
count <- count+1
}

## Now this script determines how many records to read, following the same 
## structure 	 
count <- 1
skiped <- start 	
while (count<220){
## read and check bunches of 10,000 records 
 data<-read.table(file, sep=";", skip=skiped, nrows=10000)
 for (j in 1:10000) { 
	if (data[j,1] == "3/2/2007") {
		recordsToRead = j - 1
		print(paste("and               nrows=", recordsToRead, sep=""))
		count <- 220
		break}
	}
skiped <- skiped + 10000
count <- count+1
}