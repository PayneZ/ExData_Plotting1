##Load the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

##Format the date
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")

##Subset the data
data2 <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]
Sub_metering_1 <- data2$Sub_metering_1
Sub_metering_1 <- as.numeric(as.character(Sub_metering_1))
Sub_metering_2 <- data2$Sub_metering_2
Sub_metering_2 <- as.numeric(as.character(Sub_metering_2))
Sub_metering_3 <- data2$Sub_metering_3
Sub_metering_3 <- as.numeric(as.character(Sub_metering_3))
#Format the time
time <- subset(data2, select = c("Date", "Time"))
time <- paste(time$Date, time$Time, sep = " ")
time <- strptime(time, format = "%Y-%m-%d %H:%M:%S")

##Plot
png(file = "plot3.png")
plot(time, Sub_metering_1, col = "black", type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(time, Sub_metering_2, col = "red")
lines(time, Sub_metering_3, col = "blue")
legend("topright", 
       lty = 1,
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
