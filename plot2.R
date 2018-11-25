# produce histogram plot of active power and frequency

# set working directory
setwd("/Users/jasonbartley/Development/courses/ExData_Plotting1")

# load data
data <- read.table("./data/household_power_consumption.txt",
                   sep=";",
                   header=TRUE)

# subset for 2007-02-01 and 2007-02-02
data <- subset(data, data$Date %in% c("2/1/2007", "2/2/2007"))

# make copy for testing
data2 <- data

# convert global active power to numeric
data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))

head(data2)
summary(data)
hist(data2$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

str(data)

# export png - 480 x 480
dev.copy(png,'plot1.png')
dev.off()