######### Course Project 1 - Explanatory data analysis ########
## Plot 1

		## read and subset dataset ##

data<-read.table("./data/household_power_consumption.txt", header=TRUE, 
	 sep=";",na = "?",
	 colClasses = c("character", "character", rep("numeric",7)))

subdata<-data[data$Date %in% c("1/2/2007","2/2/2007"),]


	## convert date and time

date_time<-paste(subdata$Date,subdata$Time) #join the two columns

Newsubdata<-cbind(date_time,subdata)

Newsubdata$date_time<-strptime(Newsubdata$date_time,"%d/%m/%Y %H:%M:%S")


	##Plot 1

par(bg="transparent", mar=c(6,6,5,3))
hist(Newsubdata$Global_active_power,
	col="orange2",
	breaks=12,
	ylim=c(0,1200), 
	main="Global Active Power", 
	xlab="Global Active Power (kilowatts)",
	col.main="black", col.lab="black",
	cex.main=1.2, cex.lab=1.0, 
	#font.main=4, font.lab=3
)
dev.copy(png,file="plot1.png",width = 480, height = 480, units = "px") #copy the plot
dev.off()
