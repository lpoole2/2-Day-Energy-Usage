## Getting full dataset
fulldata <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                     na.strings = "?", nrows = 2075259, check.names = F, 
                     stringsAsFactors = F, comment.char = "", quote = '\"')
fulldata$Date <- as.Date(fulldata$Date, format = "%d/%m/%Y")

## Subsetting the data
data <- subset(fulldata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(fulldata)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Create Plot 2
plot(data$Global_active_power ~ data$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

## Save file and close device
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()