## This script can be used to determine how many records 
## should be skipped to avoid reading the complete data set
## into memory. This script is considering the data set is
## ordered by Date.  

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

## Now determine how many records to read 	 
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

## The following can be used to read only the records related 
## to the dates of interest
  
## Read first record, to get the headings
data <- read.table(file, sep=";", na.string="?", header=TRUE, nrows=1)
columnnames <- names(data)
 
## Substitute start with the number of record previously printed 
## Substitute recordsToRead with the number of records prevously printed
  
## Read only records of interest 
data <- read.table(file, sep=";", na.string="?", skip=start, nrows=recordsToRead)
names(data) <- columnnames