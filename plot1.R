# produce histogram plot of global active power

# set working directory
setwd("/Users/jasonbartley/Development/courses/ExData_Plotting1")

# read data
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

# plot histogram
hist(data$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

# export png - 480 x 480
dev.copy(png,'plot1.png')
dev.off()
