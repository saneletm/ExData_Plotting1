source ("get_data.R")


generate_plot4 <- function () {
    clean_data <- get_data()
    png("plot4.png", height = 480, width = 480)
    par(mfrow=c(2, 2))
    # First graph
    with(clean, plot(
        Datetime, 
        Global_active_power, 
        type="l", 
        xlab="", 
        ylab="Global Active Power (kilowatts)")
        )

    # Second graph 
    with(clean_data, plot(Datetime, Voltage, type="l"))
    # Third graph
    with (clean_data, plot(Datetime, Sub_metering_1, type="n", xlab="", ylab=""))
    with (clean_data, points(Datetime, Sub_metering_1, type="l", xlab="", ylab=""))
    with (clean_data, points(Datetime, Sub_metering_2, col="red", type="l", xlab="", ylab=""))
    with (clean_data, points(Datetime, Sub_metering_3, col="blue", type="l", xlab="", ylab=""))
    legend(
        "topright", 
        legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
        col=c("black", "red", "blue"), 
        lty=1,
        cex=0.4,
        bty="n"
    )
    title (ylab="Energy sub metering")
    # Fourth graph
    with (clean, plot(Datetime, Global_reactive_power, type="l"))
    dev.off()
}

generate_plot4()