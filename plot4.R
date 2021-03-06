######### Course Project 1 - Explanatory data analysis ########
## Plot 4

		## read and subset dataset ##

data<-read.table("./data/household_power_consumption.txt", header=TRUE, 
	 sep=";",na = "?",
	 colClasses = c("character", "character", rep("numeric",7)))

subdata<-data[data$Date %in% c("1/2/2007","2/2/2007"),]


	## convert date and time

date_time<-paste(subdata$Date,subdata$Time) #join the two columns

Newsubdata<-cbind(date_time,subdata)

Newsubdata$date_time<-strptime(Newsubdata$date_time,"%d/%m/%Y %H:%M:%S")

Sys.setlocale("LC_TIME", "English") #change to english language

	## Plot 4

par(mfrow=c(2,2), oma=c(1,1,0,0), mar=c(4,4,2,3))
plot(Newsubdata$date_time, Newsubdata$Global_active_power,
	type="l", xlab="", ylab="Global Active Power")
plot(Newsubdata$date_time, Newsubdata$Voltage,
	type="l", xlab="datetime", ylab="Voltage")
plot(Newsubdata$date_time, Newsubdata[,8],type="l", 
		col=1, xlab="", ylab="Energy sub metering" )
lines(Newsubdata$date_time, Newsubdata[,9],type="l", col=2)
lines(Newsubdata$date_time, Newsubdata[,10],type="l",col=4)
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
	col=c(1,2,4), lwd=1, cex=0.6, box.col="transparent")
plot(Newsubdata$date_time, Newsubdata$Global_reactive_power,
	type="l", xlab="datetime", ylab="Global_reactive_power",
	ylim=c(0.0,0.5))
dev.copy(png,file="plot4.png", width = 480, height = 480, units = "px") #copy the plot
dev.off()

