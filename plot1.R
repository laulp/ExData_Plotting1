## load dataset (it should be in the same directory)
fullData <- read.table('household_power_consumption.txt', header=TRUE, sep = ';')
fullData[ fullData == "foo" ] <- NA
fullData$Date <- as.Date(fullData$Date, format='%d/%m/%Y')
fullData$Time <- sub(".*\\s+", "",  strptime(fullData$Time, format = '%H:%M:%S'))
first <- subset(test, Date >= "2007-02-01")
epcSubset <- subset(first, Date <= "2007-02-02")
epcSubset$Global_active_power <- as.numeric(epcSubset$Global_active_power)

## create the PNG file (plot1.png)
png("plot1.png", width = 480, height = 480)
hist(epcSubset$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()