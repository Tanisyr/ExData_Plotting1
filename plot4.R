## This file creates the four sub graphs showing various aspects of household
## power usage for the first two days of February, 2007.
##
## Graph 1: Global Active Power
## Graph 2: Voltage
## Graph 3: Energy sub-metering
## Graph 4: Global Reactive Power
##

makePlot4 = function() {
    
    ## load the dataset
    data <- read.csv("household_power_consumption_feb_2007.csv", 
                     stringsAsFactors = F, colClasses = c("Date", "character", "numeric", 
                                                          "numeric", "numeric", "numeric", 
                                                          "numeric", "numeric", "numeric"))
    ## open png file stream
    png(filename = "plot4.png")
    
    ## setup multiple plots
    par(mfrow = c(2, 2))
    
    ## Make the 1st plot (Global Active Power)
    plot(data$Global_active_power, type = "l", 
         main = "",
         ylab = "Global Active Power",
         xlab = "",
         xaxt = "n")
    axis(1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
    
    ## Make the 2nd plot (Voltage)
    plot(data$Voltage, type = "l", 
         main = "",
         ylab = "Voltage",
         xlab = "datetime",
         xaxt = "n")
    axis(1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
    
    ## Make the 3rd plot (Energy sub-metering)
    plot(data$Sub_metering_1, type = "l", 
         main = "",
         ylab = "Energy sub metering",
         xlab = "",
         xaxt = "n")
    lines(data$Sub_metering_2, col = "red")
    lines(data$Sub_metering_3, col = "blue")
    axis(1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
    legend("topright", 
           legend = c("Sub_metering_1", 
                      "Sub_metering_2", 
                      "Sub_metering_3"),
           lwd = 1,
           bty = "n",
           col = c("black", "red", "blue"))
    
    ## Make the 4th plot (Global Reactive Power)
    plot(data$Global_reactive_power, type = "l", 
         main = "",
         ylab = "Global_reactive_power",
         xlab = "datetime",
         xaxt = "n")
    axis(1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
    
    ## close the png stream
    dev.off()
}