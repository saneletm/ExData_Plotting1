source ("get_data.R")


generate_plot2 <- function () {
    clean_data <- get_data()
    png("plot2.png", width=480, height=480)
    with(clean, plot(Datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
    dev.off()
}

generate_plot2()