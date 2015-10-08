
plot3 <- function(filename) {
  data <- read.table(filename, sep=";", na.strings = "?", nrows = 2075259, header = TRUE,
                 colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
  data$datetime <- paste(data$Date, data$Time)
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  lessdata <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"), ]
  lessdata$datetime <- strptime(lessdata$datetime, "%d/%m/%Y %H:%M:%S")
  png(filename="plot3.png", width=480, height=480)
  plot(lessdata$datetime, lessdata$Sub_metering_1, type="n", xlab="", ylab = "Energy sub metering")
  lines(lessdata$datetime, lessdata$Sub_metering_1, col="black")
  lines(lessdata$datetime, lessdata$Sub_metering_2, col="red")
  lines(lessdata$datetime, lessdata$Sub_metering_3, col="blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1)
  dev.off()
}