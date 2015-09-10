Sys.setlocale("LC_ALL", "English")

txt <- "exploratory/household_power_consumption.txt" 
plot_data <- read.table(txt, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 


##subset to 2007-02-01 and 2007-02-02
plot_sub <- plot_data[plot_data$Date %in% c("1/2/2007","2/2/2007") ,] 
plot_sub$datetime <- strptime(paste(plot_sub$Date, plot_sub$Time), format = "%d/%m/%Y %H:%M:%S")


png(filename="plot4.png", width=480,height=480)
par(mfrow= c(2,2))
with(plot_sub, {
plot(datetime, Global_active_power, ylab="Global active power", xlab ="", type="l")
plot(datetime, Voltage, ylab="Voltage", type="l")

plot(datetime, Sub_metering_1, ylab="Energy sub metering", xlab ="", type="n")
lines(datetime, Sub_metering_1)
lines(datetime, Sub_metering_2, col="red")
lines(datetime, Sub_metering_3, col="blue")

plot(datetime, Global_reactive_power, ylab="Global reactive power", type="l")

}
)

dev.off()

