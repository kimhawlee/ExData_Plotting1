
# Getting the dataset
dataset <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings = "?", 
                      colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 
                                   'numeric', 'numeric', 'numeric', 'numeric'))

# Converting date
dataset_date <- as.Date(dataset$Date, format="%d/%m/%Y")

# Subsetting the data (only from the dates 2007-02-01 and 2007-02-02)
data_subset <- dataset[(dataset$Date == '1/2/2007')|(dataset$Date == '2/2/2007'),]

# Merging date & time
date_time <- as.POSIXct(paste(data_subset$Date, data_subset$Time), format="%Y-%m-%d %H:%M:%S")

# Plot 1
plot(date_time, data_subset$Global_active_power, type='l', ylab='Global Active Power', xlab='')

# Plot 2
plot(date_time, data_subset$Voltage, type='l', xlab='datetime')

# Plot 3
plot(date_time, data_subset$Sub_metering_1, type='l', col='black', ylab='Energy sub metering', xlab='')
lines(date_time, data_subset$Sub_metering_2, type='l', col='red')
lines(date_time, data_subset$Sub_metering_3, type='l', col='blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1, col=c('black', 'red', 'blue'), bty='n')

# Plot 4
plot(date_time, data_subset$Global_reactive_power, type='l', xlab='datetime')

# Output
png(filename = "Plot4.png", width = 480, height = 480, units = "px", res = 75)
dev.off()
cat("Plot4.png has been saved in", getwd())
