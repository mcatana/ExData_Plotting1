fd<-fread("household_power_consumption.txt",";",na.strings=c("?"))
fd$Date <-as.Date(fd$Date,"%d/%m/%Y")
rows <- fd$Date >= as.Date("2007-02-01") & fd$Date <= as.Date("2007-02-02")
dataPlot1 <- fd[rows, ]

plot(as.POSIXct(paste(dataPlot1$Date, dataPlot1$Time), format="%Y-%m-%d %H:%M:%S"),as.numeric(dataPlot1$Global_active_power),
     type='l', xlab='', ylab='Global Active Power (kilowatts)')

dev.copy(png,'plot2.png')
dev.off()

