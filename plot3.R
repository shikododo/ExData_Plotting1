options(stringsAsFactors=F)

#Read the data file (unz function is used to read single file from a zipped archive)
data <- read.table(unz("exdata-data-household_power_consumption.zip","household_power_consumption.txt"),
	sep=";",head=T,na.strings="?",colClasses=c("character","character",rep("numeric",7)))

#Subset the specified range
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

#Parse date and time into a new variable called "datetime" with POSIXlt format
data$datetime <- strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")


#Plot 3
#Open the png graphics device
png(file="plot3.png",width=480,height=480)
par(mfrow=c(1,1), mar=c(4,4,2,2))
plot(data$datetime,data$Sub_metering_1,type="n", xlab="",ylab="Energy sub metering")
lines(data$datetime,data$Sub_metering_1)
lines(data$datetime,data$Sub_metering_2,col="red")
lines(data$datetime,data$Sub_metering_3,col="blue")
legend("topright",bty="n",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#Close the device
dev.off()
