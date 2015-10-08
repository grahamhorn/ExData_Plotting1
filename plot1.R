
plot1 <- function(filename) {
  data <- read.csv(filename, sep=";", na.strings = "?",
                 colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  lessdata <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"), ]
  png(filename="plot1.png", width=480, height=480)
  hist(lessdata$Global_active_power, col="red", xlab= "Global Active Power (kilowatts)", main="Global Active Power")
  dev.off()
}