##Load the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

##Format the date
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")

##Subset the data
data2 <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]
#For plot 1:
Global_active_power <- data2$Global_active_power
Global_active_power <- as.numeric(as.character(Global_active_power))
#For plot 2:
Sub_metering_1 <- data2$Sub_metering_1
Sub_metering_1 <- as.numeric(as.character(Sub_metering_1))
Sub_metering_2 <- data2$Sub_metering_2
Sub_metering_2 <- as.numeric(as.character(Sub_metering_2))
Sub_metering_3 <- data2$Sub_metering_3
Sub_metering_3 <- as.numeric(as.character(Sub_metering_3))
#For plot 3:
Voltage <- data2$Voltage
Voltage <- as.numeric(as.character(Voltage))
#For plot 4:
Global_reactive_power <- data2$Global_reactive_power
Global_reactive_power <- as.numeric(as.character(Global_reactive_power))
#Format the time for all the plots
time <- subset(data2, select = c("Date", "Time"))
time <- paste(time$Date, time$Time, sep = " ")
time <- strptime(time, format = "%Y-%m-%d %H:%M:%S")

##Plot
png(file = "plot4.png")
par(mfcol = c(2, 2))
#Plot 1:
plot(time, Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power")
#Plot 2:
plot(time, Sub_metering_1, col = "black",
     xlab = "", ylab = "Energy sub metering",
     type = "l")
lines(time, Sub_metering_2, col = "red")
lines(time, Sub_metering_3, col = "blue")
legend("topright", lty = 1,col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")
#Plot 3:
plot(time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
#Plot 4:
plot(time, Global_reactive_power, 
     xlab = "datetime", ylab = "Global_reactive_power", 
     type = "l")

dev.off()