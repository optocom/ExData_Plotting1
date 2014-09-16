# plot4.R
fUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
fzip <- "ePower.zip"
if (!file.exists(fzip)) download.file(fUrl,destfile=fzip)

fdata <- "household_power_consumption.txt"
if (!file.exists(fdata)) unzip(fzip)

# Read data from text file
x<-read.table(text = grep("^[1,2]/2/2007", readLines(fdata),value=TRUE), sep=";", na.strings="?", as.is=TRUE)
#x<-read.table(file=fdata,header=TRUE,sep=";",nrows=1)  # read header
#x<-read.table(file=fdata,col.names=names(x),
              header=FALSE,sep=";",nrows=4000,skip=66000)  # read data range
#x<-x[as.character(x$Date)=="1/2/2007"|as.character(x$Date)=="2/2/2007",] # keep 2 days only

# Convert date and time
y<-paste(as.character(x[,1]),as.character(x[,2]),sep=" ")
z<-strptime(y,format="%d/%m/%Y %H:%M:%S")
a<-cbind(dateTime=z,x)

# 4 plots in one panel(2 rows, 2 columns)
png(filename="plot4.png",width=480,height=480)
par(mfrow=c(2,2))  # two rows, two columns
par(mar=c(4,4,2,2)) # set margins
plot(a$dateTime,a$Global_active_power,type="l",xlab="",ylab="Global AcTive Power")
plot(a$dateTime,a$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(a$dateTime,a$Sub_metering_1,col="black",type="l",xlab="",ylab="Energy sub metering")
lines(a$dateTime,a$Sub_metering_2,col="red")
lines(a$dateTime,a$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),
       lty=1,bty="n")
plot(a$dateTime,a$Global_reactive_power,type="l",xlab="datetime",ylab="Global reactive power")
dev.off()
