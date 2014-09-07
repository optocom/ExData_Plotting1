# Plot 1
fUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
fzip <- "ePower.zip"
if (!file.exists(fzip)) download.file(fUrl,destfile=fzip)

fdata <- "household_power_consumption.txt"
if (!file.exists(fdata)) unzip(fzip)

# Read data from text file
x<-read.table(file=fdata,header=TRUE,sep=";",nrows=1)  # read header
x<-read.table(file=fdata,col.names=names(x),
              header=FALSE,sep=";",nrows=4000,skip=66000)  # read data range
x<-x[as.character(x$Date)=="1/2/2007"|as.character(x$Date)=="2/2/2007",] # keep 2 days only

# histogram
png(filename="plot1.png",width=480,height=480)
hist(x[,3],col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off()


