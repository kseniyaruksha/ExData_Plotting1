electr_data <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?', stringsAsFactors = FALSE)
eldata <- subset(electr_data, Date %in% c('1/2/2007','2/2/2007'))
eldata$Date <- as.Date(eldata$Date, format = '%d/%m/%Y')
eldata$day <- paste(eldata$Date, eldata$Time)
library(lubridate)
eldata$day <- ymd_hms(eldata$day)
png('plot4.png')
par(mfrow = c(2,2))
plot(eldata$day, eldata$Global_active_power,xlab = '', ylab = 'Global Active Power (kilowatts)', type = 'n')
lines(eldata$day, eldata$Global_active_power)
plot(eldata$day, eldata$Voltage,xlab = 'datetime', ylab = 'Voltage', type = 'n')
lines(eldata$day, eldata$Voltage)
plot(eldata$day, eldata$Sub_metering_1, type = 'n', xlab = '', ylab = 'Energy_sub_metering')
lines(eldata$day, eldata$Sub_metering_1, col = 'black')
lines(eldata$day, eldata$Sub_metering_2, col = 'red')
lines(eldata$day, eldata$Sub_metering_3, col = 'blue')
legend('topright', lty = 1, col = c('black', 'red', 'blue'), c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), bty = 'n')
plot(eldata$day, eldata$Global_reactive_power,xlab = 'datetime', ylab = 'Global_reactive_power', type = 'n')
lines(eldata$day,eldata$Global_reactive_power)
dev.off()