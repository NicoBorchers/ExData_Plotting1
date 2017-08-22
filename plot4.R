# load necessary packages
library(lubridate)

# Set working directory
setwd("D:/Dropbox-Nico/Dropbox/Data Science/R/Exploratory Data Analysis/Week 1/ExData_Plotting1")

# read txt file inside zip. This code assumes that original zip file is contained in working directory
data <- read.table(unz("exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.txt"), header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

# manipulate data to construct DateTime variable
data$DateTime = dmy_hms(paste(data$Date, data$Time))

# filter data by desired dates
data2 <- subset(data, dmy(Date) == ymd("2007-02-01") | dmy(Date) == ymd("2007-02-02"))

# plot 4
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

plot(data2$DateTime, data2$Global_active_power, type = "n", xlab= "", ylab = "Global Active Power")
lines(data2$DateTime, data2$Global_active_power)

plot(data2$DateTime, data2$Voltage, type = "n", xlab= "datetime", ylab = "Voltage")
lines(data2$DateTime, data2$Voltage)

plot(data2$DateTime, data2$Sub_metering_1, type = "n", xlab= "", ylab = "Energy sub metering")
lines(data2$DateTime, data2$Sub_metering_1)
lines(data2$DateTime, data2$Sub_metering_2, col = "red")
lines(data2$DateTime, data2$Sub_metering_3, col = "blue")
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  lty=c(1,1,1), lwd=c(2.5,2.5),col=c("black", "red", "blue"))

plot(data2$DateTime, data2$Global_reactive_power, type = "n", xlab= "datetime", ylab = "Global_reactive_power")
lines(data2$DateTime, data2$Global_reactive_power)
dev.off()