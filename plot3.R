#reading in and cleaning
data <-  read.table("household_power_consumption.txt", sep = ";", header = T, 
                    na.strings = "?", nrows = 1000000)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
power <- subset(data, data$Date == as.Date("2007-02-01", "%Y-%m-%d") | 
                  data$Date == as.Date("2007-02-02", "%Y-%m-%d"))
power$datetime <- strptime(paste(power$Date, power$Time), "%Y-%m-%d %H:%M:%S")

#plot 3
png(file = "plot3.png")
    plot(power[, 10], power[, 7], type = "l", 
        xlab = "", ylab = "Energy sub metering")
    lines(power[, 10], power[, 8], type = "l", col = "red")
    lines(power[, 10], power[, 9], type = "l", col = "blue")
    legend("topright", 
          legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
          lty = c(1, 1, 1), 
          col = c("black", "red", "blue"))
dev.off()