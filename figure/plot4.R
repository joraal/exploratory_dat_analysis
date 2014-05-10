



plot1 <- read.csv("household_power_consumption.txt", sep = ";",header = TRUE)


# clean the data

plot1[plot1=="?"] <- NA
plot1 = na.omit(plot1)


#---- subselect data

plot4 <- plot1[plot1$Date == "1/2/2007" | plot1$Date == "1/2/2007",]



plot4$Date <- as.Date(plot4$Date, "%d/%m/%Y")
plot4$Global <- as.numeric(plot4$Global_active_power)

dateplot = paste(plot4$Date , plot4$Time, sep = " ")
dateplot = as.POSIXct(strptime(dateplot, "%Y-%m-%d %H:%M:%S"))

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))
plot(dateplot,plot4$Global_active_power, type='o',pch ='.',ylab= "Global Active Power", xlab = "")
plot(dateplot,plot4$Voltage, type='o',pch ='.',ylab= "Voltage", xlab = "datetime")

plot(dateplot,plot4$Sub_metering_1, type='o',pch ='.',ylab= "Energy submetering", xlab = "")

points (dateplot , plot4$Sub_metering_2 , type='o' , pch ='.',col="red")
points (dateplot , plot4$Sub_metering_3 , type='o' , pch ='.', col= "blue")

legend ("topright", c("Sub_metering_1", "Sub_metering_2","Sub_Metering_3"), col = c("black","red","blue"), lty = c(1,1),lwd = c(2.5,2.5), cex=0.6,bty="n")


plot(dateplot,plot4$Global_reactive_power, type='o',pch ='.',ylab= "Global_Reactive_power", xlab = "datetime")


dev.off()