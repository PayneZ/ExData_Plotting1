##Load the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

##Format the date
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")

##Subset the data
data2 <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]
Global_active_power <- data2$Global_active_power
Global_active_power <- as.numeric(as.character(Global_active_power))
#Format the time
time <- subset(data2, select = c("Date", "Time"))
time <- paste(time$Date, time$Time, sep = " ")
time <- strptime(time, format = "%Y-%m-%d %H:%M:%S")

##Plot
png(file = "plot2.png")
plot(time, Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power(kilowatts)" )
dev.off()