##Load the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

##Format the date
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
head(data)
names <- names(data)

##Subset the data
data2 <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]
GlobalActivePower <- data2$Global_active_power
GlobalActivePower <- as.numeric(as.character(GlobalActivePower))

##Plot
png(file = "plot1.png")
hist(GlobalActivePower, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power(kilowatts)",
     ylab = "Frequency")
dev.off()
