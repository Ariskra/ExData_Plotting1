#loading the data
full_dataset <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = F)
full_dataset$Date <- as.Date(full_dataset$Date, "%d/%m/%Y")
data <- subset(full_dataset, Date >= "2007-02-01" & Date <= "2007-02-02")
data$Time <- paste(data$Date, data$Time)
library(dplyr)
data <- select(data, -1)
data$Time <- strptime(data$Time, "%Y-%m-%d %H:%M:%S")

#constructing and saving Plot 2
png("Plot2.png", width = 480, height = 480)
with(data, plot(Time, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)"))
dev.off()