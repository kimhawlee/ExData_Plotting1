
# Getting the dataset
dataset <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings = "?", 
                      colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 
                                   'numeric', 'numeric', 'numeric', 'numeric'))

# Converting date
dataset_date <- as.Date(dataset$Date, format="%d/%m/%Y")

# Subsetting the data (only from the dates 2007-02-01 and 2007-02-02)
data_subset <- dataset[(dataset$Date == '1/2/2007')|(dataset$Date == '2/2/2007'),]

# Merging date & time
date_time <- as.POSIXct(paste(as.Date(data_subset$Date)), data_subset$Time), format="%Y-%m-%d %H:%M:%S")

# Plot 3
png(filename = "Plot3.png", width = 480, height = 480, units = "px", res = 75)
plot(date_time, data_subset$Sub_metering_1, type='l', col='black', ylab='Energy sub metering', xlab='', ylim=c(0,38))
lines(date_time, data_subset$Sub_metering_2, type='l', col='red')
lines(date_time, data_subset$Sub_metering_3, type='l', col='blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1, col=c('black', 'red', 'blue'))
dev.off()
cat("Plot3.png has been saved in", getwd())
