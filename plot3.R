## This file creates the sub metering line graph from the
## February data file and saves it to plot3.png.
##

makePlot3 = function() {
    
    ## load the dataset
    data <- read.csv("household_power_consumption_feb_2007.csv", 
                     stringsAsFactors = F, colClasses = c("Date", "character", "numeric", 
                                                          "numeric", "numeric", "numeric", 
                                                          "numeric", "numeric", "numeric"))
    ## open png file stream
    png(filename = "plot3.png")
    
    ## make the plot
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
           col = c("black", "red", "blue"))
    
    ## close the png stream
    dev.off()
}