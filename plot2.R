## This file creates the Global Active Power line graph from the
## February data file and saves it to plot2.png.
##

makePlot2 = function() {
    
    ## load the dataset
    data <- read.csv("household_power_consumption_feb_2007.csv", 
            stringsAsFactors = F, colClasses = c("Date", "character", "numeric", 
                                              "numeric", "numeric", "numeric", 
                                              "numeric", "numeric", "numeric"))
    ## open png file stream
    png(filename = "plot2.png")
    
    ## make the plot
    plot(data$Global_active_power, type = "l", 
         main = "",
         ylab = "Global Active Power (kilowatts)",
         xlab = "",
         xaxt = "n")
    axis(1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
    
    ## close the png stream
    dev.off()
}