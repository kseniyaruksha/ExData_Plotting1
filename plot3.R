electr_data <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?', stringsAsFactors = FALSE)
eldata <- subset(electr_data, Date %in% c('1/2/2007','2/2/2007'))
eldata$Date <- as.Date(eldata$Date, format = '%d/%m/%Y')
eldata$day <- paste(eldata$Date, eldata$Time)
library(lubridate)
eldata$day <- ymd_hms(eldata$day)
png('plot3.png')
plot(eldata$day, eldata$Sub_metering_1, type = 'n', xlab = '', ylab = 'Energy_sub_metering')
lines(eldata$day, eldata$Sub_metering_1, col = 'black')
lines(eldata$day, eldata$Sub_metering_2, col = 'red')
lines(eldata$day, eldata$Sub_metering_3, col = 'blue')
legend('topright', lty = 1, col = c('black', 'red', 'blue'), c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.off()