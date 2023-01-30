dat<-read.table("household_power_consumption.txt",header = TRUE, sep=';')


dat$DateTime <- strptime(paste(dat$Date, dat$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data<-subset(dat,dat$Date=="1/2/2007" | dat$Date=="2/2/2007")
data$Global_active_power<-as.numeric(data$Global_active_power)


png("plot1.png",width = 480, height = 480)
hist(data$Global_active_power,col="red",xlab = "Global Active Power (Kilowatts)",main="Global Active Power")
dev.off()
