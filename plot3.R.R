Sys.setlocale("LC_ALL", "English")

txt <- "exploratory/household_power_consumption.txt" 
plot_data <- read.table(txt, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 


##subset to 2007-02-01 and 2007-02-02
plot_sub <- plot_data[plot_data$Date %in% c("1/2/2007","2/2/2007") ,] 
plot_sub$datetime <- strptime(paste(plot_sub$Date, plot_sub$Time), format = "%d/%m/%Y %H:%M:%S")



png(filename="plot3.png", width=480,height=480)
with(plot_sub, plot(datetime, Sub_metering_1, ylab="Energy sub metering", xlab ="", type="n"))
with(plot_sub, lines(datetime, Sub_metering_1))
with(plot_sub, lines(datetime, Sub_metering_2, col="red"))
with(plot_sub, lines(datetime, Sub_metering_3, col="blue"))

dev.off()

