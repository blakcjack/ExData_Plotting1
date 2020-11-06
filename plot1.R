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

png("plot1.png")
hist(df$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts",
     col = "red")
dev.off()
