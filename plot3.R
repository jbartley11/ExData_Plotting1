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

#plot
with(data, plot(Date_Time, Sub_metering_1,
                type="l", xlab="",
                ylab="Energy sub metering"))

lines(data$Date_Time,data$Sub_metering_2, col = "red")
lines(data$Date_Time,data$Sub_metering_3, col = "blue")

# add legend
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),
       lty=1)

# export png - 480 x 480
dev.copy(png,'plot3.png')
dev.off()
