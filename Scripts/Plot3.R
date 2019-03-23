# Data loading and transformation
powerConsumption <- read.csv('./data/household_power_consumption.txt', sep = ';')
powerConsumption <- transform(powerConsumption, Date = as.Date(Date, "%d/%m/%Y"))
twoDayConsumption <- subset(powerConsumption, Date == as.Date('01/02/2007', "%d/%m/%Y") | Date == as.Date('02/02/2007', "%d/%m/%Y"))
twoDayConsumption <- transform(twoDayConsumption, Sub_metering_1 = as.numeric(Sub_metering_1), Sub_metering_2 = as.numeric(Sub_metering_2), Sub_metering_3 = as.numeric(Sub_metering_3) )
datetime <- paste(as.Date(twoDayConsumption$Date), twoDayConsumption$Time)
twoDayConsumption$datetime = as.POSIXct(datetime)

# Initialize graphic devise
png('./Output/Plot3.png', height = 480, width = 480, units = 'px')
with(twoDayConsumption, {
     plot(Sub_metering_1 ~ datetime, type = 'l', col = 'black', xlab = '', ylab = 'Energy sub metering')
     lines(Sub_metering_2 ~ datetime, col = 'red')
     lines(Sub_metering_3 ~ datetime, col = 'blue')
     })
legend('topright', col = c('black', 'red', 'blue'), lty = 1, lwd = 2, legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
dev.off()
