
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

plot1 <- read.csv("household_power_consumption.txt", sep = ";",header = TRUE)


# clean the data

plot1[plot1=="?"] <- NA
plot1 = na.omit(plot1)

png ("plot1.png", width = 480, height = 480)
hist (as.numeric(plot1$Global_active_power) , col = "red" , main = "Global Active Power",xlab = "Global Active Power(Kilowatts)", )	  
dev.off()