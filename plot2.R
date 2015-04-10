dataset <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = TRUE, na.strings = c("?"))

sub_dataset <- subset(dataset, Date %in% c("1/2/2007", "2/2/2007"))

sub_dataset$DateTime <- as.POSIXct(paste(sub_dataset$Date, sub_dataset$Time), format = "%d/%m/%Y %T")

png(filename = 'plot2.png', width = 480 , height = 480, units = 'px')

plot(sub_dataset$DateTime, sub_dataset$Global_active_power, type="l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()