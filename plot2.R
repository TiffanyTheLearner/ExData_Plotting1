### Clear the work space
rm(list=ls())

### Read data from the file
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

### Get data for 2007-02-01 and 2007-02-02
df2day <- df[which(df$Date=="1/2/2007" |df$Date=="2/2/2007" ),]

### Set up device
png(file="plot2.png",width=480,height=480)

### Get Y-axis data
gap <- as.numeric(df2day$Global_active_power) 

### Get X-axis data
dt <- paste(df2day$Date, df2day$Time, sep=" ")
t <- as.numeric(as.POSIXct(strptime(dt, "%d/%m/%Y %H:%M:%S")))

### Plot
plot(t, gap, type="l", col="black", lwd=1, xlab="",  ylab="Global Active Power (kilowatts)",  xaxt="n")

### Add ticks for X-axis
xtick<-seq(t[1], t[length(t)], by=(t[length(t)] - t[1])/2)
axis(side=1, at=xtick,labels = FALSE )
wtick <- weekdays(as.Date(xtick/86400, origin = "1970-01-01"))
text(x=xtick, par("usr")[3], labels = wtick, pos = 1, xpd = TRUE)

### close device
dev.off()