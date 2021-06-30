## Extract data from file

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings = "?")
data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

## Prepare plot

png("plot2.png", 480, 480)
datetimes <- strptime(paste(data$Date, data$Time), format = "%e/%m/%Y %H:%M:%S")

## Plot data

with(data, plot(datetimes, as.numeric(Global_active_power), type = "l",
                xlab = "", ylab = "Global Active Power (kilowatts)"))

## Export plot to a PNG file

dev.off()