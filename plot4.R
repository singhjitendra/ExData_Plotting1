#plot4.R: Multiple plots

#Read the input data.
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", 
                   colClasses=c('character', 'character', 'numeric',
                                'numeric', 'numeric', 'numeric',
                                'numeric', 'numeric', 'numeric'))

#Convert date and time to one column
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#Subset the data within the given ranges
requiredData <- subset(data, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

#Open the png device with the given specification
png("plot4.png", height=480, width=480)

#Chart divided in 2 x 2
par(mfcol=c(2,2))

#plot 1
plot(requiredData$DateTime, requiredData$Global_active_power, pch=NA,
     xlab="", ylab="Global Active Power")
lines(requiredData$DateTime, requiredData$Global_active_power)

#plot 2
plot(requiredData$DateTime, requiredData$Sub_metering_1, pch=NA,
     xlab="", ylab="Energy sub metering")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), col = c('black', 'red', 'blue'), bty='n')
lines(requiredData$DateTime, requiredData$Sub_metering_1)
lines(requiredData$DateTime, requiredData$Sub_metering_2, col='red')
lines(requiredData$DateTime, requiredData$Sub_metering_3, col='blue')

#plot 3
plot(requiredData$DateTime, requiredData$Voltage, pch=NA,
     xlab="datetime", ylab="Voltage")
lines(requiredData$DateTime, requiredData$Voltage)

#plot4
plot(requiredData$DateTime, requiredData$Global_reactive_power, pch=NA,
     xlab="datetime", ylab="Global_reactive_power")
lines(requiredData$DateTime, requiredData$Global_reactive_power)

#Close device
dev.off()
