download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")

unzip("household_power_consumption.zip")

df <- read.table("household_power_consumption.txt",
                 stringsAsFactors = FALSE,
                 na.strings = "?",
                 header = TRUE,
                 colClasses = c("character", "character", "numeric", "numeric",
                                "numeric", "numeric", "numeric", "numeric",
                                "numeric"),
                 sep = ";")

df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

df <- df[df$Date >= as.Date("2007-02-01") & df$Date <= as.Date("2007-02-02"),]

df$datetime <- strptime(with(df, paste(Date, Time)),
                        format = "%Y-%m-%d %H:%M:%S")

png("plot3.png")

with(df, {
  plot(datetime, Sub_metering_1, ylab = "Energy sub metering",
       xlab = "",type = "n")
  lines(datetime, Sub_metering_1)
  lines(datetime, Sub_metering_2, col = "red")
  lines(datetime, Sub_metering_3, col = "blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"),
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

dev.off()