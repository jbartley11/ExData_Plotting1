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
data <- subset(data, data$Date %in% c("2/1/2007", "2/2/2007"))

# add datetime column
data$Date_Time <- as.POSIXct(paste(data$Date, data$Time), format="%m/%d/%Y %H:%M:%S")

#plot
with(data, plot(Date_Time, Global_active_power,
                type="l", xlab="",
                ylab="Global Active Power (kilowatts)"))

# export png - 480 x 480
dev.copy(png,'plot2.png')
dev.off()
