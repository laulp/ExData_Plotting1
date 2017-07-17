## load dataset (it should be in the same directory)
fullData <- read.table('household_power_consumption.txt', header=TRUE, sep = ';')
fullData[ fullData == "foo" ] <- NA
fullData$Date <- as.Date(fullData$Date, format='%d/%m/%Y')
fullData$Time <- sub(".*\\s+", "",  strptime(fullData$Time, format = '%H:%M:%S'))
first <- subset(test, Date >= "2007-02-01")
epcSubset <- subset(first, Date < "2007-02-03")
epcSubset$Global_active_power <- as.numeric(epcSubset$Global_active_power)

## create the PNG file (plot2.png)
png("plot2.png", width = 480, height = 480)
plot(datetime, epcSubset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()