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

png("plot2.png")

with(df, plot(datetime, Global_active_power, type = "l",
              xlab = "",
              ylab = "Global Active Power (kilowatts)"))

dev.off()
