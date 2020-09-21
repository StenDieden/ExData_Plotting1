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

plot2df <- select(alldata, posvar, Global_active_power) %>% drop_na()

plot.new()
png("plot2.png", width = 480, height = 480)
with(plot2df, plot(posvar, Global_active_power, type="l", 
ylab = "Global Active Power (kilowatts)", xlab = "", col = "black"))

dev.off()
dev.off()
