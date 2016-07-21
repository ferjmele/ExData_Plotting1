##Start by reading file, adjusting variables and subsetting data, the same for all scripts
hpw<-read.table("household_power_consumption.txt", header= TRUE, sep=";") 
hpw$Date<-as.Date(as.character(hpw$Date), "%d/%m/%Y")
hpw<-subset(hpw, Date == "2007/02/01" | Date == "2007/02/02")
hpw$Time<-as.POSIXct(paste(as.character(hpw$Date),as.character(hpw$Time)))
hpw$Sub_metering_1<-as.numeric(as.character(hpw$Sub_metering_1))
hpw$Sub_metering_2<-as.numeric(as.character(hpw$Sub_metering_2))
hpw$Sub_metering_3<-as.numeric(as.character(hpw$Sub_metering_3))
hpw$Global_active_power<-as.numeric(as.character(hpw$Global_active_power))
hpw$Global_reactive_power<-as.numeric(as.character(hpw$Global_reactive_power))
hpw$Voltage<-as.numeric(as.character(hpw$Voltage))
##Prepare device, plot and add whatever is asked on each case. Finally close device
png(filename="plot2.png", width=480, height=480) 
plot(hpw$Time, hpw$Global_active_power, type="n", ylab = "Global Active Power (kilowatts)", xlab="")
lines(hpw$Time, hpw$Global_active_power)
dev.off()


