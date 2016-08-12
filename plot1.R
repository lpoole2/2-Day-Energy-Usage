## Download file
electricdata_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(electricdata_url, "electric_data.zip")
unzip("electric_data.zip", exdir = "electricdata")

## Read dataset
og <- file("household_power_consumption.txt")
fi <- read.table(text = grep("^[1,2]/2/2007", readLines(og), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)


## Create Plot 1
hist(fi$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")

## Save file and close device
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()