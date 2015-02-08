fd<-fread("household_power_consumption.txt",";",na.strings=c("?"))
fd$Date <-as.Date(fd$Date,"%d/%m/%Y")
rows <- fd$Date >= as.Date("2007-02-01") & fd$Date <= as.Date("2007-02-02")
dataPlot1 <- fd[rows, ]
dtime<-as.POSIXct(paste(dataPlot1$Date, dataPlot1$Time), format="%Y-%m-%d %H:%M:%S")
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(dataPlot1,{
     plot(dtime,as.numeric(dataPlot1$Global_active_power),
     type='l', xlab='', ylab='Global Active Power')
     plot(dtime,as.numeric(dataPlot1$Voltage),
          type='l', xlab='datetime', ylab='Voltage')
     plot(dtime,as.numeric(dataPlot1$Sub_metering_1),
          type='l', xlab='', ylab='Energy sub metering', col='black')
     lines(dtime,as.numeric(dataPlot1$Sub_metering_2),
           type='l', col='red')
     lines(dtime,as.numeric(dataPlot1$Sub_metering_3),
           type='l', col='blue')
     plot(dtime,as.numeric(dataPlot1$Global_reactive_power),
          type='l', xlab='datetime', ylab='Global_reactive_power')
}
)
dev.copy(png,'plot4.png')
dev.off()