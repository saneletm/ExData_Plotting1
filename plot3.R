source ("get_data.R")


generate_plot3 <- function ()  {
    clean_data <- get_data()    
    png("plot3.png", width=480, height=480)
    
    with (clean_data, plot(Datetime, Sub_metering_1, type="n", xlab="", ylab=""))
    with (clean_data, points(Datetime, Sub_metering_1, type="l", xlab="", ylab=""))
    with (clean_data, points(Datetime, Sub_metering_2, col="red", type="l", xlab="", ylab=""))
    with (clean_data, points(Datetime, Sub_metering_3, col="blue", type="l", xlab="", ylab=""))
    legend(
        "topright", 
        legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
        col=c("black", "red", "blue"), 
        lty=1,
        cex=0.65
    )
    title (ylab="Energy sub metering")
    
    dev.off()
}

generate_plot3()