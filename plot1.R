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
png(filename = "Plot1.png", width = 480, height = 480, units = "px", res = 75)
hist(data_subset$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
dev.off()
cat("Plot1.png has been saved in", getwd())
