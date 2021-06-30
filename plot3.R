## Extract data from file

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings = "?")
data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

## Prepare plot

png("plot3.png", 480, 480)
datetimes <- strptime(paste(data$Date, data$Time), format = "%e/%m/%Y %H:%M:%S")

## Plot data

with(data, plot(datetimes, as.numeric(Sub_metering_1), type = "l",
                xlab = "", ylab = "Energy sub metering"))
with(data, points(datetimes, as.numeric(Sub_metering_2), type = "l",
                  col = "red"))
with(data, points(datetimes, as.numeric(Sub_metering_3), type = "l",
                  col = "blue"))
legend("topright", lty = c(1, 1), col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Export plot to a PNG file

dev.off()