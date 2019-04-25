## Get the data from file household_power_consumption.txt
powerdata <- read.table("/Users/jing/Desktop/coursera/household_power_consumption.txt",
                        header = TRUE, sep = ";", na.strings="?")

## Get the subset data of two specific days (1/2/2007 and 2/2/2007)
sub_powerdata <- subset(powerdata, Date %in% c("1/2/2007","2/2/2007"))

##Format the date
## Format the date and time

datetime <- strptime(paste(sub_powerdata$Date, sub_powerdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalactivepower <- as.numeric(sub_powerdata$Global_active_power)

## get the data for Sub_Metering

submetering1 <- as.numeric(sub_powerdata$Sub_metering_1)
submetering2 <- as.numeric(sub_powerdata$Sub_metering_2)
submetering3 <- as.numeric(sub_powerdata$Sub_metering_3)

## Plot the required graphic
## Get the png graphics for Plot3

with(sub_powerdata, plot(datetime,submetering1,  type="l", ylab="Energy Sub Metering", xlab=""))
lines(datetime, submetering2,  col="red")
lines(datetime, submetering3, col="blue")

legend("topright", lty=1,  col=c("black", "red", "blue"), legend=c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))


dev.copy(png, file="plot3.png", width=480, height=480 )

dev.off()



                        
