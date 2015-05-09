######### Course Project 1 - Explanatory data analysis ########
## Plot 3

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

	## Plot 3

par(bg="transparent", mar=c(5,6,4,4))
plot(Newsubdata$date_time, Newsubdata[,8],type="l", 
		col=1, xlab="", ylab="Energy sub metering" )
lines(Newsubdata$date_time, Newsubdata[,9],type="l", col=2)
lines(Newsubdata$date_time, Newsubdata[,10],type="l",col=4)
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
	col=c(1,2,4), lwd=1, cex=0.8)
dev.copy(png,file="plot3.png", width = 480, height = 480, units = "px") #copy the plot
dev.off()

