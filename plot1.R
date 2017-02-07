## This file creates the basic Active Power histogram from the
## February data file and saves it to plot1.png.
##

makePlot1 = function() {
    
    ## load the dataset
    data <- read.csv("household_power_consumption_feb_2007.csv", 
        stringsAsFactors = F, colClasses = c("Date", "character", "numeric", 
                                             "numeric", "numeric", "numeric", 
                                             "numeric", "numeric", "numeric"))
    ## open png file stream
    png(filename = "plot1.png")
    
    ## make the plot
    hist(data$Global_active_power,
         col = "red", 
         xlab = "Global Active Power (kilowatts)",
         main = "Global Active Power")
    
    ## close the png stream
    dev.off()
}