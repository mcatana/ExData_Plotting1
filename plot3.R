fd<-fread("household_power_consumption.txt",";",na.strings=c("?"))
fd$Date <-as.Date(fd$Date,"%d/%m/%Y")
rows <- fd$Date >= as.Date("2007-02-01") & fd$Date <= as.Date("2007-02-02")
dataPlot1 <- fd[rows, ]
dtime<-as.POSIXct(paste(dataPlot1$Date, dataPlot1$Time), format="%Y-%m-%d %H:%M:%S")


plot(dtime,as.numeric(dataPlot1$Sub_metering_1),
     type='l', xlab='', ylab='Energy sub metering', col='black')
lines(dtime,as.numeric(dataPlot1$Sub_metering_2),
     type='l', col='red')
lines(dtime,as.numeric(dataPlot1$Sub_metering_3),
      type='l', col='blue')
legend("topright",  legend = c(
         "Sub_metering_1","Sub_metering_2","Sub_metering_3") , cex=0.5, pt.cex = 1.5,
       col = c("black","blue","red"), lty=1, xjust = 1, yjust = 1)

dev.copy(png,'plot3.png')
dev.off()
