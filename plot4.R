dataset <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

sub_dataset <- subset(dataset, Date %in% c("1/2/2007", "2/2/2007"))

sub_dataset$DateTime <- as.POSIXct(paste(sub_dataset$Date, sub_dataset$Time), format = "%d/%m/%Y %T")

png(filename = 'plot4.png', width = 480 , height = 480, units = 'px')

par(mfrow = c(2, 2))

with(sub_dataset, {
    plot(DateTime, as.numeric(as.character(Global_active_power)), type="l",
         xlab = "", ylab = "Global Active Power")
    
    plot(DateTime, as.numeric(as.character(Voltage)), type="l", xlab="datetime", ylab="Voltage")
  
    plot(DateTime, as.numeric(as.character(Sub_metering_1)),
         xlab='', ylab='Energy sub metering', type="l")
    with(sub_dataset, points(DateTime, as.numeric(as.character(Sub_metering_2)), type="l", col="red"))
    with(sub_dataset, points(DateTime, as.numeric(as.character(Sub_metering_3)), type="l", col="blue"))
    legend("topright", lty= c('solid', 'solid', 'solid') , 
           col = c("black", "red", "blue"), 
           legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
    
    plot(DateTime, as.numeric(as.character(Global_reactive_power)), 
         type="l", xlab="datetime", ylab="Global_reactive_power")
})
dev.off()