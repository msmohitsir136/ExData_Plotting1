# Data loading and transformation
powerConsumption <- read.csv('./data/household_power_consumption.txt', sep = ';')
powerConsumption <- transform(powerConsumption, Date = as.Date(Date, "%d/%m/%Y"))
twoDayConsumption <- subset(powerConsumption, subset = (Date >= as.Date('01/02/2007', "%d/%m/%Y") & Date <= as.Date('02/02/2007', "%d/%m/%Y")))
twoDayConsumption <- transform(twoDayConsumption, Global_active_power = (as.numeric(Global_active_power) / 1000)*2)
datetime <- paste(as.Date(twoDayConsumption$Date), twoDayConsumption$Time)
twoDayConsumption$datetime = as.POSIXct(datetime)

# Initialize graphic devise
png('./Output/Plot2.png', height = 480, width = 480, units = 'px')
plot(twoDayConsumption$Global_active_power ~ twoDayConsumption$datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
