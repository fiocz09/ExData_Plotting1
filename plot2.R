#reading in and cleaning
data <-  read.table("household_power_consumption.txt", sep = ";", header = T, 
                    na.strings = "?", nrows = 1000000)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
power <- subset(data, data$Date == as.Date("2007-02-01", "%Y-%m-%d") | 
                  data$Date == as.Date("2007-02-02", "%Y-%m-%d"))
power$datetime <- strptime(paste(power$Date, power$Time), "%Y-%m-%d %H:%M:%S")

#plot 2
png(file = "plot2.png")
    plot(power[, 10], power[, 3], type = "l", 
        xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()