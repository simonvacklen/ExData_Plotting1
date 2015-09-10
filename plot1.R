Sys.setlocale("LC_ALL", "English")
plot_data <- read.table("Exploratory/household_power_consumption.txt", sep=";", header=TRUE)

subset to 2007-02-01 and 2007-02-02
plot_sub <- plot_data[as.Date(plot_data$Date, format ="%d/%m/%Y")>="2007-01-01" & as.Date(plot_data$Date, format ="%d/%m/%Y")<="2007-02-01"]


plot_sub <- subset(plot_data, as.Date(plot_data$Date, format ="%d/%m/%Y")>="2007-02-01"& as.Date(plot_data$Date, format ="%d/%m/%Y")<="2007-02-02")

gap <- as.numeric(plot_sub$Global_active_power) /1000

png(filename="plot1.png", width=480,height=480)
hist(gap, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.off()
