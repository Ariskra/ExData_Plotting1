#loading the data
full_dataset <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = F)
full_dataset$Date <- as.Date(full_dataset$Date, "%d/%m/%Y")
data <- subset(full_dataset, Date >= "2007-02-01" & Date <= "2007-02-02")
data$Time <- paste(data$Date, data$Time)
library(dplyr)
data <- select(data, -1)
data$Time <- strptime(data$Time, "%Y-%m-%d %H:%M:%S")

#constructing and saving Plot 4
png("Plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
with(data, {
    plot(Time, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
    plot(Time, Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
    plot(Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
    lines(Time, Sub_metering_2, col = "red")
    lines(Time, Sub_metering_3, col = "blue")
    legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "), lty = c(1, 1), lwd = c(1, 1))
    plot(Time, Global_reactive_power, type = "l", ylab = "Global Reactive Power", xlab = "datetime")})
dev.off()