# library(tidyverse) 
# temp <- tempfile()
# download.file("https://archive.ics.uci.edu/ml/machine-learning-databases/00235/
# household_power_consumption.zip", temp) headers <- read.table(unz(temp,
# "household_power_consumption.txt"), nrow= 1,sep = ";", na.strings="?") alldata
# <- read.table(unz(temp, "household_power_consumption.txt"), skip = 1, sep =
# ";", na.strings="?")
#
# colnames(alldata) <- headers alldata <- mutate(alldata, nudate = as.Date(Date,
# "%d/%m/%Y")) alldata <- filter(alldata, nudate >= "2007-02-01" & nudate <=
# "2007-02-02") alldata <- mutate(alldata, posvar = strptime(paste(nudate,
# Time), format = "%Y-%m-%d %H:%M:%S")) unlink(temp)
#
# save (alldata, file = "Assignment1.Rdata")

plot.new()
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2), mar =c(6,4,2,1)) 

plot(alldata$posvar, alldata$Global_active_power, type="l",
     ylab = "Global Active Power (kilowatts)", xlab = "", col = "black")

plot(alldata$posvar, alldata$Voltage, type="l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "datatime", col = "black")

plot(alldata$posvar, alldata$Sub_metering_1, type="l", col = "black", 
    ylab = "Energy sub metering", xlab = "")
lines(alldata$posvar, alldata$Sub_metering_2, type="l", col = "orangered")
lines(alldata$posvar, alldata$Sub_metering_3, type="l", col = "blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black", "orangered", "blue"), cex=0.8)

plot(alldata$posvar, alldata$Global_reactive_power, type="l",
     ylab = "Global_reactive_Power (kilowatts)",
     xlab = "data time", col = "black")

dev.off() 
dev.off()
