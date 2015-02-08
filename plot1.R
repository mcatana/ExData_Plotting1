fd<-fread("household_power_consumption.txt",";",na.strings=c("?"))
fd$Date <-as.Date(fd$Date,"%d/%m/%Y")
rows <- fd$Date >= as.Date("2007-02-01") & fd$Date <= as.Date("2007-02-02")
dataPlot1 <- fd[rows, ]
hist(as.numeric(dataPlot1$Global_active_power), col="red",main="Global active power",
     xlab="Global active power (kilowatts)", ylim=c(0,1200))
dev.copy(png,'plot1.png')
dev.off()
