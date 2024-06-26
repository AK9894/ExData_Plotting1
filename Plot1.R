## Step 1 - Load the data
# Load only records for 2007-02-01 and 2007-02-02

household <- read.table("household_power_consumption.txt", header = FALSE, 
                     sep = ";", dec = ".", skip = 66637, nrows = 2880,
                     col.names=c("Date", 
                                 "Time", 
                                 "Global_active_power", 
                                 "Global_reactive_power",
                                 "Voltage",
                                 "Global_intensity",
                                 "Sub_metering_1",
                                 "Sub_metering_2",
                                 "Sub_metering_3"))

# Create datetime by pasting together Date and Time
household$datetime <- with(household, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M"))


## Plot 1
# Plot and save to png
png('plot1.png')
with(household, hist(Global_active_power, main = "Global Active Power", 
                  xlab = "Global Active Power (kilowatts)", col = "red"))
dev.off()

