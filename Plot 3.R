dat<-read.table("household_power_consumption.txt",header = TRUE, sep=';')


dat$DateTime <- strptime(paste(dat$Date, dat$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data<-subset(dat,dat$Date=="1/2/2007" | dat$Date=="2/2/2007")
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Sub_metering_3<-as.numeric(data$Sub_metering_3)

png("plot3.png",width = 480, height = 480)
with(data, plot(DateTime, Sub_metering_1, type="l", xlab="Day", ylab="Energy sub metering"))
with(data,lines(DateTime, Sub_metering_2,type="l", col= "red"))
with(data,lines(DateTime, Sub_metering_3,type="l", col= "blue"))
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
dev.off()
