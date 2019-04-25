## Get the data from file household_power_consumption.txt
powerdata <- read.table("/Users/jing/Desktop/coursera/household_power_consumption.txt",
                        header = TRUE, sep = ";", na.strings="?")

## Get the subset data of two specific days (1/2/2007 and 2/2/2007)
sub_powerdata <- subset(powerdata, Date %in% c("1/2/2007","2/2/2007"))

##Format the date
sub_powerdata$Date <- as.Date(sub_powerdata$Date, format="%d/%m/%Y")

globalactivepower <- as.numeric(sub_powerdata$Global_active_power)

## Plot the required graphic
## Get the png graphics for Plot1

hist(globalactivepower, main= "Global Active Power",col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.copy(png, file="plot1.png", width=480, height=480 )

dev.off()



                        
