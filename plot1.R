#plot1.R: Colored histogram of Global Active Power

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
png("plot1.png", height=480, width=480)

#histogram for Global Active POwer
hist(requiredData$Global_active_power, col='red', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')

#Close device
dev.off()
