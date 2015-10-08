
plot4 <- function(filename) {
  lessdata <- ingest(filename)
  
  png(filename="plot4.png", width=480, height=480)
  par(mfcol = c(2, 2))
  plot(lessdata$datetime, lessdata$Global_active_power, type="n", xlab="", ylab = "Global Active Power")
  lines(lessdata$datetime, lessdata$Global_active_power)
  
  plot(lessdata$datetime, lessdata$Sub_metering_1, type="n", xlab="", ylab = "Energy sub metering")
  lines(lessdata$datetime, lessdata$Sub_metering_1, col="black")
  lines(lessdata$datetime, lessdata$Sub_metering_2, col="red")
  lines(lessdata$datetime, lessdata$Sub_metering_3, col="blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1, bty = "n")
  
  plot(lessdata$datetime, lessdata$Voltage, type="n", xlab="datetime", ylab = "Voltage")
  lines(lessdata$datetime, lessdata$Voltage)
  
  plot(lessdata$datetime, lessdata$Global_reactive_power, type="n", xlab="datetime", ylab = "Global_reactive_power")
  lines(lessdata$datetime, lessdata$Global_reactive_power)
  
  dev.off()
}

ingest <-function(filename) {
  data <- read.table(filename, sep=";", na.strings = "?", nrows = 2075259, header = TRUE,
                     colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
  data$datetime <- paste(data$Date, data$Time)
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  lessdata <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"), ]
  lessdata$datetime <- strptime(lessdata$datetime, "%d/%m/%Y %H:%M:%S")
  return(lessdata)
}