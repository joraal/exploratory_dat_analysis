

plot1 <- read.csv("household_power_consumption.txt", sep = ";",header = TRUE)


plot1[plot1=="?"] <- NA
plot1 = na.omit(plot1)

#---- subselect data

plot3 <- plot1[plot1$Date == "1/2/2007" | plot1$Date == "1/2/2007",]



# clean the data



plot3$Date <- as.Date(plot3$Date, "%d/%m/%Y")
plot3$Sub_metering_1 <- as.numeric(plot3$Sub_metering_1)
plot3$Sub_metering_2 <- as.numeric(plot3$Sub_metering_2)
plot3$Sub_metering_3 <- as.numeric(plot3$Sub_metering_3)


dateplot = paste(plot3$Date , plot3$Time, sep = " ")
dateplot = as.POSIXct(strptime(dateplot, "%Y-%m-%d %H:%M:%S"))


png(file="plot3.png",width=480,height=480)
plot(dateplot,as.numeric(plot3$Sub_metering_1), type="l", xlab="",ylab="Energy sub metering")
lines(dateplot,as.numeric(plot3$Sub_metering_2),col="red")
lines(dateplot,as.numeric(plot3$Sub_metering_3),col="blue")
legend("topright",lty=1,col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

	 
