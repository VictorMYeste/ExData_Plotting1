## Extract data from file

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings = "?")
data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

## Prepare plot

png("plot1.png", 480, 480)

## Plot data

hist(as.numeric(data$Global_active_power), col = "red",
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## Export plot to a PNG file

dev.off()