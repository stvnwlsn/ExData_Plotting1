dataset <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = TRUE, na.strings = c("?"))

sub_dataset <- subset(dataset, Date %in% c("1/2/2007", "2/2/2007"))

png(filename = 'plot1.png', width = 480 , height = 480, units = 'px')

hist(sub_dataset$Global_active_power, col = 'red', 
     main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)',
     ylab = 'Frequency'
)

dev.off()