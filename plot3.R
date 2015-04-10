dataset <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = TRUE, na.strings = c("?"))

sub_dataset <- subset(dataset, Date %in% c("1/2/2007", "2/2/2007"))

sub_dataset$DateTime <- as.POSIXct(paste(sub_dataset$Date, sub_dataset$Time), format = "%d/%m/%Y %T")

png(filename = 'plot3.png', width = 480 , height = 480, units = 'px')

with(sub_dataset, plot(DateTime, Sub_metering_1,
                       xlab='', ylab='Energy sub metering', type="l"))
with(sub_dataset, points(DateTime, Sub_metering_2, type="l", col="red"))
with(sub_dataset, points(DateTime, Sub_metering_3, type="l", col="blue"))
legend("topright", lty= c('solid', 'solid', 'solid') , 
       col = c("black", "red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()