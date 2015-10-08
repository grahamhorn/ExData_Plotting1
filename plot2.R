
plot2 <- function(filename) {
  data <- read.table(filename, sep=";", na.strings = "?", nrows = 2075259, header = TRUE,
                 colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
  data$datetime <- paste(data$Date, data$Time)
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  lessdata <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"), ]
  lessdata$datetime <- strptime(lessdata$datetime, "%d/%m/%Y %H:%M:%S")
  png(filename="plot2.png", width=480, height=480)
  plot(lessdata$datetime, lessdata$Global_active_power, type="n", xlab="", ylab = "Global Active Power (kilowatts)")
  lines(lessdata$datetime, lessdata$Global_active_power)
  dev.off()
}