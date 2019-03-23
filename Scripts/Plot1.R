# Data loading and transformation
powerConsumption <- read.csv('./data/household_power_consumption.txt', sep = ';')
powerConsumption <- transform(powerConsumption, Date = as.Date(Date, "%d/%m/%Y"))
twoDayConsumption <- subset(powerConsumption, Date == as.Date('01/02/2007', "%d/%m/%Y") | Date == as.Date('02/02/2007', "%d/%m/%Y"))
twoDayConsumption <- transform(twoDayConsumption, Global_active_power = (as.numeric(Global_active_power) / 1000)*2)

# Initialize graphic devise
png('./Output/Plot1.png', height = 480, width = 480, units = 'px')
hist(twoDayConsumption$Global_active_power, 
     col = 'red', 
     xlab = 'Global Active Power (Kilowatts)', 
     main = 'Global Active Power')
dev.off()
