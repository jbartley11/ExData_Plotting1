# produce histogram plot of global active power over time

# set working directory
setwd("/Users/jasonbartley/Development/courses/ExData_Plotting1")

# load data
classes <- c("character", "character", "numeric", "numeric",
             "numeric", "numeric", "numeric", "numeric",
             "numeric")

data <- read.table("./data/household_power_consumption.txt",
                   sep=";",
                   header=TRUE,
                   stringsAsFactors=FALSE,
                   colClasses=classes,
                   na.strings=c("?"))

# subset for 2007-02-01 and 2007-02-02
data <- subset(data, data$Date %in% c("1/2/2007", "2/2/2007"))

# add datetime column
data$Date_Time <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# set 2x2 grid for plots
par(mfrow=c(2,2))

# plot 1 - Global Active Power over time
with(data, plot(Date_Time, Global_active_power,
                type="l", xlab="",
                ylab="Global Active Power (kilowatts)"))

# plot 2 - Voltage over time
with(data, plot(Date_Time, Voltage,
                type="l",
                xlab="datetime",
                ylab="Voltage"))

# plot 3 - Energy sub metering
with(data, plot(Date_Time, Sub_metering_1,
                type="l", xlab="",
                ylab="Energy sub metering"))

lines(data$Date_Time,data$Sub_metering_2, col = "red")
lines(data$Date_Time,data$Sub_metering_3, col = "blue")

legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),
       lty=1,
       bty = "n")

# plot 4 - Global reactive power over time
with(data, plot(Date_Time, Global_reactive_power,
                type="l",
                xlab="datetime",
                ylab="Global_reactive_power"))

# export png - 480 x 480
dev.copy(png,'plot4.png')
dev.off()
