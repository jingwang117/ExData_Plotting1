## Get the data from file household_power_consumption.txt
powerdata <- read.table("/Users/jing/Desktop/coursera/household_power_consumption.txt",
                        header = TRUE, sep = ";", na.strings="?")

## Get the subset data of two specific days (1/2/2007 and 2/2/2007)
sub_powerdata <- subset(powerdata, Date %in% c("1/2/2007","2/2/2007"))

## Format the date and time

datetime <- strptime(paste(sub_powerdata$Date, sub_powerdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalactivepower <- as.numeric(sub_powerdata$Global_active_power)

## Plot the graphic plot2

plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480 )

dev.off()
