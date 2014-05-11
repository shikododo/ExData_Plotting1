options(stringsAsFactors=F)

#Read the data file (unz function is used to read single file from a zipped archive)
data <- read.table(unz("exdata-data-household_power_consumption.zip","household_power_consumption.txt"),
	sep=";",head=T,na.strings="?",colClasses=c("character","character",rep("numeric",7)))

#Subset the specified range
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

#Parse date and time into a new variable called "datetime" with POSIXlt format
data$datetime <- strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")


#Plot 1
#Open the png graphics device
png(file="plot1.png",width=480,height=480)
#Plot the desired graph
hist(data$Global_active_power, main="Global Active Power",
	 xlab="Global Active Power (kilowatts)",col="red")
#Close the device
dev.off()