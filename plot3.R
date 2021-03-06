# library(tidyverse) 
#temp <- tempfile()
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

plot3df <- select(alldata, posvar, Sub_metering_1, Sub_metering_2, 
            Sub_metering_3)  %>% drop_na()
plot.new()
png("plot3.png", width = 480, height = 480)
plot(plot3df$posvar, plot3df$Sub_metering_1, type="l", col = "black",
ylab = "Energy sub metering", xlab = "")
lines(plot3df$posvar,plot3df$Sub_metering_2, type="l", col = "orangered")
lines(plot3df$posvar, plot3df$Sub_metering_3, type="l", col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", 
      "Sub_metering_3"), col=c("black", "orangered", "blue"), cex=0.8)
dev.off()
dev.off()
