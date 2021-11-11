#loading the data
full_dataset <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = F)
full_dataset$Date <- as.Date(full_dataset$Date, "%d/%m/%Y")
data <- subset(full_dataset, Date >= "2007-02-01" & Date <= "2007-02-02")
data$Time <- paste(data$Date, data$Time)
library(dplyr)
data <- select(data, -1)
data$Time <- strptime(data$Time, "%Y-%m-%d %H:%M:%S")

#constructing and saving Plot 3
png("Plot3.png", width = 480, height = 480)
with(data, plot(Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(data, lines(Time, Sub_metering_2, col = "red"))
with(data, lines(Time, Sub_metering_3, col = "blue"))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "), lty = c(1, 1), lwd = c(1, 1))
dev.off()