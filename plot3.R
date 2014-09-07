# plot3.R
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

# Convert date and time
y<-paste(as.character(x[,1]),as.character(x[,2]),sep=" ")
z<-strptime(y,format="%d/%m/%Y %H:%M:%S")
a<-cbind(dateTime=z,x)

# Plot lines
png(filename="plot3.png",width=480,height=480)
plot(a$dateTime,a$Sub_metering_1,col="black",type="l",xlab="",ylab="Energy sub metering")
lines(a$dateTime,a$Sub_metering_2,col="red")
lines(a$dateTime,a$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
dev.off()
