
### Clear the work space
rm(list=ls())

### Read data from the file
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

### Get data for 2007-02-01 and 2007-02-02
df2day <- df[which(df$Date=="1/2/2007" |df$Date=="2/2/2007" ),]

### Set up device
png(file="plot4.png",width=480,height=480)

### Get X-axis data
dt <- paste(df2day$Date, df2day$Time, sep=" ")
t <- as.numeric(as.POSIXct(strptime(dt, "%d/%m/%Y %H:%M:%S")))
par(mfrow=c(2,2))

## ---------------------- Plot 1, 1 ----------------------
### Get Y-axis data
gap <- as.numeric(df2day$Global_active_power) 

### Plot
plot(t, gap, type="l", col="black", lwd=1, xlab="",  ylab="Global Active Power",  xaxt="n")

### Add ticks for X-axis
xtick<-seq(t[1], t[length(t)], by=(t[length(t)] - t[1])/2)
axis(side=1, at=xtick,labels = FALSE )
wtick <- weekdays(as.Date(xtick/86400, origin = "1970-01-01"))
text(x=xtick, par("usr")[3], labels = wtick, pos = 1, xpd = TRUE)

## ---------------------- Plot 1, 2 ----------------------

### Get Y-axis data
vtg <- as.numeric(df2day$Voltage) 

### Plot
plot(t, vtg, type="l", col="black", lwd=1, xlab="datetime",  ylab="Voltage",  xaxt="n")

### Add ticks for X-axis
xtick<-seq(t[1], t[length(t)], by=(t[length(t)] - t[1])/2)
axis(side=1, at=xtick,labels = FALSE )
wtick <- weekdays(as.Date(xtick/86400, origin = "1970-01-01"))
text(x=xtick, par("usr")[3], labels = wtick, pos = 1, xpd = TRUE)


## ---------------------- Plot 2, 1 ----------------------
### Get Y-axis data
sm1 <- as.numeric(df2day$Sub_metering_1)
sm2 <- as.numeric(df2day$Sub_metering_2)
sm3 <- as.numeric(df2day$Sub_metering_3)

### Plot
plot(t, sm1, type="l", col="black", lwd=1, xlab="",  ylab="Energy sub metering",  xaxt="n")
lines(t, sm2, col="red")
lines(t, sm3, col="blue")

### Add ticks for X-axis
xtick<-seq(t[1], t[length(t)], by=(t[length(t)] - t[1])/2)
axis(side=1, at=xtick,labels = FALSE )
wtick <- weekdays(as.Date(xtick/86400, origin = "1970-01-01"))
text(x=xtick, par("usr")[3], labels = wtick, pos = 1, xpd = TRUE)

### Add legend
x <- xtick[1] + (xtick[length(xtick)]-xtick[1])/3
legend(x, 39.5,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lwd=1, bty = "n", cex = 0.8)

## ---------------------- Plot 2, 2 ----------------------
### Get Y-axis data
grp <- as.numeric(df2day$Global_reactive_power) 

### Plot
plot(t, grp, type="l", col="black", lwd=1, xlab="datatime",  ylab="Global_reactive_power",  xaxt="n")

### Add ticks for X-axis
xtick<-seq(t[1], t[length(t)], by=(t[length(t)] - t[1])/2)
axis(side=1, at=xtick,labels = FALSE )
wtick <- weekdays(as.Date(xtick/86400, origin = "1970-01-01"))
text(x=xtick, par("usr")[3], labels = wtick, pos = 1, xpd = TRUE)

### close device
dev.off()

