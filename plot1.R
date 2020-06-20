### Clear the work space
rm(list=ls())

### Read data from the file
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

### Get data for 2007-02-01 and 2007-02-02
df2day <- df[which(df$Date=="1/2/2007" |df$Date=="2/2/2007" ),]

### Create the plot
png(file="plot1.png",width=480,height=480)
gap <- as.numeric(gsub(",","",df2day$Global_active_power,fixed=TRUE))
hist(gap, col="red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")
dev.off()