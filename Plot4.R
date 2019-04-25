## Get the data from file household_power_consumption.txt
powerdata <- read.table("/Users/jing/Desktop/coursera/household_power_consumption.txt",
                        header = TRUE, sep = ";", na.strings="?")

## Get the subset data of two specific days (1/2/2007 and 2/2/2007)
sub_powerdata <- subset(powerdata, Date %in% c("1/2/2007","2/2/2007"))

##Format the date
## Format the date and time

datetime <- strptime(paste(sub_powerdata$Date, sub_powerdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalactivepower <- as.numeric(sub_powerdata$Global_active_power)
globalreactivepower <- as.numeric(sub_powerdata$Global_reactive_power)

## get the data for graphing

submetering1 <- as.numeric(sub_powerdata$Sub_metering_1)
submetering2 <- as.numeric(sub_powerdata$Sub_metering_2)
submetering3 <- as.numeric(sub_powerdata$Sub_metering_3)
voltage <- as.numeric(sub_powerdata$Voltage)

## Plot the required graphic
## Get the png graphics for Plot4

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))


## No.1 plot
plot(datetime,globalactivepower,  type="l", ylab="Global Active Power", xlab="", cex=0.2)

## No. 2 plot
plot(datetime, voltage, type="l", ylab="Voltage", xlab ="datetime")

## No. 3 plot
plot(datetime, submetering1, type="l", ylab="Energy Sub Metering", xlab="")
lines(datetime, submetering2,  col="red")
lines(datetime, submetering3, col="blue")

legend("topright", lty=1, lwd=2, bty="n", col=c("black", "red", "blue"), legend=c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))

## No. 4 plot
plot(datetime, globalreactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file="plot4.png", width=480, height=480 )

dev.off()




