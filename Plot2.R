dat<-read.table("household_power_consumption.txt",header = TRUE, sep=';')


dat$DateTime <- strptime(paste(dat$Date, dat$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data<-subset(dat,dat$Date=="1/2/2007" | dat$Date=="2/2/2007")
data$Global_active_power<-as.numeric(data$Global_active_power)

png("plot2.png",width = 480, height = 480)
with(data,plot(DateTime,Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()