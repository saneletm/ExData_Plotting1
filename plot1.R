source ("./get_data.R")


generate_plot1 <- function (){
   plot_data <- get_data()
   with(plot_data,  hist(Global_active_power, col="red", main="", xlab=""))
   title (main = "Global Active Power", xlab="Global Active Power (kilowatts")
   dev.copy(png, file="plot1.png")
   dev.off()
}

generate_plot1()