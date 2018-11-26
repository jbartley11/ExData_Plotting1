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
with(data, plot(Date_Time, Sub_metering_3,
                type="l", xlab="",
                ylab="Energy sub metering",
                col="blue"))

lines(data$Date_Time,data$Sub_metering_2, col = "red")
lines(data$Date_Time,data$Sub_metering_1)

# add legend
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "sub_metering_3"),
       col=c("black", "red", "blue"),
       lty=1)

# export png - 480 x 480
dev.copy(png,'plot3.png')
dev.off()
table(data$Sub_metering_1
      )







# make copy for testing
data2 <- data
head(data2)
summary(data)
hist(data2$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

str(data)

# export png - 480 x 480
dev.copy(png,'plot2.png')
dev.off()