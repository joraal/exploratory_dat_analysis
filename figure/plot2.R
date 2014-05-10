

plot1 <- read.csv("household_power_consumption.txt", sep = ";",header = TRUE)


# clean the data

plot1[plot1=="?"] <- NA
plot1 = na.omit(plot1)



#---- new plot

plot2 <- plot1[plot1$Date == "2007-02-01" | plot1$Date == "2007-02-02",]

plot2$Date <- as.Date(plot2$Date, "%d/%m/%Y")
plot2$Global <- as.numeric(plot2$Global_active_power)

dateplot = paste(plot2$Date , plot2$Time, sep = " ")
dateplot = as.POSIXct(strptime(dateplot, "%Y-%m-%d %H:%M:%S"))

png ("plot2.png", width = 480, height = 480)

plot(dateplot,as.numeric(plot2$Global_active_power), type="o", pch = '.',     ylab = "Global_active_power(Kilowatts)")
dev.off()