## This function downloads the large household_power_consumption.txt file and
## processes it, replacing the ?s with NAs and formatting the dates,
## as well as truncating the data to only include the data for 02-01-2007 and
## 02-02-2007, then saves the new data in a .csv file:
##
## household_power_consumption_feb_2007.csv
##
## for use by the other plotting functions
##

generate_dataset = function() {
    temp <- tempfile()
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
    data <- read.table(unz(temp, "household_power_consumption.txt"), sep = ";", 
                       stringsAsFactors = F, header = T,
                       na.strings = "?", colClasses = c("character", "character", 
                       "numeric", "numeric", "numeric", "numeric", "numeric", 
                       "numeric", "numeric"))
    data$Date <- as.Date(strptime(data$Date, "%d/%m/%Y"))
    data <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"),]
    write.csv(data, file = "household_power_consumption_feb_2007.csv", row.names = F)
    unlink(temp)
}
