library(tidyr)
library(dplyr)
library(lubridate)
library(data.table)


get_data <- function () {
    if (!file.exists("./household_power_consumption.txt")){
        if (!file.exists("./consumption.zip")){
            download.file(
                "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                destfile = "./consumption.zip"
            )
        }
       unzip("./consumption.zip") 
    } 
    
    consumption_data = fread(
        "./household_power_consumption.txt", 
        sep=";", 
        head=TRUE, 
        na.strings = "?"
    );
    consumption_data$Date <- dmy(consumption_data$Date);
    consumption_data <- consumption_data %>% filter(Date >= ymd(20070201) & Date <= ymd(20070202));
    consumption_data <- consumption_data %>% mutate(Datetime = as.POSIXct(paste(Date, Time), format = "%Y-%m-%d %H:%M:%S"))
}