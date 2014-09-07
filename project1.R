# project 1
fUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
fzip <- "ePower.zip"
if (!file.exists(fzip)) download.file(fUrl,destfile=fzip)
fdata <- "household_power_consumption.txt"
if (!file.exists(fdata) unzip(fzip)

x<-read.table(file=fdata,header=TRUE,sep=";",nrows=1)  # read header
x<-read.table(file=fdata,col.names=names(x),
              header=FALSE,sep=";",nrows=4000,skip=66000)  # read data range
x<-x[as.character(x$Date)=="1/2/2007"|as.character(x$Date)=="2/2/2007",]

y<-paste(as.character(x[,1]),as.character(x[,2]),sep=" ")
z<-strptime(y,format="%d/%m/%Y %H:%M:%S")
